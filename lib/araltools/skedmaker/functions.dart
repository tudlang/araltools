// Copyright (C) 2023 Tudlang
//
// This file is part of AralTools.
//
// AralTools is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// AralTools is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with AralTools.  If not, see <http://www.gnu.org/licenses/>.

import 'dart:async';
import 'dart:isolate';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart';

import '/utils.dart';
import 'classes.dart';

List<Offering> parse(String htmlTable) {
  final table = parseFragment(htmlTable).children[0].children[0];

  final out = <Offering>[];

  final random = Random();
  // add the same color for the subject
  final color = HSLColor.fromAHSL(
    1,
    random.nextInt(45) * 8.0,
    (random.nextDouble() * 0.6 + 0.3),
    (1 - (random.nextDouble() * 0.6 + 0.3)),
  ).toColor();

  for (var tr in table.children) {
    if (tr == table.children.first) continue;

    Offering offering;

    if (tr.children.length != 1 && tr.children[0].text.trim().isNotEmpty) {
      // START OF A NEW ROW
      offering = Offering(
        color: color,
      )
        ..classNumber = tr.children[0].text.trim().toInt()
        ..subject = tr.children[1].text.trim()
        ..section = tr.children[2].text.trim()
        ..slotCapacity = tr.children[6].text.toInt()
        ..slotTaken = tr.children[7].text.toInt()
        ..room = tr.children[5].text.trim()
        ..scheduleTime = tr.children[4].text.trim()
        ..scheduleDay = ScheduleDay.fromRow(
          code: tr.children[3].text.trim(),
          remarks: tr.children[8].text.trim(),
          hasRoom: tr.children[5].text.trim().isNotEmpty,
        )
        ..isClosed = tr.querySelector('font[color="#0099CC"]') != null;

      out.add(offering);
    } else if (tr.children[0].text.trim().isEmpty) {
      // IF CLASSNBR IS EMPTY, THEN IT'S JUST ANOTHER DAY OF SAME ROW
      offering = out.last;
      offering.scheduleDay = ScheduleDay.refine(
        offering.scheduleDay,
        code: tr.children[3].text.trim(),
        hasRoom: tr.children[5].text.trim().isNotEmpty,
      );
      // if it's onlineface, then the room listing is in this iteration, so save that in
      if (offering.scheduleDay == ScheduleDay.tuesdayfridayOnlineface ||
          offering.scheduleDay == ScheduleDay.mondaythursdayOnlineface ||
          offering.scheduleDay == ScheduleDay.wednesdaysaturdayOnlineface) {
        offering.room = tr.children[5].text.trim();
      }
    } else {
      // IF CLASSNBR IS NOT EMPTY, THEN IT'S NAME OF PROF
      offering = out.last;
      offering.teacher = tr.children.first.text.trim();
    }

    //print(offering);
    //print("..");
  }

  return out;
}

void generageSchedulesIsolate(
    ({
      Map<String, List<Offering>> subjects,
      SendPort sendport,
      Map<String, Map<String, dynamic>> filters
    }) arg) {
  final sendPort = arg.sendport;
  final filters = arg.filters;

  //bool isPaused = subjectsEncoded['isPaused'];

  /*void wait(){
    if (isPaused) {Future.delayed(const Duration(seconds: 5)).then((_)=>
      wait()
    );}
  }*/

  //final p = ReceivePort();

  // send the isolate's sendport for communication
  //sendPort.send(p.sendPort);

  //p.listen((message) {
  //  if (message['isPaused']) {isPaused=true;wait();} else {isPaused=false;}
  //});

  // Recursive function
  // types:
  // Map<String, List<Offering>> subjectsCurrent, List<Offering> offeringsCurrent
  Future<void> generateCombination(Map<String, List<Offering>> subjectsCurrent,
      List<Offering> offeringsCurrent) async {
    if (subjectsCurrent.isEmpty) {
      // Base case: All entries processed, add combination to list

      try {
        final week = ScheduleWeek();

        // attempt to add the list of offerings to a weekly schedule
        for (final offering in offeringsCurrent) {
          week.add(offering);
        }

        // filter checker for each day
        for (final day in const [
          ('monday', 'M', 0),
          ('tuesday', 'T', 1),
          ('wednesday', 'W', 2),
          ('thursday', 'H', 3),
          ('friday', 'F', 4),
          ('saturday', 'S', 5),
        ]) {
          // offering of the day
          final offeringDay = week.daysOfferings[day.$3]!.toList();

          // check for number of subjects for the day
          if (filters['day']!['${day.$1}MaxNumberOfSubjects'] != -1) {
            if (offeringDay.length >
                filters['day']!['${day.$1}MaxNumberOfSubjects'] - 0) {
              throw InvalidScheduleError();
            }
          }

          // check for first subject
          if (filters['day']!['${day.$1}StartWithSubject'] != 'any') {
            if (offeringDay.first.subject !=
                filters['day']!['${day.$1}StartWithSubject']) {
              throw InvalidScheduleError();
            }
          }
          // check for last subject
          if (filters['day']!['${day.$1}EndWithSubject'] != 'any') {
            if (offeringDay.last.subject !=
                filters['day']!['${day.$1}EndWithSubject']) {
              throw InvalidScheduleError();
            }
          }

          // interval checker
          //if ((week.daysOfferings[day.$3]!.first.scheduleTimeStart <
          //        filters['day']!['${day.$1}TimeInterval']['start']) ||
          //    (week.daysOfferings[day.$3]!.last.scheduleTimeStart >
          //        filters['day']!['${day.$1}TimeInterval1']['end'])) {
          //  throw Error();
          //}

          // location cheker
          offeringDay.forEachIndexed((index, element) {
            if (index == 0) return; //skip if first

            // if the next subject is within the checking distance time gap
            final elementBefore = offeringDay.elementAt(index - 1);

            if (element.scheduleTimeStart - elementBefore.scheduleTimeEnd <=
                filters['location']!["checkingDistanceMinutes"]) {
              final distance = LocationFunctions.getLocationDistance(
                  elementBefore.room, element.room);

              if (distance > filters['location']!['maxAllowedDistanceMeters']) {
                throw InvalidScheduleError();
              }
            }
          });
        }

        // Send the completed schedule to main thread
        sendPort.send(week);
        print(week.identifierString);
      } on InvalidScheduleError {
        return;
      }
      return;
    }

    String subject = subjectsCurrent.keys.first;

    // Iterate over each Offering in the current entry
    for (Offering currentOffering in subjectsCurrent[subject]!) {
      // ===== Check for filters here

      if ((filters['offerings']!['includeClosed'] == false &&
              currentOffering.isClosed == true) ||
          (filters['offerings']!['includeFullSlots'] == false &&
              currentOffering.slotTaken >= currentOffering.slotCapacity) ||
          (filters['offerings']!['includeUnknownModality'] == false &&
              currentOffering.scheduleDay.name.contains('nknown')) ||
          (filters['offerings']!['includeNoProfessors'] == false &&
              currentOffering.teacher.isEmpty)) {
        continue;
      }

      // day-specific checker
      // this uses a try-catch block to immediately skip to `continue` if something is filtered
      try {
        final scheduleDay = currentOffering.scheduleDay;

        for (final day in const [
          ('monday', 'M'),
          ('tuesday', 'T'),
          ('wednesday', 'W'),
          ('thursday', 'H'),
          ('friday', 'F'),
          ('saturday', 'S'),
        ]) {
          // skips if `currentOffering` is not `day`
          if (!scheduleDay.daycode.contains(day.$2)) continue;

          //modality checker
          if (filters['day']!['${day.$1}Modality'] != 'hybrid') {
            // todo add modality checker
            //if (!scheduleDay.name
            //    .toLowerCase()
            //    .contains(filters['day']!["${day.$1}Modality"])) {
            //  throw Error();
            //}
          }
        }
      } on InvalidScheduleError {
        continue;
      }

      // ===== All filters passed

      // Create a copy of the current combination
      final updatedCombination = List<Offering>.from(offeringsCurrent);
      updatedCombination.add(currentOffering);

      // Create a copy of the current map without the processed entry
      final updatedMap = Map<String, List<Offering>>.from(subjectsCurrent);
      updatedMap.remove(subject);

      // Recursively generate combinations for the updated map and combination
      generateCombination(updatedMap, updatedCombination);
    }
  }

  generateCombination(arg.subjects, []).then((value) {
    //processing is done
    sendPort.send(null);
  });
}

Stream<ScheduleWeek> generateSchedules({
  required Map<String, List<Offering>> subjects,
  required ScheduleFilters filters,
}) {

  late StreamController<ScheduleWeek> controller;

  final p = ReceivePort();

  late Isolate isolate;

  Isolate.spawn<
      ({
        Map<String, List<Offering>> subjects,
        SendPort sendport,
        Map<String, Map<String, dynamic>> filters
      })>(generageSchedulesIsolate, (
    subjects: subjects,
    sendport: p.sendPort,
    filters: filters.toMap()
  )).then((value) {
    isolate = value;
  });

  Capability capability = Capability();

  controller = StreamController<ScheduleWeek>(
    onListen: () async {
      // recieve decoded Map
      int outputtedWeeks = 0;
      await for (ScheduleWeek? week in p) {
        if (week == null) break; //stop the stream if done
        week.name = "Schedule ${++outputtedWeeks}";
        controller.add(week);
      }
      controller.close();
    },
    onPause: () {
      isolate.pause(capability);
    },
    onResume: () {
      isolate.resume(capability);
    },
    onCancel: () {
      isolate.kill(priority: Isolate.immediate);
    },
  );

  return controller.stream;
}

class InvalidScheduleError extends Error {}

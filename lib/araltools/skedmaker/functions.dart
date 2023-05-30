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

import 'package:collection/collection.dart';
import 'package:directed_graph/directed_graph.dart';
import 'package:html/parser.dart';
import 'package:stream_isolate/stream_isolate.dart';

import 'package:async/async.dart';

import 'classes.dart';

List<Offering> parse(String htmlTable) {
  final table = parseFragment(htmlTable).children[0].children[0];

  final out = <Offering>[];

  for (var tr in table.children) {
    if (tr == table.children.first) continue;

    Offering offering;

    if (tr.children.length != 1 && tr.children[0].text.trim().isNotEmpty) {
      // START OF A NEW ROW
      offering = Offering()
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
        ..isClosed = tr.querySelector('font[color="#0099CC"]')!=null;

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

// actual type:
// Stream<Map> generageSchedulesIsolate(Map<String, List<Map>> subjectsEncoded)
void generageSchedulesIsolate(dynamic subjectsEncoded) {
  final sendPort = (subjectsEncoded['sendport'] as SendPort);
  subjectsEncoded.remove('sendport');

  // Recursive function
  // The [List<Map>] is an encoded [List<Offering>]
  // types:
  // Map<String, List<Map>> subjectsCurrent, List<Map> offeringsCurrent
  void generateCombination(Map subjectsCurrent, List<Map> offeringsCurrent) {
    if (subjectsCurrent.isEmpty) {
      // Base case: All entries processed, add combination to list

      try {
        final week = ScheduleWeek();
        for (final offering in offeringsCurrent) {
          week.add(Offering.fromMap(offering));
        }
        //controller.add(week.toMap());
        sendPort.send(week.toMap());
        print(week.identifierString);
      } catch (e) {
        return;
      }
      return;
    }

    String subject = subjectsCurrent.keys.first;

    // Iterate over each Offering in the current entry
    for (final currentOffering in subjectsCurrent[subject]!) {
      // Create a copy of the current combination
      final updatedCombination = List<Map>.from(offeringsCurrent);
      updatedCombination.add(currentOffering);

      // Create a copy of the current map without the processed entry
      final updatedMap = Map<String, List<Map>>.from(subjectsCurrent);
      updatedMap.remove(subject);

      // Recursively generate combinations for the updated map and combination
      generateCombination(updatedMap, updatedCombination);
    }
  }

  generateCombination(subjectsEncoded, []);

  //processing is done
  sendPort.send(null);

}

Stream<ScheduleWeek> generageSchedules(
    Map<String, List<Offering>> subjects) async* {
  final subjectsEncoded = subjects.map<String, dynamic>(
      (key, value) => MapEntry(key, value.map((e) => e.toMap()).toList()));

  final p = ReceivePort();
  await Isolate.spawn(
      generageSchedulesIsolate, subjectsEncoded..['sendport'] = p.sendPort);

  // recieve decoded Map
  int outputtedWeeks = 0;
  await for (final map in p) {
    if (map == null) return; //stop the stream if done
    final week = ScheduleWeek.fromMap(map);
    week.name = "Schedule ${++outputtedWeeks}";
    yield week;
  }

}

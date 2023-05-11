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

import 'package:collection/collection.dart';
import 'package:directed_graph/directed_graph.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';

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
        );

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

/*
var graph = WeightedDirectedGraph(
  {},
  summation: (left, right) => left,
  zero: 0,
);
*/

List<Map> _generateSchedules(Map args) {
  //Convert back to readable format
  final Set<String> subjects = args['subjects'];
  Iterable<Offering> all =
      (args['all'] as Iterable).map((e) => Offering.fromMap(e));

  final graphWeek = generateGraphForWeek(all);

  final startpoint = graphWeek
      .firstWhereOrNull((e) => e.toMap().toString() == args['startpoint']);

  final output = <Map>[];
  if (startpoint == null) return output;
  print("$startpoint ${graphWeek.reachableVertices(startpoint).length}");

  for (OfferingDay endpoint in graphWeek.reachableVertices(startpoint)) {
    if (startpoint.conflictsWith(endpoint) ||
        !graphWeek.edgeExists(startpoint, endpoint)) {
      //print('Cannot be $startpoint to $endpoint');
      continue;
    }

    //print("Considering $startpoint to $endpoint");
    final path = graphWeek.crawler.path(startpoint, endpoint);
    final out =
        ScheduleWeek.fromList(path, weight: graphWeek.weightAlong(path));

    //yield out;

    if (!out.subjects.containsAll(subjects)) continue;
    if (out.isValid) {
      //RETURN OUT
      //controller.add(out);
      //yield out;
      output.add(out.toMap());
      //return [out.toMap()];
      print("Added sched ${out.identifierString}: ${out.subjects}");
    } else {
      print("Revoked ${out.identifierString}: ${out.subjects}");
    }
  }
  //return [];
  return output;
}

Stream<ScheduleWeek> generageSchedules(
    List<Offering> all, Set<String> subjects) {
  final graphWeek = generateGraphForWeek(all);

  late final StreamController<ScheduleWeek> controller;

  // TODO add pausing and cancellng functionality
  controller = StreamController<ScheduleWeek>(
    onListen: () async {
      for (final startpoint in graphWeek.vertices) {
        print(startpoint);
        final encodedOutput = await compute(_generateSchedules, {
          'subjects': subjects,
          'all': all.map((e) => e.toMap()),
          'startpoint': startpoint.toMap().toString(),
        });

        final decodedOutput = encodedOutput.map(ScheduleWeek.fromMap);

        print('Outputted from isolate: ${decodedOutput.length}');

        for (final i in decodedOutput.toSet()) {
          controller.add(i);
          //await Future.delayed(Duration(microseconds: 1));
        }
      }
      controller.close();
    },
    onCancel: () {
      controller.close();
    },
  );

  return controller.stream;

  //late StreamController<ScheduleWeek> controller;
/*
 for (final schedweek in await future){
        print('recieved from isolate');
        //controller.add(schedweek);
//yield schedweek;
      }*/

  //return Stream.fromFuture(future);

  //controller = StreamController<ScheduleWeek>(onListen: () async  {});

  //return controller.stream;
}

WeightedDirectedGraph<Offering, double> generateGraphForDay(OfferingDay list) {
  // generate graph based on list
  final graph = WeightedDirectedGraph<Offering, double>(
    {
      for (var element in list)
        element: element.generateWeighedGraph(list)
          ..removeWhere((key, value) =>
              key.isBefore(element) ||
              key.isConflicting(element) ||
              key.subject == element.subject),
    },
    summation: (a, b) => a + b,
    zero: 0,
  );

  return graph;
}

/// [graph]: the graph that contains the schedules for that day
///
/// [list]: the list of all offerings for that day
Map<OfferingDay, double> getPossibleSchedules(
  WeightedDirectedGraph<Offering, double> graph,
  OfferingDay list, {
  bool Function(List<Offering> daysched)? toExclude,
}) {
  Map<OfferingDay, double> output = {};

  if (graph.weight == 0) {
    return Map.fromEntries(
      list.map((e) => MapEntry(OfferingDay.single(list.daycode, e), 0)),
    );
  }

  for (var element in list) {
    output.addEntries(graph.crawler.tree(element).map((e) =>
        MapEntry(OfferingDay(list.daycode, list: e), graph.weightAlong(e))));
  }

  //if (list.length == 1) return {list: 0};

/*
  for (var element in list) {


    // iterate over non-conflicting non-duplicate offerrings
    for (var element2 in list.toList()
      ..removeWhere(
        (e) =>
            e.subject == element.subject ||
            e.isBefore(element) ||
            e.isConflicting(element),
      )) {
      //  print("\n-------------\nFOR $element to $element2");

      var a = graph.paths(element, element2);

      a.removeWhere((e) {
        if (e.isEmpty) return true;
        if (toExclude != null && toExclude(e)) return true;

        //REMOVE LISTS WITH DUPLICATE SUBJECTS
        final a = LinkedHashSet<Offering>(
            equals: (p0, p1) => p0.subject == p1.subject,
            hashCode: (p0) => p0.subject.hashCode);
        a.addAll(e);
        // if the set length is shorter than list length, then there are duplicate subjects
        // so we remove them
        return a.length < e.length;
      });

      if (a.isEmpty) {
        return {
          [element, element2]: graph.weightAlong([element, element2])
        };
      }

      output.addEntries(a.map((e) => MapEntry(e, graph.weightAlong(e))));
    }
  }
  */

  return output;
}

WeightedDirectedGraph<OfferingDay, double> generateGraphForWeek(
    Iterable<Offering> all) {
  OfferingDay getOfferringsFromDay(String daycode) {
    return OfferingDay(
      daycode,
      list: all
          .where((e) => RegExp(daycode).hasMatch(e.scheduleDay.daycode))
          .toList(),
    );
  }

  final listM = getOfferringsFromDay('M');
  final graphM = generateGraphForDay(listM);
  final schedM = getPossibleSchedules(graphM, listM);

  final listT = getOfferringsFromDay('T');
  final graphT = generateGraphForDay(listT);
  final schedT = getPossibleSchedules(graphT, listT);

  final listW = getOfferringsFromDay('W');
  final graphW = generateGraphForDay(listW);
  final schedW = getPossibleSchedules(graphW, listW);

  final listH = getOfferringsFromDay('H');
  final graphH = generateGraphForDay(listH);
  final schedH = getPossibleSchedules(graphH, listH);

  final listF = getOfferringsFromDay('F');
  final graphF = generateGraphForDay(listF);
  final schedF = getPossibleSchedules(graphF, listF);

  final listS = getOfferringsFromDay('S');
  final graphS = generateGraphForDay(listS);
  final schedS = getPossibleSchedules(graphS, listS);

/*
  final maxNumber = [
    schedM.length,
    schedT.length,
    schedW.length,
    schedH.length,
    schedF.length,
    schedS.length
  ].reduce(max);
*/

  final graphWeekData = {
    for (OfferingDay _schedM in schedM.keys)
      _schedM: {
        ...schedT,
        ...schedW,
        ...schedH,
        ...schedF,
        ...schedS,
      }..removeWhere((key, value) => _schedM.conflictsWith(key)),
    for (OfferingDay _schedT in schedT.keys)
      _schedT: {
        ...schedW,
        ...schedH,
        ...schedF,
        ...schedS,
      }..removeWhere((key, value) => _schedT.conflictsWith(key)),
    for (OfferingDay _schedW in schedW.keys)
      _schedW: {
        ...schedH,
        ...schedF,
        ...schedS,
      }..removeWhere((key, value) => _schedW.conflictsWith(key)),
    for (OfferingDay _schedH in schedH.keys)
      _schedH: {
        ...schedF,
        ...schedS,
      }..removeWhere((key, value) => _schedH.conflictsWith(key)),
    for (OfferingDay _schedF in schedF.keys)
      _schedF: schedS..removeWhere((key, value) => _schedF.conflictsWith(key)),
  };
  final graphWeek = WeightedDirectedGraph<OfferingDay, double>(
    graphWeekData,
    summation: (a, b) => a + b,
    zero: 0,
  );

  print("Generated graph ${graphWeek.length}");

  return graphWeek;
}

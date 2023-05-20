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


Stream<ScheduleWeek> generageSchedules(
    Map<String, List<Offering>> subjects) {
  
late final StreamController<ScheduleWeek> controller;

  void generateCombination(Map<String, List<Offering>> currentMap,
      List<Offering> currentCombination) {
    if (currentMap.isEmpty) {
      // Base case: All entries processed, add the combination to the list

      try {
        final week = ScheduleWeek();
        for (final offering in currentCombination) {
          week.add(offering);
        }
        controller.add(week);
      } catch (e) {
        return;
      }
      return;
    }

    String currentKey = currentMap.keys.first;
    List<Offering> currentValues = currentMap[currentKey]!;

    // Iterate over each Offering in the current entry
    for (final currentOffering in currentValues) {
      // Create a copy of the current combination
      final updatedCombination = List<Offering>.from(currentCombination);
      updatedCombination.add(currentOffering);

      // Create a copy of the current map without the processed entry
      final updatedMap = Map<String, List<Offering>>.from(currentMap);
      updatedMap.remove(currentKey);

      // Recursively generate combinations for the updated map and combination
      generateCombination(updatedMap, updatedCombination);
    }
  }

  controller = StreamController(
    onListen: () {
      generateCombination(subjects, []);
    },
  );
  return controller.stream;


}

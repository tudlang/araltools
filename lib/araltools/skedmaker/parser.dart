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


import 'dart:math';

import '/utils.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'classes.dart';

List<Offering> parse(String htmlTable) {
  final table = parseFragment(htmlTable).children[0].children[0];

  final out = <Offering>[];

  final random = Random();
  // add the same color for the subject
  final color = HSLColor.fromAHSL(
    1,
    random.nextInt(45) * 8.0,
    random.nextDouble() * 0.6 + 0.3,
    1 - (random.nextDouble() * 0.6 + 0.3),
  ).toColor();

  for (var tr in table.children) {
    if (tr == table.children.first) continue;

    Offering offering;

    if (tr.children.length != 1 && tr.children[0].text.trim().isNotEmpty) {
      // START OF A NEW ROW
      offering = Offering(
        color: color,
        classNumber: tr.children[0].text.trim().toInt(),
        subject: tr.children[1].text.trim(),
        section: tr.children[2].text.trim(),
        room: tr.children[5].text.trim(),
        scheduleDay: ScheduleDay.fromRow(
          code: tr.children[3].text.trim(),
          remarks: tr.children[8].text.trim(),
          hasRoom: tr.children[5].text.trim().isNotEmpty,
        ),
        isClosed: tr.querySelector('font[color="#0099CC"]') != null,
        slotCapacity: tr.children[6].text.toInt(),
        slotTaken: tr.children[7].text.toInt(),
      )..scheduleTime = tr.children[4].text.trim();

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
  }

  return out;
}

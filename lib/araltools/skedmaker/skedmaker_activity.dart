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

import 'dart:io';

import 'package:araltools/utils.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:provider/provider.dart';
import 'package:timetable_view/timetable_view.dart';

import 'classes.dart';
// ignore: unused_import
import 'connection.dart';
import 'functions.dart';
import '/strings.g.dart';
import 'models.dart';
// Here contains hardcoded HTML of the "View course offerrings" table, used for testing
// ignore: unused_import
import 'test_tables.dart';
import 'windows/ui.dart';

class SkedmakerActivity extends StatefulWidget {
  const SkedmakerActivity({super.key});

  @override
  State<SkedmakerActivity> createState() => _SkedmakerActivityState();
}

class _SkedmakerActivityState extends State<SkedmakerActivity> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SkedmakerModel>(
        create: (context) => SkedmakerModel(),
        child: switch (Platform.operatingSystem) {
          'windows' => SkedmakerActivityWindows(),
          _ => throw UnsupportedError("OS unsupported")
        });
  }
}
/*
 MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
          dividerPainter: DividerPainters.grooved1(
            backgroundColor: Colors.grey[350],
            color: Colors.indigo[100]!,
            highlightedColor: Colors.indigo[900]!,
          ),
        ),
        child: MultiSplitView(
          initialAreas: [Area(weight: 0.3)],
          axis: Axis.horizontal,
          children: [
            MultiSplitView(
              initialAreas: [Area(weight: 0.3)],
              axis: Axis.vertical,
              children: [
                SubjectsFragment(),
                SchedulesFragment(),
              ],
            ),
            TimetableFragment(),
          ],
        ),
      ), */

class TimetableFragment extends StatelessWidget {
  const TimetableFragment({super.key, this.week});
  final ScheduleWeek? week;

  @override
  Widget build(BuildContext context) {
    var data = week ?? context.watch<SkedmakerModel>().schedulesSelected;

    if (data == null) return Container();

    final theme = Theme.of(context);
    return TimetableView(
      timetableStyle: TimetableStyle(
        laneWidth: 110,
        timeItemHeight: 50,
        startHour: 7,
        endHour: 21,
        mainBackgroundColor: Color(0xfff3f3f3),
        laneColor: Color(0xfff3f3f3),
        cornerColor: Color(0xfff3f3f3),
        timelineColor: Color(0xfff3f3f3),
        timelineItemColor: Color(0xfff3f3f3),
      ),
      laneEventsList: [
        for (final day in ScheduleWeek.daycodes)
          LaneEvents(
            lane: Lane(
              name: day,
              laneIndex: 1,
              backgroundColor: Color(0xfff3f3f3),
            ),
            events: data.daysOfferings[ScheduleWeek.dayFromCode(day)]!
                .map((e) => TableEvent(
                      location: "${e.room}\n",
                      title: "${e.subject} - ${e.section} \n",
                      eventId: e.classNumber,
                      laneIndex: 1,
                      startTime: t(e.scheduleTimeStart),
                      endTime: t(e.scheduleTimeEnd),
                      backgroundColor: e.color,
                    ))
                .toList(),
          )
      ],
      onEmptySlotTap: (laneIndex, start, end) {},
      onEventTap: (event) {},
    );
  }

  ///converts 24hour time format to a [TableEventTime]
  TableEventTime t(int time24) => TableEventTime(
        hour: (time24 / 100).floor(),
        minute: int.parse("${(time24 / 10).floor() % 10}${time24 % 10}"),
      );
}

class SubjectText extends StatelessWidget {
  const SubjectText({
    super.key,
    required this.offering,
  });
  final Offering offering;

  Widget get icon => Container(
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: offering.color,
        ),
        width: 10,
        height: 10,
      );

  Widget get text => Text(offering.subject);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8),
        text,
      ],
    );
  }
}

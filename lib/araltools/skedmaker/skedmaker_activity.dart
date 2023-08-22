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

import 'package:araltools/araltools/araltools.dart';
import 'package:araltools/araltools/skedmaker/import_xml.dart';
import 'package:araltools/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart'
    hide OutlinedButton, Colors, ListTile, Divider;
import 'package:flutter/material.dart' hide Card, showDialog, FilledButton;
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simple_timetable/simple_timetable.dart' hide SimpleTimetable;
import '../../strings.g.dart';
import '/opensource/timetable_view.dart';
import 'package:timetable_view/timetable_view.dart';
import 'package:path/path.dart' as path;

import 'classes.dart';
// ignore: unused_import
import 'connection.dart';
import 'export_xml.dart';
import 'models.dart';
// Here contains hardcoded HTML of the "View course offerrings" table, used for testing
// ignore: unused_import
import 'test_tables.dart';
import 'windows/ui.dart';
import 'windows/ui_schedules.dart';

late GlobalKey provider;

class SkedmakerActivity extends StatefulWidget {
  const SkedmakerActivity({super.key, this.path});

  /// When the app is launched from a .atsm file, [path] is the file path to the file. `null` if otherwise.
  final String? path;

  @override
  State<SkedmakerActivity> createState() => _SkedmakerActivityState();
}

class _SkedmakerActivityState extends State<SkedmakerActivity> {
  @override
  void initState() {
    super.initState();

    provider = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SkedmakerModel>(
      create: (context) {
        if (widget.path == null) return SkedmakerModel();

        return importXml(path: widget.path!);
      },
      child: onPlatform(
        all: null,
        windows: SkedmakerActivityWindows(
          key: provider,
        ),
      ),
    );
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
            events: data.daysOfferings[day]!
                .map((e) => TableEvent(
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.all(2),
                    location: "${e.room}\n",
                    title: "${e.subject} - ${e.section} \n",
                    eventId: e.classNumber,
                    laneIndex: 1,
                    startTime: t(e.scheduleTime.start),
                    endTime: t(e.scheduleTime.end),
                    backgroundColor: e.color,
                    textStyle: TextStyle(
                      color: e.color.basedOnLuminance(),
                    )))
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

class Timetable2Fragment extends StatefulWidget {
  const Timetable2Fragment({
    super.key,
    this.week,
    this.currentlyHovered,
  });

  final ScheduleWeek? week;
  final ValueNotifier<Offering?>? currentlyHovered;

  @override
  State<Timetable2Fragment> createState() => _Timetable2FragmentState();
}

class _Timetable2FragmentState extends State<Timetable2Fragment> {
  @override
  Widget build(BuildContext context) {
    if (widget.week == null) return Container();

    return SimpleTimetable(
      initialDate: DateTime(1970, 1, 2),
      visibleRange: 6,
      visibleTimeline: false,
      dayStart: 7,
      nextButton: SizedBox.shrink(),
      prevButton: SizedBox.shrink(),
      events: [
        for (final day in [
          ("M", DateTime(1970, 1, 2)),
          ("T", DateTime(1970, 1, 3)),
          ("W", DateTime(1970, 1, 4)),
          ("H", DateTime(1970, 1, 5)),
          ("F", DateTime(1970, 1, 6)),
          ("S", DateTime(1970, 1, 7)),
        ])
          ...widget.week!.daysOfferings[day.$1]!
              .map((e) => Event(
                  id: e.toString(),
                  start: day.$2.add(Duration(
                      hours: (e.scheduleTime.start / 100).floor(),
                      minutes: e.scheduleTime.start % 100)),
                  end: day.$2.add(Duration(
                      hours: (e.scheduleTime.end / 100).floor(),
                      minutes: e.scheduleTime.end % 100)),
                  date: day.$2,
                  payload: e))
              .toList()
      ],
      buildCard: (event, isPast) {
        final offering = event.payload!;
        final bg =
            HSLColor.fromColor(offering.color).withLightness(0.75).toColor();
        return parentOrChild(
          condition: widget.currentlyHovered != null,
          parent: (child) {
            return MouseRegion(
              onEnter: (event) {
                widget.currentlyHovered!.value = offering;
              },
              onExit: (event) {
                setState(() {
                  widget.currentlyHovered!.value = null;
                });
              },
              child: Opacity(
                opacity: widget.currentlyHovered!.value != null &&
                        widget.currentlyHovered!.value!.subject ==
                            offering.subject
                    ? 1
                    : widget.currentlyHovered!.value != null
                        ? 0.3
                        : 1,
                child: child,
              ),
            );
          },
          child: Card(
            padding: EdgeInsets.all(2),
            backgroundColor: bg,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: offering.subject,
                    style: FluentTheme.of(context).typography.body!.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                TextSpan(
                    text: ' ' + offering.section + "\n",
                    style: FluentTheme.of(context).typography.body),
                TextSpan(
                    text:
                        "${offering.scheduleTime.start} - ${offering.scheduleTime.end}\n",
                    style: FluentTheme.of(context).typography.body),
                TextSpan(
                    text: offering.room,
                    style: FluentTheme.of(context).typography.body),
              ]),
            ),
          ),
        );
      },
      buildHeader: (date, isToday) {
        return Center(
          child: switch (date) {
            DateTime(day: final day) when day == 2 => Text('Monday'),
            DateTime(day: final day) when day == 3 => Text('Tuesday'),
            DateTime(day: final day) when day == 4 => Text('Wednesday'),
            DateTime(day: final day) when day == 5 => Text('Thrusday'),
            DateTime(day: final day) when day == 6 => Text('Friday'),
            DateTime(day: final day) when day == 7 => Text('Saturday'),
            _ => SizedBox.shrink()
          },
        );
      },
    );
  }
}

class SubjectText extends StatelessWidget {
  const SubjectText({
    super.key,
    required this.offering,
    this.style,
  });

  final Offering offering;
  final TextStyle? style;

  Widget get icon => Container(
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: offering.color,
        ),
        width: 10,
        height: 10,
      );

  Widget get text => Text(
        offering.subject,
        style: style,
      );

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

class SkedmakerDrawer extends StatefulWidget {
  const SkedmakerDrawer({super.key});

  @override
  State<SkedmakerDrawer> createState() => _SkedmakerDrawerState();
}

class _SkedmakerDrawerState extends State<SkedmakerDrawer> {
  @override
  Widget build(BuildContext context) {
    final model = provider.currentContext!.watch<SkedmakerModel>();
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
            ),
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return ContentDialog(
                          title: Text('Go back to main menu?'),
                          content: Text('All unsaved data will be lost.'),
                          actions: [
                            Button(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            FilledButton(
                              onPressed: () {
                                Navigator.pop(context);
                                GoRouter.of(context).go('/');
                              },
                              child: Text('OK'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 8),
                      Text('Back to home'),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  strings.general.app.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontFamily: 'Raleway'),
                ),
                Text(
                  AralTools.skedmaker.localizedName,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('New'),
            leading: Icon(MdiIcons.plusBoxOutline, size: 25),
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return ContentDialog(
                    title: Text('Create new project?'),
                    content: Text('All unsaved data will be lost.'),
                    actions: [
                      Button(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      FilledButton(
                        onPressed: () {
                          GoRouter.of(context)
                            ..pop()
                            ..pushReplacement(AralTools.skedmaker.route);
                        },
                        child: Text('OK'),
                      )
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: Text('Open...'),
            leading: Icon(Icons.open_in_new_outlined, size: 25),
            onTap: () async {
              final path = (await FilePicker.platform.pickFiles(
                dialogTitle: 'Open SkedMaker file',
                lockParentWindow: true,
                type: FileType.custom,
                allowedExtensions: ['atsm'],
              ))
                  ?.files
                  .single
                  .path;
              if (path == null) return;

              GoRouter.of(context)
                ..pop()
                ..pushReplacement(AralTools.skedmaker.route, extra: {
                  'path': path,
                });
            },
          ),
          ListTile(
            title: Text('Save'),
            leading: Icon(Icons.save_outlined, size: 25),
            onTap: () async {
              final model = provider.currentContext!.read<SkedmakerModel>();

              final newfile = await exportXml(model: model, path: model.path);

              if (newfile != null && model.path == null) {
                model.path = newfile.path;
              }

              if (newfile != null) {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            title: Text('Save as...'),
            leading: Icon(MdiIcons.contentSavePlusOutline, size: 25),
            onTap: () async {
              final model = provider.currentContext!.read<SkedmakerModel>();
              final newfile = await exportXml(model: model);

              if (newfile != null) {
                model.path = newfile.path;
              }
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Filename'),
            subtitle:
                SelectableText(path.basename(model.path ?? '').ifEmpty('-')),
          ),
          ListTile(
            title: Text('File location'),
            subtitle:
                SelectableText(path.dirname(model.path ?? '').ifEmpty('-')),
          ),
        ],
      ),
    );
  }
}

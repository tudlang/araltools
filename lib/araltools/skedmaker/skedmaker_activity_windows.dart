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

import 'package:flutter/material.dart';

import 'functions.dart';
import 'skedmaker_activity.dart';
import 'package:flutter/foundation.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'classes.dart';
import 'test_tables.dart';

class SkedmakerActivityWindows extends StatefulWidget {
  const SkedmakerActivityWindows({super.key});

  @override
  State<SkedmakerActivityWindows> createState() =>
      _SkedmakerActivityWindowsState();
}

class _SkedmakerActivityWindowsState extends State<SkedmakerActivityWindows> {
  late int paneIndex;

  @override
  void initState() {
    super.initState();
    paneIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      home: NavigationView(
        pane: NavigationPane(
          selected: paneIndex,
          onChanged: (index) {
            setState(() {
              paneIndex = index;
            });
          },
          displayMode: PaneDisplayMode.top,
          items: [
            PaneItem(
              icon: Icon(MdiIcons.schoolOutline),
              title: Text('Subjects'),
              body: SubjectsFragment(),
            ),
            PaneItem(
              icon: Icon(MdiIcons.filterOutline),
              title: Text('Filters'),
              body: Placeholder(),
            ),
            PaneItem(
              icon: Icon(MdiIcons.calendarBlankMultiple),
              title: Text('Schedules'),
              body: SchedulesFragment(),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectsFragment extends StatefulWidget {
  const SubjectsFragment({super.key});

  @override
  State<SubjectsFragment> createState() => _SubjectsFragmentState();
}

class _SubjectsFragmentState extends State<SubjectsFragment> {
  late int indexSubject;

  @override
  void initState() {
    super.initState();

    indexSubject = 0;
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SkedmakerModel>();

    return NavigationView(
      pane: NavigationPane(
        header: Text('asdsad'),
        selected: indexSubject,
        items: [
          for (final subject in model.subjects.entries)
            PaneItem(
              icon: Icon(MdiIcons.schoolOutline),
              title: Text(subject.key),
              body: SubjectsFragmentEdit(
                offerings: subject.value,
                subject: subject.key,
              ),
            ),
        ],
        onChanged: (index) {
          setState(() {
            indexSubject = index;
          });
        },
        footerItems: [
          PaneItem(
              icon: Icon(MdiIcons.plus),
              title: Text('Add'),
              body: Placeholder(),
              onTap: () {
                context.read<SkedmakerModel>()
                  // UNCOMMENT TO ADD MLS FUNCTIONALITY
                  //..addSubject(list.first.subject, list)
                  // THESE ARE FOR DEBUG PURPOSES, hardcoded test HTML tables
                  ..addSubject('CALENG2', parse(caleng2))
                  ..addSubject('LBYMF1C', parse(lbymf1c))
                  ..addSubject('LCLSONE', parse(lclsone))
                  ..addSubject('LBYMF1D', parse(lbymf1d))
                  ..addSubject('GEUSELF', parse(geuself))
                  ..addSubject('LCFAITH', parse(lcfaith))
                  ..addSubject('LCFILIA', parse(lcfilia))
                  ..addSubject('MFMCPR1', parse(mfmcpr1))
                  ..addSubject('LBBCH1A', parse(lbbch1a))
                  ..addSubject('ENGCHEM', parse(engchem))
                  ..addSubject('NSTPRO2', nstpro2);
              }),
        ],
      ),
    );
  }
}

class SubjectsFragmentEdit extends StatefulWidget {
  final List<Offering> offerings;
  final String subject;
  const SubjectsFragmentEdit({
    super.key,
    required this.offerings,
    required this.subject,
  });

  @override
  State<SubjectsFragmentEdit> createState() => _SubjectsFragmentEditState();
}

class _SubjectsFragmentEditState extends State<SubjectsFragmentEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommandBarCard(
          child: CommandBar(
            overflowBehavior: CommandBarOverflowBehavior.dynamicOverflow,
            primaryItems: [
              CommandBarButton(
                icon: Icon(Icons.drive_file_rename_outline_outlined),
                onPressed: () {},
                label: Text("Rename subject"),
              ),
              CommandBarButton(
                icon: Icon(MdiIcons.deleteOutline),
                onPressed: () {
                  context.read<SkedmakerModel>().removeSubject(widget.subject);
                },
                label: Text("Delete subject"),
              ),
              CommandBarSeparator(),
              CommandBarButton(
                icon: Icon(MdiIcons.plus),
                onPressed: () {},
                label: Text("Add section"),
              ),
              CommandBarButton(
                icon: Icon(MdiIcons.deleteClockOutline),
                onPressed: null,
                label: Text("Delete section"),
              ),
              CommandBarButton(
                icon: Icon(MdiIcons.deleteClockOutline),
                onPressed: () {},
                label: Text("Delete closed sections"),
              ),
            ],
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: DataTable(
            dataRowMinHeight: 36,
            dataRowMaxHeight: 36,
            showCheckboxColumn: true,
            columnSpacing: 6,
            columns: [
              DataColumn(
                label: Text('Status'),
              ),
              DataColumn(
                label: Text('Class #'),
              ),
              DataColumn(
                label: Text('Section'),
              ),
              DataColumn(
                label: Text('Room'),
              ),
              DataColumn(
                label: Text('Day'),
              ),
              DataColumn(
                label: Text('Time'),
              ),
              DataColumn(
                label: Text('Teacher'),
              ),
              DataColumn(
                label: Text('Slots'),
              ),
            ],
            rows: [
              for (final offering in widget.offerings)
                DataRow(
                  cells: [
                    DataCell(Text(offering.isClosed ? 'Closed' : 'Open')),
                    DataCell(Text(offering.classNumber.toString())),
                    DataCell(Text(offering.section)),
                    DataCell(Text(offering.room)),
                    DataCell(Text(offering.scheduleDay.name)),
                    DataCell(Text(offering.scheduleTime)),
                    DataCell(Text(offering.teacher)),
                    DataCell(Text(offering.slots)),
                  ],
                  onSelectChanged: (value) {},
                )
            ],
          ),
        ))
      ],
    );
  }
}

class SchedulesFragment extends StatefulWidget {
  const SchedulesFragment({super.key});

  @override
  State<SchedulesFragment> createState() => _SchedulesFragmentState();
}

class _SchedulesFragmentState extends State<SchedulesFragment> {
  late int indexSelected;

  @override
  void initState() {
    super.initState();
    indexSelected = 0;
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SkedmakerModel>();
    return NavigationView(
      pane: NavigationPane(
        selected: indexSelected,
        onChanged: (index) {
          setState(() {
            indexSelected = index;
          });
        },
        items: [
          for (final schedule in model.schedules)
            PaneItem(
              icon: Icon(MdiIcons.abTesting),
              title: Text(schedule.identifierString),
              body: TimetableFragment(
                data: schedule,
              ),
            ),
        ],
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: Icon(MdiIcons.calendarWeek),
            body: Placeholder(),
            title: Text("Generate"),
            onTap: () {
              asd(context);
            },
          ),
        ],
      ),
    );
  }
}

asd(BuildContext context) {
  context.read<SkedmakerModel>()
    ..schedules = {}
    ..isGenerating = true;

  final subjects = context.read<SkedmakerModel>().subjects;

  // count execution time
  final stopwatch = Stopwatch()..start();

  generageSchedules(subjects).listen((event) {
    final model = context.read<SkedmakerModel>();
    model.addSchedule(event);
  }).onDone(() {
    stopwatch.stop();
    print("ELAPSED TIME: ${stopwatch.elapsedMilliseconds}");

    context.read<SkedmakerModel>().isGenerating = false;
  });
}

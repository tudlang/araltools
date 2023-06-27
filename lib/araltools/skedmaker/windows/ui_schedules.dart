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

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart'
    hide
        Divider,
        Tab,
        ListTile,
        IconButton,
        FilledButton,
        DividerThemeData,
        Scrollbar,
        Tooltip;
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:provider/provider.dart';

import '../classes.dart';
import '../functions.dart';
import '../models.dart';
import '../skedmaker_activity.dart';

class SchedulesFragment extends StatefulWidget {
  const SchedulesFragment({super.key});

  @override
  State<SchedulesFragment> createState() => _SchedulesFragmentState();
}

class _SchedulesFragmentState extends State<SchedulesFragment> {
  late int indexSelected;
  late FocusNode focusnode;
  late ScrollController controllerList;

  @override
  void initState() {
    super.initState();
    indexSelected = 0;
    focusnode = FocusNode();
    controllerList = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SkedmakerModel>();
    final textTheme = Theme.of(context).textTheme;

    return model.schedules.isEmpty
        ? Column(
            children: [
              Expanded(
                  child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Generate possible schedules',
                      style: textTheme.headlineSmall,
                    ),
                    if (model.isGenerating)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProgressBar(),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Generate'),
                            ),
                            onPressed: () {
                              context.read<SkedmakerModel>().scheduleGenerate();
                            }),
                      ),
                    if (!model.isGenerating && model.hasGenerated)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InfoBar(
                            title: Text(
                              'No schedules found.',
                              textAlign: TextAlign.center,
                            ),
                            severity: InfoBarSeverity.error,
                          ),
                        ),
                      ),
                  ],
                ),
              ))
            ],
          )
        : RawKeyboardListener(
            focusNode: focusnode,
            onKey: (value) {
              if (value is RawKeyDownEvent &&
                  value.logicalKey == LogicalKeyboardKey.arrowDown) {
                model.nextWeekInTab(indexSelected, 1);
                setState(() {
                  indexSelected++;
                });
              }
              if (value is RawKeyDownEvent &&
                  value.logicalKey == LogicalKeyboardKey.arrowUp) {
                model.nextWeekInTab(indexSelected, -1);
                setState(() {
                  indexSelected--;
                });
              }
            },
            child: Row(children: [
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    if (model.isGenerating)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (model.schedulesIsPaused)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Button(
                              child: Text('Resume'),
                              onPressed: () {
                                context.read<SkedmakerModel>().scheduleResume();
                              },
                            ),
                          ) else 
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Button(
                              child: Text('Pause'),
                              onPressed: () {
                                context.read<SkedmakerModel>().schedulePause();
                              },
                            ),
                          ),
                          Button(
                            child: Text('Cancel'),
                            onPressed: () {
                              context.read<SkedmakerModel>().scheduleCancel();
                            },
                          ),
                        ],
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Button(
                          child: Text('Generate'),
                          onPressed: () {
                            context.read<SkedmakerModel>().scheduleGenerate();
                          },
                        ),
                      ),
                    Text("${model.schedules.length} schedules found"),
                    if (model.isGenerating) Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProgressBar(),
                    ),
                    Divider(),
                    Expanded(
                        child: ListView.builder(
                      controller: controllerList,
                      itemCount: model.schedules.length,
                      itemBuilder: (context, index) {
                        final week = model.schedules.elementAt(index);
                        bool isHovered = false;
                        bool isSelected = index == indexSelected;
                        return StatefulBuilder(builder: (context, setState2) {
                          return MouseRegion(
                            onEnter: (event) {
                              setState2(() {
                                isHovered = true;
                              });
                            },
                            onExit: (event) {
                              setState2(() {
                                isHovered = false;
                              });
                            },
                            child: ListTile.selectable(
                              trailing: isHovered || isSelected
                                  ? IconButton(
                                      icon: Icon(MdiIcons.dotsVertical),
                                      onPressed: () {},
                                    )
                                  : null,
                              selected: isSelected,
                              title: Text(week.name),
                              onPressed: () {
                                setState(() {
                                  indexSelected = index;
                                });
                                final model = context.read<SkedmakerModel>();
                                if (model.tabs.isEmpty) {
                                  model.addTab(week);
                                } else {
                                  model.updateTab(week);
                                }
                              },
                            ),
                          );
                        });
                      },
                    )),
                  ],
                ),
              ),
              VerticalDivider(),
              Expanded(
                  child: TabView(
                tabWidthBehavior: TabWidthBehavior.sizeToContent,
                currentIndex: model.tabsIndex,
                tabs: model.tabs
                    .map((e) => Tab(
                          text: Text(e.name),
                          body: SchedulesFragmentTimetable(
                            week: e,
                          ),
                          closeIcon: model.tabs.length == 1
                              ? IconData(0xFEFF)
                              : FluentIcons.chrome_close,
                          onClosed: model.tabs.length == 1
                              ? null
                              : () {
                                  context.read<SkedmakerModel>().removeTab(e);
                                },
                        ))
                    .toList(),
                onReorder: (oldIndex, newIndex) {
                  context.read<SkedmakerModel>().reorderTab(oldIndex, newIndex);
                },
                onNewPressed: () {
                  context.read<SkedmakerModel>().addTab(null);
                },
                onChanged: (index) {
                  model.tabsIndex = index;
                },
              )),
            ]),
          );
  }
}

class SchedulesFragmentTimetable extends StatefulWidget {
  const SchedulesFragmentTimetable({super.key, required this.week});
  final ScheduleWeek week;

  @override
  State<SchedulesFragmentTimetable> createState() =>
      _SchedulesFragmentTimetableState();
}

class _SchedulesFragmentTimetableState
    extends State<SchedulesFragmentTimetable> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const Divider(
            style: DividerThemeData(
          thickness: 2,
          horizontalMargin: EdgeInsets.only(),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.week.name,
            style: textTheme.headlineSmall,
          ),
        ),
        const Divider(
            style: DividerThemeData(
          thickness: 2,
          horizontalMargin: EdgeInsets.only(),
        )),
        Expanded(
          child: MultiSplitViewTheme(
            data: MultiSplitViewThemeData(
              dividerPainter: DividerPainters.background(
                  color: Color(0xFFeaeaea),
                  highlightedColor: Color.fromARGB(255, 192, 192, 192)),
            ),
            child: MultiSplitView(
              axis: Axis.horizontal,
              initialAreas: [Area(weight: 0.6)],
              children: [
                Column(
                  children: [
                    Expanded(
                      child: TimetableFragment(
                        week: widget.week,
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          dataRowMinHeight: 36,
                          dataRowMaxHeight: 36,
                          showCheckboxColumn: false,
                          showBottomBorder: true,
                          columnSpacing: 10,
                          columns: [
                            DataColumn(label: Text('Subject')),
                            DataColumn(label: Text('Class #')),
                            DataColumn(label: Text('Section')),
                            DataColumn(label: Text('Room')),
                            DataColumn(label: Text('Day')),
                            DataColumn(label: Text('Teacher')),
                            DataColumn(label: Text('Slots')),
                          ],
                          rows: widget.week.subjects
                              .map((e) => DataRow(
                                    cells: [
                                      DataCell(SubjectText(offering: e)),
                                      DataCell(Text(e.classNumber.toString())),
                                      DataCell(Text(e.section)),
                                      DataCell(Text(e.room)),
                                      DataCell(Tooltip(
                                        message: e.scheduleDay.nameLocalized,
                                        child: Text(e.scheduleDay.nameShort),
                                      )),
                                      DataCell(Text(e.teacher)),
                                      DataCell(Tooltip(
                                        message:
                                            "${(e.slotPercentage * 100).round()}%",
                                        child: Text(e.slots),
                                      )),
                                    ],
                                    onSelectChanged: (value) {},
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

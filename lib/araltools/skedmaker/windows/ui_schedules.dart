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

import 'package:fluent_ui/fluent_ui.dart' hide Tab, TabView, TabWidthBehavior;
import 'package:flutter/material.dart'
    hide
        Divider,
        Tab,
        ListTile,
        IconButton,
        FilledButton,
        DividerThemeData,
        Scrollbar,
        Tooltip,
        Colors,
        showDialog,
        Card;
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:provider/provider.dart';

import '/opensource/tab_view.dart';
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
                      style: textTheme.headlineMedium,
                    ),
                    if (model.isGenerating) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProgressBar(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Cancel'),
                            ),
                            onPressed: () {
                              context.read<SkedmakerModel>().scheduleCancel();
                            }),
                      ),
                    ] else
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
                                  context
                                      .read<SkedmakerModel>()
                                      .scheduleResume();
                                },
                              ),
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button(
                                child: Text('Pause'),
                                onPressed: () {
                                  context
                                      .read<SkedmakerModel>()
                                      .schedulePause();
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
                    if (model.isGenerating)
                      Padding(
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
                        bool isSelected = index == indexSelected;
                        return ListTile.selectable(
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
                        );
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
                header: Tooltip(
                  message: 'Info',
                  child: IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ContentDialog(
                              title: Text('Info'),
                              content: Text(
                                  'Select a schedule from the left.\nView and compare multiple schedules by opening new tabs at the top.\n\nKeyboard shortcuts:\nUp/Down arrow key - go to next/previous schedule\nCtrl + T - create new tab\nCtrl + W or Ctrl + F4 - close current tab\nCtrl + 1 to 8 - go to first to eighth tab\nCtrl + 9 - go to last tab'),
                              actions: [
                                SizedBox.shrink(),
                                Button(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ],
                            );
                          },
                          barrierDismissible: true);
                    },
                  ),
                ),
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
        CommandBarCard(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.week.name, style: textTheme.headlineSmall),
            ),
            Expanded(
                child: CommandBar(
              primaryItems: [
                CommandBarSeparator(),
                // TODO add rename button
                // TODO add delete button
                //CommandBarBuilderItem(builder: (context, displayMode, child){
                //  return 
                //}, wrappedItem: CommandBarButton(
                //  label: Text('Delete schedule'),
                //  icon: Icon(MdiIcons.deleteOutline),
                //  onPressed: () {
                //    context.read<SkedmakerModel>().removeSchedule(widget.week);
                //  },
                //))
                
              ],
            ))
          ],
        )),
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
              initialAreas: [Area(weight: 0.8)],
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Details',
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    for (final subject in widget.week.subjects)
                      Container(
                        margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
                        child: Card(
                          child: RichText(
                              text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      "${subject.subject} - ${subject.section}",
                                  style: textTheme.labelLarge),
                              TextSpan(
                                  text: "\n#${subject.classNumber}\n",
                                  style: textTheme.labelMedium),
                              WidgetSpan(
                                  child: Icon(MdiIcons.mapMarkerOutline,
                                      size: 13)),
                              TextSpan(
                                  text:
                                      " ${subject.room.isEmpty ? '-' : subject.room}",
                                  style: textTheme.labelMedium),
                              TextSpan(
                                  text: "\n${subject.scheduleDay.nameShort}",
                                  style: textTheme.labelMedium),
                              TextSpan(
                                  text: "\n${subject.slots} slots\n",
                                  style: textTheme.labelMedium),
                              WidgetSpan(
                                  child:
                                      Icon(MdiIcons.humanMaleBoard, size: 13)),
                              TextSpan(
                                  text:
                                      " ${subject.teacher.isEmpty ? '-' : subject.teacher}",
                                  style: textTheme.labelMedium),
                            ],
                          )),
                          backgroundColor: subject.color.withOpacity(0.2),
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

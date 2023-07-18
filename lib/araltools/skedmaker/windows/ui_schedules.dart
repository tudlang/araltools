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

import 'package:araltools/araltools/skedmaker/export_image.dart';
import 'package:collection/collection.dart';
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
  late int indexTabCurrent;
  late FocusNode focusnode;
  late ScrollController controllerList;

  @override
  void initState() {
    super.initState();
    focusnode = FocusNode();
    controllerList = ScrollController();
    indexTabCurrent = 0;
  }

  @override
  void dispose() {
    super.dispose();
    controllerList.dispose();
    focusnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SkedmakerModel>();
    final textTheme = Theme.of(context).textTheme;

    var indexWeekCurrent = model.tabs.elementAtOrNull(indexTabCurrent) ?? 0;

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
                    SizedBox(height: 8),
                    if (model.isGenerating) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InfoLabel(
                          label:
                              "${model.schedulePercentage.toStringAsFixed(2)}% complete",
                          child: ProgressBar(
                            value: model.schedulePercentage.clamp(0, 100),
                          ),
                        ),
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
                  value.logicalKey == LogicalKeyboardKey.arrowDown &&
                  indexWeekCurrent <= model.schedules.length - 2) {
                model.updateTab(indexTabCurrent, indexWeekCurrent + 1);
              }
              if (value is RawKeyDownEvent &&
                  value.logicalKey == LogicalKeyboardKey.arrowUp &&
                  indexWeekCurrent > 0) {
                model.updateTab(indexTabCurrent, indexWeekCurrent - 1);
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
                    Text(
                      "${model.schedules.length} schedules found",
                      textAlign: TextAlign.center,
                    ),
                    if (model.isGenerating)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InfoLabel(
                          label:
                              "${model.schedulePercentage.toStringAsFixed(2)}% complete",
                          child: ProgressBar(
                            value: model.schedulePercentage.clamp(0, 100),
                          ),
                        ),
                      ),
                    Divider(),
                    Expanded(
                        child: ListView.builder(
                      controller: controllerList,
                      itemCount: model.schedules.length,
                      itemBuilder: (context, weekIndex) {
                        final week = model.schedules.elementAt(weekIndex);
                        return ListTile.selectable(
                          selected: indexWeekCurrent == weekIndex,
                          title: Text(week.name),
                          onPressed: () {
                            final model = context.read<SkedmakerModel>();
                            if (model.tabs.isEmpty) {
                              model.addTab(weekIndex);
                            } else {
                              model.updateTab(indexTabCurrent, weekIndex);
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
                currentIndex: indexTabCurrent,
                tabs: model.tabs.mapIndexed((tabIndex, weekIndex) {
                  final week = model.schedules.elementAt(weekIndex);
                  return Tab(
                    text: Text(week.name),
                    body: SchedulesFragmentTimetable(
                      //key: ValueKey(tabIndex),
                      tabIndex: tabIndex,
                    ),
                    closeIcon: model.tabs.length == 1
                        ? IconData(0xFEFF)
                        : FluentIcons.chrome_close,
                    onClosed: model.tabs.length == 1
                        ? null
                        : () {
                            context.read<SkedmakerModel>().removeTab(tabIndex);
                          },
                  );
                }).toList(),
                onReorder: (oldIndex, newIndex) {
                  context.read<SkedmakerModel>().reorderTab(oldIndex, newIndex);
                },
                onNewPressed: () {
                  final model = context.read<SkedmakerModel>();
                  model.addTab(indexWeekCurrent);
                  setState(() {
                    indexTabCurrent = model.tabs.length - 1;
                  });
                },
                onChanged: (index) {
                  setState(() {
                    indexTabCurrent = index;
                  });
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
  const SchedulesFragmentTimetable({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  State<SchedulesFragmentTimetable> createState() =>
      _SchedulesFragmentTimetableState();
}

class _SchedulesFragmentTimetableState
    extends State<SchedulesFragmentTimetable> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final model = context.watch<SkedmakerModel>();

    final week = model.schedules.elementAt(model.tabs[widget.tabIndex]);

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
              child: Text(week.name, style: textTheme.headlineLarge),
            ),
            Expanded(
                child: CommandBar(
              primaryItems: [
                CommandBarSeparator(),
                // RENAME BUTTON
                () {
                  final controllerFlyout = FlyoutController();
                  final controllerText = TextEditingController(text: week.name);
                  return CommandBarBuilderItem(
                      builder: (context, displayMode, child) {
                        return FlyoutTarget(
                            controller: controllerFlyout, child: child);
                      },
                      wrappedItem: CommandBarButton(
                        label: Text('Rename'),
                        icon: Icon(MdiIcons.renameOutline),
                        onPressed: () {
                          controllerFlyout.showFlyout(builder: (context) {
                            void submit() {
                              if (controllerText.text.isEmpty) return;
                              context
                                  .read<SkedmakerModel>()
                                  .modifySchedule(widget.tabIndex, (week) {
                                week.name = controllerText.text;
                              });
                              Navigator.pop(context);
                            }

                            return FlyoutContent(
                                child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextBox(
                                    controller: controllerText,
                                    autofocus: true,
                                    onSubmitted: (value) => submit(),
                                  ),
                                  SizedBox(height: 8),
                                  Button(
                                    child: Text('Rename'),
                                    onPressed: submit,
                                  )
                                ],
                              ),
                            ));
                          });
                        },
                      ));
                }(),
                CommandBarButton(
                  label: Text('Save as image'),
                  icon: Icon(MdiIcons.imageOutline),
                  onPressed: () {
                    exportImage(context, week);
                  },
                ),
                // TODO add delete button
                //CommandBarBuilderItem(builder: (context, displayMode, child){
                //  return
                //}, wrappedItem: CommandBarButton(
                //  label: Text('Delete schedule'),
                //  icon: Icon(MdiIcons.deleteOutline),
                //  onPressed: () {
                //    context.read<SkedmakerModel>().removeSchedule(week);
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
              dividerThickness: 5,
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
                        week: week,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final subject in week.subjects)
                            ScheduleFragmentCard(
                              subject: subject,
                            )
                        ],
                      ),
                    )
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

class ScheduleFragmentCard extends StatelessWidget {
  const ScheduleFragmentCard({super.key, required this.subject});

  final Offering subject;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      constraints: BoxConstraints(
        maxWidth: 200,
        minWidth: 200,
      ),
      child: Card(
        child: RichText(
            text: TextSpan(
          children: [
            WidgetSpan(
                child: SubjectText(
              offering: subject,
              style: textTheme.labelLarge,
            )),
            TextSpan(text: subject.section, style: textTheme.labelLarge),
            TextSpan(
                text: " #${subject.classNumber}\n",
                style: textTheme.labelMedium),
            WidgetSpan(child: Icon(MdiIcons.mapMarkerOutline, size: 13)),
            TextSpan(
                text: " ${subject.room.isEmpty ? '-' : subject.room}",
                style: textTheme.labelMedium),
            TextSpan(
                text: "\n${subject.scheduleDay.nameShort}",
                style: textTheme.labelMedium),
            TextSpan(
                text: "\n${subject.slots} slots\n",
                style: textTheme.labelMedium),
            WidgetSpan(child: Icon(MdiIcons.humanMaleBoard, size: 13)),
            TextSpan(
                text: " ${subject.teacher.isEmpty ? '-' : subject.teacher}",
                style: textTheme.labelMedium),
          ],
        )),
        backgroundColor: subject.color.withOpacity(0.2),
      ),
    );
  }
}

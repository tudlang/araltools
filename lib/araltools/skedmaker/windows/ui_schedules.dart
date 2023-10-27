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
import 'package:araltools/utils.dart';
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
  @override
  Widget build(BuildContext context) {
    final model = context.watch<SkedmakerModel>();

    return model.schedules.isEmpty
        ? SchedulesFragmentBlank()
        : SchedulesFragmentProper();
  }
}

class SchedulesFragmentBlank extends StatelessWidget {
  const SchedulesFragmentBlank({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SkedmakerModel>();

    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Expanded(
            child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Generate possible schedules',
                style: textTheme.headlineMedium,
              ),
              SizedBox(height: 8),
              if (model.isGenerating) ...[
                Text("No schedules found yet. This will take some time."),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InfoLabel(
                    label:
                        "\n${model.schedulePercentage.toStringAsFixed(2)}% complete",
                    child: ProgressBar(
                      value: model.schedulePercentage.isNaN
                          ? null
                          : model.schedulePercentage.clamp(0, 100),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
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
                        'No schedules found. Maybe check your filters and try again.',
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
    );
  }
}

class SchedulesFragmentProper extends StatefulWidget {
  const SchedulesFragmentProper({super.key});

  @override
  State<SchedulesFragmentProper> createState() =>
      _SchedulesFragmentProperState();
}

class _SchedulesFragmentProperState extends State<SchedulesFragmentProper> {
  late int indexTabCurrent;
  late ScrollController controllerList;
  @override
  void initState() {
    super.initState();
    controllerList = ScrollController();
    indexTabCurrent = 0;
  }

  @override
  void dispose() {
    super.dispose();
    controllerList.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SkedmakerModel>();

    var indexWeekCurrent = model.tabs.elementAtOrNull(indexTabCurrent) ?? 0;

    final random = Random();
    return CallbackShortcuts(
      bindings: {
        SingleActivator(LogicalKeyboardKey.arrowDown): () {
          final model = context.read<SkedmakerModel>();
          if (indexWeekCurrent <= model.schedules.length - 2) {
            model.updateTab(indexTabCurrent, indexWeekCurrent + 1);
          }
        },
        SingleActivator(LogicalKeyboardKey.arrowUp): () {
          final model = context.read<SkedmakerModel>();
          if (indexWeekCurrent > 0) {
            model.updateTab(indexTabCurrent, indexWeekCurrent - 1);
          }
        },
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
                      )
                    else
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
                      child: Text('Stop'),
                      onPressed: () {
                        context.read<SkedmakerModel>().scheduleCancel();
                      },
                    ),
                  ],
                )
              else
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    onPressed: () {
                      context.read<SkedmakerModel>().scheduleGenerate();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Regenerate'),
                    ),
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
                      value: model.schedulePercentage.isNaN
                          ? null
                          : model.schedulePercentage.clamp(0, 100),
                    ),
                  ),
                ),
              SizedBox(height: 8),
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
                    trailing: week.isStarred ? Icon(Icons.star) : null,
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
              key: ValueKey((tabIndex ^ weekIndex) * random.nextDouble()),
              icon: week.isStarred ? Icon(Icons.star) : null,
              text: Text(week.name),
              body: SchedulesFragmentTimetable(
                key: ValueKey((tabIndex ^ weekIndex) * random.nextDouble()),
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
            // https://stackoverflow.com/questions/53176432/how-do-i-use-reorderablelistview-specifically-what-do-i-put-in-onreorder
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            context.read<SkedmakerModel>().reorderTab(oldIndex, newIndex);
            setState(() {
              // If the old index was before the current index and the new index is after it,
              // adjust the current index accordingly
              if (oldIndex < indexTabCurrent && newIndex >= indexTabCurrent) {
                indexTabCurrent--;
              }
              // If the old index was after the current index and the new index is before it,
              // adjust the current index accordingly
              else if (oldIndex > indexTabCurrent &&
                  newIndex <= indexTabCurrent) {
                indexTabCurrent++;
                // If the current tab is being moved, change the current tab to the new index
              } else if (oldIndex == indexTabCurrent) {
                indexTabCurrent = newIndex;
              }
            });
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

bool enableHoverEffects = false;

class _SchedulesFragmentTimetableState
    extends State<SchedulesFragmentTimetable> {
  late final TextEditingController controllerTextNotes;
  final currentlyHovered = ValueNotifier<Offering?>(null);

  @override
  void initState() {
    super.initState();

    final model = context.read<SkedmakerModel>();
    final week = model.schedules.elementAt(model.tabs[widget.tabIndex]);

    controllerTextNotes = TextEditingController(text: week.notes);
    controllerTextNotes.addListener(
      () {
        week.notes = controllerTextNotes.text;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    controllerTextNotes.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final model = context.read<SkedmakerModel>();

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
                () {
                  final controllerFlyout = FlyoutController();
                  return CommandBarBuilderItem(
                      builder: (context, displayMode, child) {
                        return FlyoutTarget(
                            controller: controllerFlyout, child: child);
                      },
                      wrappedItem: CommandBarButton(
                        label: Text('Delete'),
                        icon: Icon(MdiIcons.deleteOutline),
                        onPressed: () {
                          controllerFlyout.showFlyout(
                            builder: (context3) {
                              return FlyoutContent(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InfoLabel(
                                      label:
                                          'Delete ${week.name}?\nYou cannot un-delete this.\nAll tabs with this schedule will be removed.',
                                      labelStyle: FluentTheme.maybeOf(context)
                                          ?.typography
                                          .bodyStrong,
                                      child: Button(
                                        child: Text('Delete'),
                                        onPressed: () {
                                          context
                                              .read<SkedmakerModel>()
                                              .removeSchedule(
                                                  model.tabs[widget.tabIndex]);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ));
                }(),
                CommandBarButton(
                  label: Text(week.isStarred ? 'Unstar' : 'Star'),
                  icon: Icon(MdiIcons.starOutline),
                  onPressed: () {
                    context
                        .read<SkedmakerModel>()
                        .modifySchedule(widget.tabIndex, (week) {
                      week.isStarred = !week.isStarred;
                    });
                  },
                ),
                CommandBarButton(
                  label: Text('Save as image'),
                  icon: Icon(MdiIcons.imageOutline),
                  onPressed: () {
                    exportImage(context, week);
                  },
                ),
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
          child: ValueListenableBuilder(
            valueListenable: currentlyHovered,
            builder: (context, value, child) {
              return MultiSplitView(
                axis: Axis.horizontal,
                initialAreas: [Area(weight: 0.8)],
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Timetable2Fragment(
                          week: week,
                          currentlyHovered:
                              enableHoverEffects ? currentlyHovered : null,
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ToggleSwitch(
                          checked: enableHoverEffects,
                          onChanged: (value) {
                            setState(() {
                              enableHoverEffects = !enableHoverEffects;
                            });
                          },
                          content: Text('Enable hover effects'),
                        ),
                      ),
                      const Divider(style: DividerThemeData(thickness: 3)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Details',
                          style: textTheme.headlineSmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InfoLabel(
                          label: 'Notes',
                          child: TextBox(
                            controller: controllerTextNotes,
                            maxLines: null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InfoLabel(
                          label: 'Subjects',
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final subject in week.subjects)
                                parentOrChild(
                                  condition: enableHoverEffects,
                                  parent: (child) {
                                    return MouseRegion(
                                      onEnter: (event) {
                                        currentlyHovered.value = subject;
                                      },
                                      onExit: (event) {
                                        setState(() {
                                          currentlyHovered.value = null;
                                        });
                                      },
                                      child: Opacity(
                                        opacity:
                                            currentlyHovered.value != null &&
                                                    currentlyHovered
                                                            .value?.subject ==
                                                        subject.subject
                                                ? 1
                                                : currentlyHovered.value != null
                                                    ? 0.3
                                                    : 1,
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: ScheduleFragmentCard(
                                    subject: subject,
                                  ),
                                )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          ),
        )),
      ],
    );
  }
}

class ScheduleFragmentCard extends StatelessWidget {
  const ScheduleFragmentCard({
    super.key,
    required this.subject,
  });

  final Offering subject;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorLuminant = subject.color.basedOnLuminance();

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
              style: textTheme.labelLarge!.copyWith(color: colorLuminant),
            )),
            TextSpan(
              text: subject.section,
              style: textTheme.labelLarge!.copyWith(color: colorLuminant),
            ),
            TextSpan(
              text: " #${subject.classNumber}\n",
              style: textTheme.labelMedium!.copyWith(color: colorLuminant),
            ),
            WidgetSpan(
                child: Icon(
              MdiIcons.mapMarkerOutline,
              size: 13,
              color: colorLuminant,
            )),
            TextSpan(
              text: " ${subject.room.isEmpty ? '-' : subject.room}",
              style: textTheme.labelMedium!.copyWith(color: colorLuminant),
            ),
            TextSpan(
              text:
                  "\n${subject.scheduleDay.nameShort}\n${subject.scheduleTimeString}",
              style: textTheme.labelMedium!.copyWith(color: colorLuminant),
            ),
            TextSpan(
              text: "\n${subject.slots} slots\n",
              style: textTheme.labelMedium!.copyWith(color: colorLuminant),
            ),
            WidgetSpan(
                child: Icon(
              MdiIcons.humanMaleBoard,
              size: 13,
              color: colorLuminant,
            )),
            TextSpan(
              text: " ${subject.teacher.isEmpty ? '-' : subject.teacher}\n",
              style: textTheme.labelMedium!.copyWith(color: colorLuminant),
            ),
            WidgetSpan(
                child: Icon(
              MdiIcons.text,
              size: 13,
              color: colorLuminant,
            )),
            TextSpan(
              text: " ${subject.remarks.isEmpty ? '-' : subject.remarks}",
              style: textTheme.labelMedium!.copyWith(color: colorLuminant),
            ),
          ],
        )),
        backgroundColor: subject.color,
      ),
    );
  }
}

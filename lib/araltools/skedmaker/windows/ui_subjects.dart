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

import 'package:araltools/araltools/skedmaker/debug.dart';
import 'package:araltools/utils.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide FilledButton, Tooltip;
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../classes.dart';
import '../connection.dart';
import '../functions.dart';
import '../models.dart';
import '../parser.dart';
import '../skedmaker_activity.dart';
import '../test_tables.dart';

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
    final textTheme = Theme.of(context).textTheme;

    return NavigationView(
      pane: NavigationPane(
        selected: indexSubject,
        items: [
          PaneItem(
            icon: Icon(MdiIcons.plus),
            title: Text('Add subject'),
            body: Column(
              children: [
                if (model.isGenerating)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InfoBar(
                      title: Text(
                          'Currently generating. Changes here will not apply until you generate again.'),
                      severity: InfoBarSeverity.warning,
                    ),
                  ),
                Expanded(
                    child: Center(
                        child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add subject',
                      style: textTheme.headlineMedium,
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          FilledButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Add from My.LaSalle'),
                            ),
                            onPressed: () async {
                              final list = await getSubject(context);
                              if (list == null) return;

                              final model = provider.currentContext!
                                  .read<SkedmakerModel>();
                              model.addSubject(list.first.subject, list);
                            },
                          ),
                          /*
                          FilledButton(
                            child: Text('Add manually'),
                            onPressed: () {},
                          ),
                          */ // TODO add manually
                          if (kDebugMode)
                            FilledButton(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Add debug subjects'),
                              ),
                              onPressed: () {
                                // THESE ARE FOR DEBUG PURPOSES
                                final model = context.read<SkedmakerModel>();
                                for (var subject in debugSubjects) {
                                  model.addSubject(
                                      subject.first.subject, subject);
                                }
                                import(context);
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    child: Text('Add subjects via code'),
                    onPressed: () async {
                      final list = await getSubjectFromString(context);

                      if (list == null) return;

                      final model = context.read<SkedmakerModel>();
                      model.addSubject(list.first.subject, list);
                    },
                  ),
                ),
              ],
            ),
          ),
          PaneItemSeparator(),
          for (final subject in model.subjects.entries)
            () {
              final hasError =
                  subject.value.every((element) => !element.isAvailable);
              final subjectText = SubjectText(
                offering: subject.value.first,
              );
              return PaneItem(
                icon: subjectText.icon,
                tileColor: hasError
                    ? ButtonState.all(ResourceDictionary.light()
                        .systemFillColorCriticalBackground)
                    : NavigationPaneTheme.of(context).tileColor,
                title: subjectText.text,
                body: SubjectsFragmentEdit(
                  subject: subject.key,
                ),
                trailing: hasError
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(MdiIcons.alertCircleOutline),
                      )
                    : null,
              );
            }(),
        ],
        onChanged: (index) {
          setState(() {
            indexSubject = index;
          });
        },
        footerItems: [],
      ),
    );
  }
}

class SubjectsFragmentEdit extends StatefulWidget {
  final String subject;
  const SubjectsFragmentEdit({
    super.key,
    required this.subject,
  });

  @override
  State<SubjectsFragmentEdit> createState() => _SubjectsFragmentEditState();
}

class _SubjectsFragmentEditState extends State<SubjectsFragmentEdit> {
  final offeringNotAvailable = [];

  @override
  void initState() {
    super.initState();

    for (var offering
        in context.read<SkedmakerModel>().subjects[widget.subject]!) {
      if (!offering.isAvailable) {
        offeringNotAvailable.add(offering);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final model = context.watch<SkedmakerModel>();
    final offerings = model.subjects[widget.subject]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (model.isGenerating)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InfoBar(
                title: Text(
                    'Currently generating schedules. Changes here will not apply until you generate again.'),
                severity: InfoBarSeverity.warning,
              ),
            ),
          ),
        if (offerings.length == offeringNotAvailable.length)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InfoBar(
                title: Text('${widget.subject} has no available offerings.'),
                severity: InfoBarSeverity.error,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: offerings.first.color,
                ),
                width: 25,
                height: 25,
              ),
              SizedBox(width: 8),
              Text(
                "${widget.subject} - ${offerings.length} offerings (${offerings.length - offeringNotAvailable.length} available)",
                textAlign: TextAlign.start,
                style: textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        CommandBarCard(
          child: CommandBar(
            overflowBehavior: CommandBarOverflowBehavior.dynamicOverflow,
            primaryItems: [
              /*
              CommandBarButton(
                icon: Icon(Icons.palette_outlined),
                onPressed: () {},
                label: Text("Change subject color"),
              ),
              */
              /* 
              CommandBarButton(
                icon: Icon(Icons.drive_file_rename_outline_outlined),
                onPressed: () {},
                label: Text("Rename subject"),
              ),
              */
              () {
                final controller = FlyoutController();

                return CommandBarBuilderItem(
                  builder: (context2, displayMode, child) {
                    return FlyoutTarget(
                      controller: controller,
                      child: child,
                    );
                  },
                  wrappedItem: CommandBarButton(
                    icon: Icon(MdiIcons.deleteOutline),
                    onPressed: () {
                      controller.showFlyout(
                        builder: (context3) {
                          return FlyoutContent(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InfoLabel(
                                  label:
                                      'Delete ${widget.subject}?\nYou cannot un-delete this.',
                                  labelStyle: FluentTheme.maybeOf(context)
                                      ?.typography
                                      .bodyStrong,
                                  child: Button(
                                    child: Text('Delete'),
                                    onPressed: () {
                                      context
                                          .read<SkedmakerModel>()
                                          .removeSubject(widget.subject);
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
                    label: Text("Delete"),
                  ),
                );
              }()

              /* TODO add these functionality
              CommandBarSeparator(),
              CommandBarButton(
                icon: Icon(MdiIcons.plus),
                onPressed: () {},
                label: Text("Add offering"),
              ),
              CommandBarBuilderItem(
                builder: (context, displayMode, child) {
                  final controller = FlyoutController();

                  return Row(mainAxisSize: MainAxisSize.min, children: [
                    child,
                    FlyoutTarget(
                        controller: controller,
                        child: IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: () async {
                            controller.showFlyout(
                              builder: (context2) {
                                return MenuFlyout(
                                  items: [
                                    MenuFlyoutItem(
                                      leading:
                                          Icon(MdiIcons.deleteClockOutline),
                                      text: Text('Delete closed offerings'),
                                      onPressed: () {
// TODO ADD
                                      },
                                    ),
                                    MenuFlyoutItem(
                                      leading:
                                          Icon(MdiIcons.deleteClockOutline),
                                      text: Text(
                                          'Delete offerings with full slots'),
                                      onPressed: () {
// TODO ADD
                                      },
                                    ),
                                  ],
                                );
                              },
                              placementMode: FlyoutPlacementMode.bottomCenter,
                            );
                          },
                        ))
                  ]);
                },
                wrappedItem: CommandBarButton(
                  icon: Icon(MdiIcons.deleteClockOutline),
                  onPressed: null,
                  label: Text("Delete offering"),
                ),
              ),*/
            ],
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            () {
              final flyoutController = FlyoutController();

              return FlyoutTarget(
                controller: flyoutController,
                child: DataTable(
                  dataRowMinHeight: 36,
                  dataRowMaxHeight: 36,
                  showCheckboxColumn: false, //TODO add subjects
                  columnSpacing: 10,
                  columns: [
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Class #')),
                    DataColumn(label: Text('Section')),
                    DataColumn(label: Text('Room')),
                    DataColumn(label: Text('Day')),
                    DataColumn(label: Text('Time')),
                    DataColumn(label: Text('Teacher')),
                    DataColumn(label: Text('Slots')),
                  ],
                  rows: [
                    for (var i = 0; i < offerings.length; i++)
                      DataRow(
                        color: offerings[i].isAvailable
                            ? null
                            : MaterialStatePropertyAll(
                                ResourceDictionary.light()
                                    .systemFillColorCriticalBackground),
                        cells: [
                          DataCell(
                            offerings[i].isClosed
                                ? Tooltip(
                                    message: 'Closed',
                                    child: Icon(MdiIcons.closeCircleOutline),
                                  )
                                : Tooltip(
                                    message: 'Open',
                                    child: Icon(MdiIcons.checkCircleOutline),
                                  ),
                            onTap: () {
                              model.modifySubjectOffering(
                                widget.subject,
                                i,
                                (p0) => p0..isClosed = !p0.isClosed,
                              );
                            },
                          ),
                          DataCell(
                            Text(offerings[i].classNumber.toString()),
                            onTapDown: (details) {
                              flyoutController.showFlyout(
                                position: details.globalPosition,
                                builder: (context) {
                                  final controllerText = TextEditingController(
                                      text:
                                          offerings[i].classNumber.toString());

                                  return SubjectsFragmentFlyout(
                                    controllerText: controllerText,
                                    label: 'Edit class number:',
                                    submit: (model) {
                                      model.modifySubjectOffering(
                                        widget.subject,
                                        i,
                                        (p0) => p0
                                          ..classNumber =
                                              controllerText.text.toInt(),
                                      );
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          DataCell(
                            Text(offerings[i].section),
                            onTapDown: (details) {
                              flyoutController.showFlyout(
                                position: details.globalPosition,
                                builder: (context) {
                                  final controllerText = TextEditingController(
                                      text: offerings[i].section);

                                  return SubjectsFragmentFlyout(
                                    controllerText: controllerText,
                                    label: 'Edit section:',
                                    submit: (model) {
                                      model.modifySubjectOffering(
                                        widget.subject,
                                        i,
                                        (p0) =>
                                            p0..section = controllerText.text,
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          DataCell(
                            Text(offerings[i].room),
                            onTapDown: (details) {
                              flyoutController.showFlyout(
                                position: details.globalPosition,
                                builder: (context) {
                                  final controllerText = TextEditingController(
                                      text: offerings[i].room);

                                  return SubjectsFragmentFlyout(
                                    controllerText: controllerText,
                                    label: 'Edit room (can be empty):',
                                    submit: (model) {
                                      model.modifySubjectOffering(
                                        widget.subject,
                                        i,
                                        (p0) => p0..room = controllerText.text,
                                      );
                                    },
                                    isEmptyAllowed: true,
                                  );
                                },
                              );
                            },
                          ),
                          DataCell(
                            Tooltip(
                              child: Text(offerings[i].scheduleDay.nameShort),
                              message: offerings[i].scheduleDay.nameLocalized,
                            ),
                            onTapDown: (details) {
                              flyoutController.showFlyout(
                                position: details.globalPosition,
                                builder: (context) {
                                  ScheduleDay selected =
                                      offerings[i].scheduleDay;

                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return SubjectsFragmentFlyout(
                                      label: 'Edit day:',
                                      input: ComboBox<ScheduleDay>(
                                        value: selected,
                                        items: ScheduleDay.values
                                            .map((e) => ComboBoxItem(
                                                  child: Text(e.nameLocalized),
                                                  value: e,
                                                ))
                                            .toList(),
                                        onChanged: (value) => setState(
                                            () => selected = value ?? selected),
                                      ),
                                      submit: (model) {
                                        model.modifySubjectOffering(
                                          widget.subject,
                                          i,
                                          (p0) => p0..scheduleDay = selected,
                                        );
                                      },
                                      isEmptyAllowed: true,
                                    );
                                  });
                                },
                              );
                            },
                          ),
                          DataCell(
                            Text(offerings[i].scheduleTime),
                            onTap: () {},
                          ),
                          DataCell(
                            Text(offerings[i].teacher),
                            onTapDown: (details) {
                              flyoutController.showFlyout(
                                position: details.globalPosition,
                                builder: (context) {
                                  final controllerText = TextEditingController(
                                      text: offerings[i].teacher);

                                  return SubjectsFragmentFlyout(
                                    controllerText: controllerText,
                                    label: 'Edit teacher (can be empty):',
                                    submit: (model) {
                                      model.modifySubjectOffering(
                                        widget.subject,
                                        i,
                                        (p0) =>
                                            p0..teacher = controllerText.text,
                                      );
                                    },
                                    isEmptyAllowed: true,
                                  );
                                },
                              );
                            },
                          ),
                          DataCell(
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(offerings[i].slots),
                              SizedBox(width: 8),
                              SizedBox.square(
                                dimension: 25,
                                child: Tooltip(
                                  message:
                                      "${(offerings[i].slotPercentage * 100).round()}%",
                                  child: ProgressRing(
                                    // min because the slot taken might be greater than capacity
                                    value: min(
                                        100, offerings[i].slotPercentage * 100),
                                    strokeWidth: 3,
                                  ),
                                ),
                              )
                            ]),
                            onTap: () {},
                          ),
                        ],
                      )
                  ],
                ),
              );
            }()
          ],
        ))
      ],
    );
  }
}

/// The widget for the flyout when clicking on a cell on the offering table
class SubjectsFragmentFlyout extends StatelessWidget {
  const SubjectsFragmentFlyout({
    super.key,
    required this.submit,
    this.inputFormatters,
    this.controllerText,
    required this.label,
    this.isEmptyAllowed = false,
    this.input,
  }) : assert((input != null) || (input == null && controllerText != null),
            'There is a missing textEditingController');

  final void Function(SkedmakerModel) submit;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controllerText;
  final String label;
  final bool isEmptyAllowed;
  final Widget? input;

  @override
  Widget build(BuildContext context) {
    return FlyoutContent(
      child: ConstrainedBox(
        constraints: input == null
            ? BoxConstraints(maxWidth: 200)
            : const BoxConstraints(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoLabel(
              label: label,
              child: input ??
                  TextBox(
                    controller: controllerText,
                    autofocus: true,
                    onSubmitted: (value) {
                      if (!isEmptyAllowed && controllerText!.text.isEmpty)
                        return;
                      submit(context.read<SkedmakerModel>());
                      Navigator.pop(context);
                    },
                    inputFormatters: inputFormatters,
                  ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                Button(
                  child: Text('Save'),
                  onPressed: () {
                    if (input == null &&
                        !isEmptyAllowed &&
                        controllerText!.text.isEmpty) return;
                    submit(context.read<SkedmakerModel>());
                    Navigator.pop(context);
                  },
                ),
                Button(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

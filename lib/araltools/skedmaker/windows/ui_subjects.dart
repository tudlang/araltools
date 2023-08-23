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
import 'package:araltools/araltools/skedmaker/filters.dart';
import 'package:araltools/utils.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    hide FilledButton, Tooltip, showDialog, IconButton;
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
                              final model = provider.currentContext!
                                  .read<SkedmakerModel>();

                              final output =
                                  await getSubject(context, model.webview);
                              if (output == null) return;

                              if (output.list != null) {
                                model.addSubject(
                                    output.list!.first.subject, output.list!);
                              }
                              model.webview = output.webview;
                            },
                          ),
                          FilledButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Add manually'),
                            ),
                            onPressed: () async {
                              final subject = await showDialog<String>(
                                context: context,
                                builder: (context) {
                                  final controller = TextEditingController();
                                  return ContentDialog(
                                    title: Text('Create new subject'),
                                    content: InfoLabel(
                                      label:
                                          'Enter a 7-character subject code:',
                                      child: TextBox(
                                        controller: controller,
                                        autofocus: true,
                                        maxLength: 7,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[A-Za-z0-9]'))
                                        ],
                                        onSubmitted: (value) {
                                          Navigator.pop(
                                              context, value.toUpperCase());
                                        },
                                      ),
                                    ),
                                    actions: [
                                      Button(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                      FilledButton(
                                          child: Text('Add'),
                                          onPressed: () {
                                            if (controller.text.isEmpty ||
                                                controller.text.length != 7)
                                              return;
                                            Navigator.pop(context,
                                                controller.text.toUpperCase());
                                          }),
                                    ],
                                  );
                                },
                                barrierDismissible: true,
                              );

                              if (subject != null) {
                                model.addSubject(subject, []);
                              }
                            },
                          ),
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
              // empty subject, no offerings
              if (subject.value.isEmpty) {
                return PaneItem(
                  icon: Text(''),
                  title: Text(subject.key),
                  tileColor: ButtonState.all(ResourceDictionary.light()
                      .systemFillColorCriticalBackground),
                  body: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${subject.key} has no offerings',
                          style: textTheme.headlineMedium,
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            FilledButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Delete'),
                                ),
                                onPressed: () {
                                  final model = context.read<SkedmakerModel>();
                                  model.removeSubject(subject.key);
                                }),
                            FilledButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Add offering'),
                                ),
                                onPressed: () {
                                  final model = context.read<SkedmakerModel>();
                                  model.modifySubject(subject.key, (p0) {
                                    p0.add(Offering.blank(subject.key));
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  trailing: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(MdiIcons.alertCircleOutline)),
                );
              }
              final hasError = subject.value
                  .every((offering) => model.filters.shouldExclude(offering));
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
                body: SubjectsFragmentSubject(
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

class SubjectsFragmentSubject extends StatefulWidget {
  final String subject;
  const SubjectsFragmentSubject({
    super.key,
    required this.subject,
  });

  @override
  State<SubjectsFragmentSubject> createState() =>
      _SubjectsFragmentSubjectState();
}

class _SubjectsFragmentSubjectState extends State<SubjectsFragmentSubject> {
  final offeringNotAvailable = [];
  bool deleteMode = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final model = context.watch<SkedmakerModel>();
    final offerings = model.subjects[widget.subject]!;

    offeringNotAvailable.clear();
    for (var offering in model.subjects[widget.subject]!) {
      if (model.filters.shouldExclude(offering)) {
        offeringNotAvailable.add(offering);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                offerings.first.color,
                FluentTheme.of(context).cardColor
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                      title:
                          Text('${widget.subject} has no available offerings.'),
                      severity: InfoBarSeverity.error,
                    ),
                  ),
                ),
              Row(
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: HSLColor.fromColor(offerings.first.color)
                          .withLightness(0.4)
                          .toColor(),
                    ),
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "${widget.subject} - ${offerings.length} offerings (${offerings.length - offeringNotAvailable.length} available)",
                    textAlign: TextAlign.start,
                    style: textTheme.headlineMedium!.copyWith(
                        //  color: offerings.first.color.basedOnLuminance(
                        //darkColor: Color(0xff717171),
                        //)
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        CommandBarCard(
          child: CommandBar(
            overflowBehavior: CommandBarOverflowBehavior.dynamicOverflow,
            primaryItems: [
              CommandBarButton(
                icon: Icon(Icons.palette_outlined),
                label: Text("Recolor"),
                onPressed: () async {
                  final selected = await showDialog<Color>(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      Color selectedColor = offerings.first.color;

                      return Material(
                        type: MaterialType.transparency,
                        child: ContentDialog(
                          title: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text('Select color'),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  MdiIcons.close,
                                  size: 20,
                                ),
                                iconButtonMode: IconButtonMode.large,
                              )
                            ],
                          ),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              padding: EdgeInsets.all(0),
                              color: selectedColor,
                              onColorChanged: (value) {
                                selectedColor = value;
                              },
                              pickerTypeLabels: {
                                ColorPickerType.both: 'Primary'
                              },
                              pickersEnabled: {
                                ColorPickerType.wheel: true,
                                ColorPickerType.accent: false,
                                ColorPickerType.primary: false,
                                ColorPickerType.both: true,
                              },
                              showColorCode: true,
                              showColorName: true,
                              columnSpacing: 17,
                              colorCodeReadOnly: false,
                              colorCodeHasColor: true,
                              copyPasteBehavior: ColorPickerCopyPasteBehavior(
                                copyFormat: ColorPickerCopyFormat.numHexRRGGBB,
                              ),
                              wheelDiameter: 260,
                              wheelWidth: 22,
                              subheading: Text('Shades'),
                              wheelSubheading: Text('Shades'),
                            ),
                          ),
                          actions: [
                            Button(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            FilledButton(
                              child: Text('Select'),
                              onPressed: () {
                                Navigator.pop(context, selectedColor);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );

                  if (selected == null) return;

                  for (int i = 0; i < offerings.length; i++) {
                    model.modifySubjectOffering(
                        widget.subject, i, (p0) => p0..color = selected);
                  }
                },
              ),
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
              }(),
              CommandBarSeparator(),
              CommandBarButton(
                icon: Icon(MdiIcons.plus),
                onPressed: () {
                  final model = context.read<SkedmakerModel>();
                  model.modifySubject(widget.subject, (p0) {
                    p0.add(
                        Offering.blank(widget.subject, offerings.first.color));
                  });
                },
                label: Text("Add offering"),
              ),
              CommandBarButton(
                icon: Icon(MdiIcons.deleteClockOutline),
                onPressed: () {
                  final model = context.read<SkedmakerModel>();

                  setState(() {
                    deleteMode = !deleteMode;
                  });
                },
                label: Text("Delete offering"),
              ),
              /*
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
        Expanded(child: table(offerings, model, context))
      ],
    );
  }

  ListView table(
      List<Offering> offerings, SkedmakerModel model, BuildContext context) {
    return ListView(
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
                if (deleteMode) DataColumn(label: SizedBox.shrink()),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Class #')),
                DataColumn(label: Text('Section')),
                DataColumn(label: Text('Room')),
                DataColumn(label: Text('Day')),
                DataColumn(label: Text('Time')),
                DataColumn(label: Text('Teacher')),
                DataColumn(label: Text('Slots')),
                DataColumn(label: Text('Remarks')),
              ],
              rows: [
                for (var i = 0; i < offerings.length; i++)
                  DataRow(
                    color: !model.filters.shouldExclude(offerings[i])
                        ? null
                        : MaterialStatePropertyAll(
                            Color(0xfff4717c).withOpacity(0.2)),
                    cells: [
                      if (deleteMode)
                        DataCell(IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            size: 25,
                          ),
                          onPressed: () {
                            final model = context.read<SkedmakerModel>();
                            model.modifySubject(widget.subject, (p0) {
                              p0.removeAt(i);
                            });
                          },
                        )),
                      DataCell(
                        offerings[i].isClosed
                            ? Tooltip(
                                message: 'Closed',
                                child: Icon(
                                  MdiIcons.closeCircleOutline,
                                  size: 25,
                                ),
                              )
                            : Tooltip(
                                message: 'Open',
                                child: Icon(
                                  MdiIcons.checkCircleOutline,
                                  size: 25,
                                ),
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
                                  text: offerings[i].classNumber.toString());

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
                                    (p0) => p0..section = controllerText.text,
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
                              ScheduleDay selected = offerings[i].scheduleDay;

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
                                      (p0) {
                                        p0.scheduleDay = selected;
                                        if (selected.isMultipleDays) {
                                          p0.scheduleTime2 = p0.scheduleTime2 ??
                                              p0.scheduleTime;
                                        }
                                        return p0;
                                      },
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
                        Text(offerings[i].scheduleTimeString),
                        onTapDown: (details) {
                          flyoutController.showFlyout(
                            position: details.globalPosition,
                            builder: (context) {
                              int selectedStart =
                                  offerings[i].scheduleTime.start;
                              int selectedEnd = offerings[i].scheduleTime.end;

                              int? selectedStart2 =
                                  offerings[i].scheduleTime2?.start;
                              int? selectedEnd2 =
                                  offerings[i].scheduleTime2?.end;

                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return SubjectsFragmentFlyout(
                                  label: 'Edit time:',
                                  input: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // ==== start1
                                          ConstrainedBox(
                                            constraints:
                                                BoxConstraints(maxWidth: 60),
                                            child: NumberBox<int>(
                                              value: selectedStart,
                                              onChanged: (value) {
                                                value ??= 0;
                                                setState(() {
                                                  selectedStart =
                                                      ScheduleFilterTimeInterval
                                                          .clamp(value!);
                                                });
                                              },
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              clearButton: false,
                                              mode:
                                                  SpinButtonPlacementMode.none,
                                              min: 0,
                                              max: 2359,
                                            ),
                                          ),
                                          // ==== end1
                                          Text(' to '),
                                          // ==== start2
                                          ConstrainedBox(
                                            constraints:
                                                BoxConstraints(maxWidth: 60),
                                            child: NumberBox<int>(
                                              value: selectedEnd,
                                              onChanged: (value) {
                                                value ??= 0;
                                                setState(() {
                                                  setState(() {
                                                    selectedEnd =
                                                        ScheduleFilterTimeInterval
                                                            .clamp(value!);
                                                  });
                                                });
                                              },
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              clearButton: false,
                                              mode:
                                                  SpinButtonPlacementMode.none,
                                              min: 0,
                                              max: 2359,
                                            ),
                                          ),
                                          // ==== end2
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      ToggleSwitch(
                                        checked: selectedStart2 != null,
                                        content: Text('Second time interval'),
                                        onChanged: (value) {
                                          setState(() {
                                            if (value) {
                                              selectedStart2 = selectedStart;
                                              selectedEnd2 = selectedEnd;
                                            } else {
                                              selectedStart2 = null;
                                              selectedEnd2 = null;
                                            }
                                          });
                                        },
                                      ),
                                      if (selectedStart2 != null)
                                      SizedBox(height: 8),
                                      if (selectedStart2 != null)
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // ==== start1
                                            ConstrainedBox(
                                              constraints:
                                                  BoxConstraints(maxWidth: 60),
                                              child: NumberBox<int>(
                                                value: selectedStart2,
                                                onChanged: (value) {
                                                  value ??= 0;
                                                  setState(() {
                                                    selectedStart2 =
                                                        ScheduleFilterTimeInterval
                                                            .clamp(value!);
                                                  });
                                                },
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                clearButton: false,
                                                mode: SpinButtonPlacementMode
                                                    .none,
                                                min: 0,
                                                max: 2359,
                                              ),
                                            ),
                                            // ==== end1
                                            Text(' to '),
                                            // ==== start2
                                            ConstrainedBox(
                                              constraints:
                                                  BoxConstraints(maxWidth: 60),
                                              child: NumberBox<int>(
                                                value: selectedEnd2,
                                                onChanged: (value) {
                                                  value ??= 0;
                                                  setState(() {
                                                    setState(() {
                                                      selectedEnd2 =
                                                          ScheduleFilterTimeInterval
                                                              .clamp(value!);
                                                    });
                                                  });
                                                },
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                clearButton: false,
                                                mode: SpinButtonPlacementMode
                                                    .none,
                                                min: 0,
                                                max: 2359,
                                              ),
                                            ),
                                            // ==== end2
                                          ],
                                        ),
                                    ],
                                  ),
                                  submit: (model) {
                                    if (selectedStart >= selectedEnd ||
                                        (selectedStart2 != null &&
                                            selectedStart2! >= selectedEnd2!)) {
                                      throw ArgumentError(
                                          'Start time must be before end time');
                                    }
                                    model.modifySubjectOffering(
                                      widget.subject,
                                      i,
                                      (p0) {
                                        if (p0.scheduleDay.isMultipleDays &&
                                            selectedStart2 == null) {
                                          throw ArgumentError(
                                              'This must have a second time interval');
                                        }

                                        if (!p0.scheduleDay.isMultipleDays &&
                                            selectedStart2 != null &&
                                            selectedStart <= selectedEnd2! &&
                                            selectedStart2! <= selectedEnd) {
                                          throw ArgumentError(
                                              'The two time intervals must not conflict since it\'s on the same day');
                                        }

                                        p0.scheduleTime = (
                                          start: selectedStart,
                                          end: selectedEnd
                                        );
                                        p0.scheduleTime2 =
                                            selectedStart2 == null
                                                ? null
                                                : (
                                                    start: selectedStart2!,
                                                    end: selectedEnd2!
                                                  );
                                        return p0;
                                      },
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
                                    (p0) => p0..teacher = controllerText.text,
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
                                value:
                                    min(100, offerings[i].slotPercentage * 100),
                                strokeWidth: 3,
                              ),
                            ),
                          )
                        ]),
                        onTapDown: (details) {
                          flyoutController.showFlyout(
                            position: details.globalPosition,
                            builder: (context) {
                              int slotTaken = offerings[i].slotTaken;
                              int slotCap = offerings[i].slotCapacity;

                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return SubjectsFragmentFlyout(
                                  label: 'Edit slots:',
                                  input: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 60),
                                        child: NumberBox<int>(
                                          value: slotTaken,
                                          onChanged: (value) {
                                            if (value == null) return;
                                            setState(() {
                                              slotTaken = value;
                                            });
                                          },
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          clearButton: false,
                                          mode: SpinButtonPlacementMode.none,
                                          min: 0,
                                        ),
                                      ),
                                      Text(' out of '),
                                      ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 60),
                                        child: NumberBox<int>(
                                          value: slotCap,
                                          onChanged: (value) {
                                            if (value == null) return;
                                            setState(() {
                                              slotCap = value;
                                            });
                                          },
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          clearButton: false,
                                          mode: SpinButtonPlacementMode.none,
                                          min: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  submit: (model) {
                                    model.modifySubjectOffering(
                                      widget.subject,
                                      i,
                                      (p0) => p0
                                        ..slotTaken = slotTaken
                                        ..slotCapacity = slotCap,
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
                        Text(offerings[i].remarks),
                        onTapDown: (details) {
                          flyoutController.showFlyout(
                            position: details.globalPosition,
                            builder: (context) {
                              final controllerText = TextEditingController(
                                  text: offerings[i].remarks);

                              return SubjectsFragmentFlyout(
                                controllerText: controllerText,
                                label: 'Edit remarks (can be empty):',
                                submit: (model) {
                                  model.modifySubjectOffering(
                                    widget.subject,
                                    i,
                                    (p0) => p0..remarks = controllerText.text,
                                  );
                                },
                                isEmptyAllowed: true,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  )
              ],
            ),
          );
        }()
      ],
    );
  }
}

/// The widget for the flyout when clicking on a cell on the offering table
class SubjectsFragmentFlyout extends StatefulWidget {
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
  State<SubjectsFragmentFlyout> createState() => _SubjectsFragmentFlyoutState();
}

class _SubjectsFragmentFlyoutState extends State<SubjectsFragmentFlyout> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return FlyoutContent(
      child: ConstrainedBox(
        constraints: widget.input == null
            ? BoxConstraints(maxWidth: 200)
            : const BoxConstraints(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoLabel(
              label: widget.label,
              child: widget.input ??
                  TextBox(
                    controller: widget.controllerText,
                    autofocus: true,
                    onSubmitted: (value) {
                      if (!widget.isEmptyAllowed &&
                          widget.controllerText!.text.isEmpty) return;
                      widget.submit(context.read<SkedmakerModel>());
                      Navigator.pop(context);
                    },
                    inputFormatters: widget.inputFormatters,
                  ),
            ),
            SizedBox(height: 8),
            if (errorText != null)
              Text(
                errorText!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.red),
              ),
            Wrap(
              spacing: 8,
              children: [
                Button(
                  child: Text('Save'),
                  onPressed: () {
                    if (widget.input == null &&
                        !widget.isEmptyAllowed &&
                        widget.controllerText!.text.isEmpty) return;
                    try {
                      widget.submit(context.read<SkedmakerModel>());
                      Navigator.pop(context);
                    } on ArgumentError catch (e) {
                      setState(() {
                        errorText = e.message;
                      });
                    }
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

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
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide FilledButton, Tooltip;
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
                          */ // todo add manually
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
                                }import(context);
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
                  offerings: subject.value,
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
  final offeringNotAvailable = [];

  @override
  void initState() {
    super.initState();
    for (var offering in widget.offerings) {
      if (!offering.isAvailable) {
        offeringNotAvailable.add(offering);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.offerings.length == offeringNotAvailable.length)
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
                  color: widget.offerings.first.color,
                ),
                width: 25,
                height: 25,
              ),
              SizedBox(width: 8),
              Text(
                "${widget.subject} - ${widget.offerings.length} offerings (${widget.offerings.length - offeringNotAvailable.length} available)",
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
            DataTable(
              dataRowMinHeight: 36,
              dataRowMaxHeight: 36,
              showCheckboxColumn: false, //TODO add subjects
              columnSpacing: 10,
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
                    color: offering.isAvailable
                        ? null
                        : MaterialStatePropertyAll(ResourceDictionary.light()
                            .systemFillColorCriticalBackground),
                    cells: [
                      DataCell(offering.isClosed
                          ? Tooltip(
                              message: 'Closed',
                              child: Icon(MdiIcons.closeCircleOutline),
                            )
                          : Tooltip(
                              message: 'Open',
                              child: Icon(MdiIcons.checkCircleOutline),
                            )),
                      DataCell(Text(offering.classNumber.toString())),
                      DataCell(Text(offering.section)),
                      DataCell(Text(offering.room)),
                      DataCell(Tooltip(
                        child: Text(offering.scheduleDay.nameShort),
                        message: offering.scheduleDay.nameLocalized,
                      )),
                      DataCell(Text(offering.scheduleTime)),
                      DataCell(Text(offering.teacher)),
                      DataCell(Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(offering.slots),
                        SizedBox(width: 8),
                        SizedBox.square(
                          dimension: 25,
                          child: Tooltip(
                            message:
                                "${((offering.slotTaken / offering.slotCapacity) * 100).round()}%",
                            child: ProgressRing(
                              // min because the slot taken might be greater than capacity
                              value: min(
                                  100,
                                  (offering.slotTaken / offering.slotCapacity) *
                                      100),
                              strokeWidth: 3,
                            ),
                          ),
                        )
                      ])),
                    ],
                    onSelectChanged: (value) {},
                  )
              ],
            ),
          ],
        ))
      ],
    );
  }
}

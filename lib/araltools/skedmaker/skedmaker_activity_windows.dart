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

import 'dart:convert';
import 'dart:math';

import 'package:araltools/main.dart';
import 'package:araltools/strings.g.dart';
import 'package:araltools/utils.dart';
import 'package:flutter/material.dart'
    hide
        IconButton,
        ListTile,
        Tab,
        Divider,
        DividerThemeData,
        Card,
        showDialog,
        Tooltip,
        FilledButton,
        Colors;
import 'package:flutter/services.dart';
import 'package:multi_split_view/multi_split_view.dart';

import 'connection.dart';
import 'functions.dart';
import 'models.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return FluentApp(
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData.light()
          .copyWith(navigationPaneTheme: NavigationPaneThemeData()
              //accentColor: Colors.blue,
              //micaBackgroundColor: Theme.of(context).colorScheme.primary
              ),
      home: NavigationPaneTheme(
        data: NavigationPaneThemeData(
          backgroundColor: Theme.of(context).colorScheme.primary,
          highlightColor: Colors.white,
        ),
        child: NavigationView(
          pane: NavigationPane(
              size: NavigationPaneSize(
                topHeight: 50,
              ),
              header: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(
                  AralTools.skedmaker.icon,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                SizedBox(width: 8),
                Text(
                  'SkedMaker',
                  style: textTheme.titleLarge?.copyWith(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                SizedBox(width: 16),
                VerticalDivider(),
              ]),
              leading: IconButton(
                icon: Icon(
                  MdiIcons.menu,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconButtonMode: IconButtonMode.large,
              ),
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
                  title: Text(
                    'Subjects',
                    style: textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  body: NavigationPaneTheme(
                    data: FluentTheme.of(context).navigationPaneTheme,
                    child: SubjectsFragment(),
                  ),
                ),
                PaneItem(
                  icon: Icon(MdiIcons.filterOutline),
                  title: Text(
                    'Filters',
                    style: textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  body: NavigationPaneTheme(
                    data: FluentTheme.of(context).navigationPaneTheme,
                    child: FiltersFrgment(),
                  ),
                ),
                /*PaneItem(
                icon: Icon(MdiIcons.filterOutline),
                title: Text('Professors'),
                body: Placeholder(),
              ),*/ //TODO new feature, add professors
                PaneItem(
                  icon: Icon(MdiIcons.calendarBlankMultiple),
                  title: Text(
                    'Schedules',
                    style: textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  body: NavigationPaneTheme(
                    data: FluentTheme.of(context).navigationPaneTheme,
                    child: NavigationView(content: SchedulesFragment()),
                  ),
                ),
              ],
              footerItems: [
                /*PaneItem(
                icon: Icon(MdiIcons.filterOutline),
                title: Text('Settings'),
                body: Placeholder(),
              ),*/ //TODO add settings
              ]),
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
    final textTheme = Theme.of(context).textTheme;

    return NavigationView(
      pane: NavigationPane(
        selected: indexSubject,
        items: [
          PaneItem(
            icon: Icon(MdiIcons.plus),
            title: Text('Add'),
            body: Column(
              children: [
                Expanded(
                    child: Center(
                        child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add subject',
                      style: textTheme.headlineSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          FilledButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Add from MyLaSalle'),
                            ),
                            onPressed: () async {
                              final list = await getSubject(context);
                              if (list == null) return;

                              final model = context.read<SkedmakerModel>();
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
                                context.read<SkedmakerModel>()
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
              return PaneItem(
                icon: Container(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: subject.value.first.color,
                  ),
                  width: 10,
                  height: 10,
                ),
                tileColor: hasError
                    ? ButtonState.all(ResourceDictionary.light()
                        .systemFillColorCriticalBackground)
                    : NavigationPaneTheme.of(context).tileColor,
                title: Text(subject.key),
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
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.offerings.every((element) => !element.isAvailable))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InfoBar(
              title: Text('${widget.subject} has no available offerings.'),
              severity: InfoBarSeverity.error,
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
                "${widget.subject} - ${widget.offerings.length + 1} offerings",
                textAlign: TextAlign.start,
                style: textTheme.headlineSmall,
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
                onPressed: () {},
                label: Text("Change subject color"),
              ),
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
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView(
              children: [
                DataTable(
                  dataRowMinHeight: 36,
                  dataRowMaxHeight: 36,
                  showCheckboxColumn: true,
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

class FiltersFrgment extends StatefulWidget {
  const FiltersFrgment({super.key});

  @override
  State<FiltersFrgment> createState() => _FiltersFrgmentState();
}

class _FiltersFrgmentState extends State<FiltersFrgment> {
  late int paneIndex;

  @override
  void initState() {
    super.initState();
    paneIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
          selected: paneIndex,
          onChanged: (value) {
            setState(() {
              paneIndex = value;
            });
          },
          items: [
            ...ScheduleFilters.filters.entries.map((category) => PaneItem(
                  icon: Icon(category.key.$2),
                  body: FiltersFragmentCategory(
                    category: category.key.$1,
                    icon: category.key.$2,
                  ),
                  title: Text(strings[
                          "skedmaker.filters.categories.${category.key.$1}.name"] ??
                      category.key.$1),
                )),
            //PaneItem(
            //  icon: Icon(MdiIcons.schoolOutline),
            //  title: Text('Custom'),
            //  body: Placeholder(),
            //),
          ],
          footerItems: [
            PaneItem(
              icon: Text('map'),
              body: Placeholder(),
              onTap: () {
                final model = context.read<SkedmakerModel>();
                final a = JsonEncoder.withIndent("     ")
                    .convert(model.filters.toMap());
                print(a);
              },
            ),
            PaneItem(
              icon: Text('val'),
              body: Placeholder(),
              onTap: () {
                final model = context.read<SkedmakerModel>();
                final a = JsonEncoder.withIndent("     ")
                    .convert(model.filters.values);
                print(a);
              },
            ),
          ]

          /*
        [
          PaneItem(
            icon: Icon(MdiIcons.schoolOutline),
            title: Text('Offerings'),
            body: Placeholder(),
          ),
          PaneItem(
            icon: Icon(MdiIcons.calendarTodayOutline),
            title: Text('Day-specific rules'),
            body: Placeholder(),
          ),
          PaneItem(
            icon: Icon(MdiIcons.mapMarkerOutline),
            title: Text('Location'),
            body: Placeholder(),
          ),
        ],*/
          ),
    );
  }
}

class FiltersFragmentCategory extends StatefulWidget {
  const FiltersFragmentCategory({
    super.key,
    required this.category,
    required this.icon,
  });

  final String category;
  final IconData icon;

  @override
  State<FiltersFragmentCategory> createState() =>
      _FiltersFragmentCategoryState();
}

class _FiltersFragmentCategoryState extends State<FiltersFragmentCategory>
    with LocationFunctions {
  late List<ScheduleFilter> filters;
  late TextTheme textTheme;

  @override
  void initState() {
    super.initState();
    filters = ScheduleFilters.filters[(widget.category, widget.icon)]!;
  }

  filterText(ScheduleFilter filter) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(strings[
                  'skedmaker.filters.categories.${widget.category}.${filter.keyLocalized ?? filter.key}.name'] ??
              filter.key),
          TextOrNull(
              strings[
                  'skedmaker.filters.categories.${widget.category}.${filter.keyLocalized ?? filter.key}.desc'],
              style: textTheme.labelMedium)
        ],
      );

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SkedmakerModel>();
    textTheme = Theme.of(context).textTheme;

    final filterValues = model.filters.values;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            strings["skedmaker.filters.categories.${widget.category}.name"] ??
                widget.category,
            textAlign: TextAlign.start,
            style: textTheme.headlineSmall,
          ),
        ),
        for (final filter in filters)
          if (filter.valueDefault == null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Text(strings[
                      'skedmaker.filters.categories.${widget.category}.${filter.key}'] ??
                  filter.key),
            )
          else if (filter.valueDefault is Map<String, int> &&
              filter.valueLeast is int &&
              filter.valueMost is int)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(children: [
                  filterText(filter),
                  Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 60),
                    child: NumberBox<int>(
                      value: filterValues[widget.category]![filter.key]
                              ?['start'] ??
                          filter.valueDefault['start'],
                      onChanged: (value) {
                        final model = context.read<SkedmakerModel>();
                        value ??= 0;
                        model.updateFilter(widget.category, filter.key, () {
                          final hour = (value! / 100).floor();
                          final minute = value % 100;

                          if (hour >= 24 && minute >= 60) {
                            return 2359;
                          } else if (hour >= 24 && minute < 60) {
                            return minute + 2300;
                          } else if (hour < 24 && minute >= 60) {
                            return (hour * 100) + 59;
                          } else if (hour < 24 && minute < 60) {
                            return (hour * 100) + minute;
                          }
                        }(), 'start');
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      clearButton: false,
                      mode: SpinButtonPlacementMode.none,
                      min: filter.valueLeast,
                      max: filter.valueMost,
                    ),
                  ),
                  Text(' - '),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 60),
                    child: NumberBox<int>(
                      value: filterValues[widget.category]![filter.key]
                              ?['end'] ??
                          filter.valueDefault['end'],
                      onChanged: (value) {
                        final model = context.read<SkedmakerModel>();
                        value ??= 0;
                        model.updateFilter(widget.category, filter.key, () {
                          final hour = (value! / 100).floor();
                          final minute = value % 100;

                          if (hour >= 24 && minute >= 60) {
                            return 2359;
                          } else if (hour >= 24 && minute < 60) {
                            return minute + 2300;
                          } else if (hour < 24 && minute >= 60) {
                            return (hour * 100) + 59;
                          } else if (hour < 24 && minute < 60) {
                            return (hour * 100) + minute;
                          }
                        }(), 'end');
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      clearButton: false,
                      mode: SpinButtonPlacementMode.none,
                      min: filter.valueLeast,
                      max: filter.valueMost,
                    ),
                  ),
                ]),
              ),
            )
          else if (filter.valueDefault is num)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(children: [
                  filterText(filter),
                  Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 150),
                    child: NumberBox<num>(
                      value: filterValues[widget.category]![filter.key] ??
                          filter.valueDefault,
                      onChanged: (value) {
                        if (value == null) return;
                        final model = context.read<SkedmakerModel>();
                        model.updateFilter(widget.category, filter.key,
                            filter.valueDefault is int ? value.toInt() : value);
                      },
                      min: filter.valueLeast,
                      max: filter.valueMost,
                      clearButton: false,
                      mode: SpinButtonPlacementMode.none,
                    ),
                  ),
                ]),
              ),
            )
          else if (filter.valueDefault is bool)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(children: [
                  filterText(filter),
                  Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: ToggleSwitch(
                      checked: filterValues[widget.category]![filter.key] ??
                          filter.valueDefault,
                      onChanged: (value) {
                        final model = context.read<SkedmakerModel>();
                        model.updateFilter(widget.category, filter.key, value);
                      },
                    ),
                  ),
                ]),
              ),
            )
          else if (filter.valueDefault is String &&
              filter.valueChoices is List<String>)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(children: [
                  filterText(filter),
                  Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: ComboBox(
                      value: filterValues[widget.category]![filter.key] ??
                          filter.valueDefault,
                      items: filter.valueChoices!
                          .map((e) => ComboBoxItem(
                                child: Text(strings[
                                        "skedmaker.filters.categories.${widget.category}.${filter.keyLocalized ?? filter.key}.$e"] ??
                                    e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        final model = context.read<SkedmakerModel>();
                        model.updateFilter(widget.category, filter.key, value);
                      },
                    ),
                  ),
                ]),
              ),
            )
          else if (filter.valueDefault == ScheduleFilterSpecial.subjects)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(children: [
                  filterText(filter),
                  Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: ComboBox(
                      value:
                          filterValues[widget.category]![filter.key] ?? 'any',
                      items: model.subjects.keys
                          .map((e) => ComboBoxItem(
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: ShapeDecoration(
                                        shape: CircleBorder(),
                                        color: model.subjects[e]!.first.color,
                                      ),
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 8),
                                    Text(e),
                                  ],
                                ),
                                value: e,
                              ))
                          .toList()
                        ..insert(
                            0,
                            ComboBoxItem(
                              child: Text(strings.skedmaker.filters.any),
                              value: 'any',
                            )),
                      onChanged: (value) {
                        if (value == null) return;
                        final model = context.read<SkedmakerModel>();
                        model.updateFilter(widget.category, filter.key, value);
                      },
                    ),
                  ),
                ]),
              ),
            ),
        Divider(),
        if (widget.category == 'location')
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: FilledButton(
                  child: Text('Open distance calculator'),
                  onPressed: () {
                    showDistanceDialog(context);
                  },
                ),
              ),
            ],
          ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Button(
                child: Text('Reset'),
                onPressed: () {
                  final model = context.read<SkedmakerModel>();
                  model.resetFilterCategory(widget.category);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  showDistanceDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        final controllerFrom = TextEditingController();
        final controllerTo = TextEditingController();

        var distance = '0';

        return StatefulBuilder(builder: (context, setState) {
          return ContentDialog(
            title: Text('Distance calculator'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Note: This is only an estimate.',
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                InfoLabel(
                  label: 'From:',
                  child: TextBox(
                    controller: controllerFrom,
                    placeholder: 'Room code (eg. A1105)',
                  ),
                ),
                SizedBox(height: 8),
                InfoLabel(
                  label: 'To:',
                  child: TextBox(
                    controller: controllerTo,
                    placeholder: 'Room code (eg. A1105)',
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Button(
                      child: Text('Calculate'),
                      onPressed: () {
                        final from = (controllerFrom.text);
                        final to = (controllerTo.text);
                        setState(() {
                          distance =
                              getLocationDistance(from, to).round().toString();
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    SelectableText("~$distance meters", contextMenuBuilder: (context, state)=>AdaptiveTextSelectionToolbar.editableText(editableTextState: state),),
                  ],
                ),
              ],
            ),
            actions: [
              SizedBox.shrink(),
              Button(
                child: Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
      });
}

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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Generate'),
                          ),
                          onPressed: () {
                            generate(context);
                          }),
                    ),
                    if (model.isGenerating) ProgressBar(),
                    if (!model.isGenerating && model.hasGenerated)
                      Text(
                        'No schedules found.',
                        textAlign: TextAlign.center,
                      )
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Button(
                        child: Text('Generate'),
                        onPressed: () {
                          generate(context);
                        },
                      ),
                    ),
                    Text("${model.schedules.length} schedules found"),
                    if (model.isGenerating) ProgressBar(),
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
              initialAreas: [Area(weight: 0.65)],
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
                DataTable(
            dataRowMinHeight: 36,
            dataRowMaxHeight: 36,
            showCheckboxColumn: true,
            columnSpacing: 10,
                  columns: [
                    DataColumn(label: Text('Subject')),
                    DataColumn(label: Text('Class #')),
                    DataColumn(label: Text('Section')),
                    DataColumn(label: Text('Room')),
                    DataColumn(label: Text('Teacher')),
                    DataColumn(label: Text('Slots')),
                  ],
                  rows: widget.week.subjects
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e.subject)),
                            DataCell(Text(e.classNumber.toString())),
                            DataCell(Text(e.section)),
                            DataCell(Text(e.room)),
                            DataCell(Text(e.teacher)),
                            DataCell(Text(e.slots)),
                          ]))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

generate(BuildContext context) {
  final model = context.read<SkedmakerModel>()
    ..schedules.clear()
    ..isGenerating = true;

// count execution time
  final stopwatch = Stopwatch()..start();

  generageSchedules(
    subjects: model.subjects,
    filters: model.filters,
  ).listen((event) {
    model.addSchedule(event);
  }).onDone(() {
    stopwatch.stop();
    print("ELAPSED TIME: ${stopwatch.elapsedMilliseconds}");

    context.read<SkedmakerModel>().isGenerating = false;
  });
}

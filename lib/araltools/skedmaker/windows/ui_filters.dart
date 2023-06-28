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

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart'
    hide Card, Divider, FilledButton, showDialog;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/strings.g.dart';
import '/utils.dart';
import '../classes.dart';
import '../models.dart';
import '../skedmaker_activity.dart';

class FiltersFragment extends StatefulWidget {
  const FiltersFragment({super.key});

  @override
  State<FiltersFragment> createState() => _FiltersFragmentState();
}

class _FiltersFragmentState extends State<FiltersFragment> {
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
                  body: Column(
                    children: [
                      Expanded(
                        child: LayoutBuilder(builder: (context, constraints) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: 750,
                                maxHeight: constraints.maxHeight),
                            child: FiltersFragmentCategory(
                              category: category.key.$1,
                              icon: category.key.$2,
                            ),
                          );
                        }),
                      ),
                    ],
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
            style: textTheme.headlineMedium,
          ),
        ),
        for (final filter in filters)
          if (filter.valueDefault == null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Text(
                strings['skedmaker.filters.categories.${widget.category}.${filter.key}'] ??
                    filter.key,
                style: textTheme.bodyLarge,
              ),
            )
          else if (filter.valueDefault is Map<String, int> &&
              filter.valueLeast is int &&
              filter.valueMost is int)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
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
                child: Row(mainAxisSize: MainAxisSize.min, children: [
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
                child: Row(mainAxisSize: MainAxisSize.min, children: [
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
                                child: SubjectText(
                                  offering: model.subjects[e]!.first,
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
                              LocationFunctions.getLocationDistance(from, to)
                                  .round()
                                  .toString();
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    SelectableText(
                      "~$distance meters",
                      contextMenuBuilder: (context, state) =>
                          AdaptiveTextSelectionToolbar.editableText(
                              editableTextState: state),
                    ),
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

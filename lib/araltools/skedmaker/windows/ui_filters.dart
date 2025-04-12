// Copyright (C) 2025 Tudlang
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

import 'package:fluent_ui/fluent_ui.dart' hide Chip, Tooltip;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    hide Card, Divider, FilledButton, showDialog, IconButton;
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../filters.dart';
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
    final model = context.watch<SkedmakerModel>();

    final theme = Theme.of(context);

    return NavigationView(
      pane: NavigationPane(
          selected: paneIndex,
          indicator: StickyNavigationIndicator(
            color: theme.colorScheme.primary,
          ),
          onChanged: (value) {
            setState(() {
              paneIndex = value;
            });
          },
          header: kDebugMode
              ? Wrap(
                  children: [
                    Button(
                      child: Text('Print filter values'),
                      onPressed: () {
                        final model = context.read<SkedmakerModel>();
                        final a =
                            JsonEncoder.withIndent("     ", (_) => _.toString())
                                .convert(model.filters.filters);
                        print(a);
                      },
                    ),
                  ],
                )
              : null,
          items: [
            for (final category in model.filters.filters.keys)
              PaneItem(
                icon: Icon(ScheduleFilters.filterIcons[category]),
                body: Column(
                  children: [
                    if (model.isGenerating)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InfoBar(
                            title: Text(
                                strings.skedmaker.infobar.currentlyGeneratingSchedules),
                            severity: InfoBarSeverity.warning,
                          ),
                        ),
                      ),
                    Expanded(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: 750, maxHeight: constraints.maxHeight),
                          child: FiltersFragmentCategory(
                            category: category,
                            icon: Icons.abc,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                title: Text(
                    strings["skedmaker.filters.categories.$category.name"] ??
                        category),
              )

            //PaneItem(
            //  icon: Icon(MdiIcons.schoolOutline),
            //  title: Text('Custom'),
            //  body: Placeholder(),
            //),
          ],
          footerItems: []

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
  late TextTheme textTheme;

  filterText(ScheduleFilter filter, [List<Widget> additional = const []]) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(strings[
                  'skedmaker.filters.categories.${widget.category}.${filter.keyLocalized ?? filter.key}.name'] ??
              filter.key),
          TextOrNull(
              strings[
                  'skedmaker.filters.categories.${widget.category}.${filter.keyLocalized ?? filter.key}.desc'],
              style: textTheme.bodySmall),
          ...additional
        ],
      );

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SkedmakerModel>();
    textTheme = Theme.of(context).textTheme;

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
        SizedBox(height: 10),
        for (final filter in model.filters.filters[widget.category]!.values)
          if (filter.keyDependsOn != null &&
              model
                      .filters
                      .filters[filter.keyDependsOn!.$1]![
                          filter.keyDependsOn!.$2]!
                      .value !=
                  true)
            // return an empty widget if the filter depends on something and its `false`
            SizedBox.shrink()
          else if (filter is ScheduleFilterLabel)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Text(
                strings['skedmaker.filters.categories.${widget.category}.${filter.key}'] ??
                    filter.key,
                style: textTheme.bodyLarge,
              ),
            )
          else if (filter is ScheduleFilterTimeInterval)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  filterText(filter),
                  Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 60),
                    child: NumberBox<int>(
                      value: filter.value.$1,
                      onChanged: (value) {
                        final model = context.read<SkedmakerModel>();
                        value ??= 0;
                        model.updateFilter(
                          category: widget.category,
                          key: filter.key,
                          value: (
                            ScheduleFilterTimeInterval.clamp(value),
                            filter.value.$2,
                          ),
                        );
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
                      value: filter.value.$2,
                      onChanged: (value) {
                        final model = context.read<SkedmakerModel>();
                        value ??= 0;
                        model.updateFilter(
                          category: widget.category,
                          key: filter.key,
                          value: (
                            filter.value.$1,
                            ScheduleFilterTimeInterval.clamp(value),
                          ),
                        );
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
          else if (filter is ScheduleFilterInteger)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  filterText(filter),
                  Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 150),
                    child: NumberBox<int>(
                      value: filter.value,
                      onChanged: (value) {
                        if (value == null) return;
                        final model = context.read<SkedmakerModel>();
                        model.updateFilter(
                          category: widget.category,
                          key: filter.key,
                          value: value,
                        );
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
          else if (filter is ScheduleFilterSwitch)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  filterText(filter),
                  Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: ToggleSwitch(
                      checked: filter.value,
                      onChanged: (value) {
                        final model = context.read<SkedmakerModel>();
                        model.updateFilter(
                          category: widget.category,
                          key: filter.key,
                          value: value,
                        );
                      },
                    ),
                  ),
                ]),
              ),
            )
          else if (filter is ScheduleFilterStringChoices)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(children: [
                  filterText(filter),
                  Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: ComboBox(
                      value: filter.value,
                      items: filter.valueChoices
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
                        model.updateFilter(
                          category: widget.category,
                          key: filter.key,
                          value: value,
                        );
                      },
                    ),
                  ),
                ]),
              ),
            )
          else if (filter is ScheduleFilterSubjects)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Row(children: [
                  filterText(filter),
                  Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: ComboBox(
                      value: filter.value,
                      items: [
                        ComboBoxItem(
                          child: Text(strings.skedmaker.filters.any),
                          value: 'any',
                        ),
                        for (final e in model.subjects.keys)
                          ComboBoxItem(
                            child: model.subjects[e]!.isEmpty
                                ? Text(e)
                                : SubjectText(
                                    offering: model.subjects[e]!.first,
                                  ),
                            value: e,
                          ),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        final model = context.read<SkedmakerModel>();
                        model.updateFilter(
                          category: widget.category,
                          key: filter.key,
                          value: value,
                        );
                      },
                    ),
                  ),
                ]),
              ),
            )
          else if (filter is ScheduleFilterStringWithChip)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      filterText(filter),
                      Spacer(),
                      () {
                        final controller = TextEditingController();

                        submit(String value) {
                          if (value.isEmpty) return;
                          controller.clear();
                          model.updateFilter(
                            category: widget.category,
                            key: filter.key,
                            action: (p0) {
                              (p0 as ScheduleFilterStringWithChip)
                                  .value
                                  .add(value);
                            },
                          );
                        }

                        return ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 200),
                          child: TextBox(
                            suffix: IconButton(
                              onPressed: () {
                                submit(controller.text);
                              },
                              // I am not sure if a check icon is valid here.
                              icon: Tooltip(
                                child: Icon(MdiIcons.check),
                                message: 'Enter',
                              ),
                            ),
                            controller: controller,
                            onSubmitted: submit,
                          ),
                        );
                      }(),
                    ]),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final String text in filter.value)
                          Chip(
                            label: Text(
                              text,
                              style: FluentTheme.of(context).typography.body,
                            ),
                            onDeleted: () {
                              model.updateFilter(
                                category: widget.category,
                                key: filter.key,
                                action: (p0) {
                                  (p0 as ScheduleFilterStringWithChip)
                                      .value
                                      .remove(text);
                                },
                              );
                            },
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
        Divider(),
        if (widget.category == 'location')
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: FilledButton(
                  child: Text(strings
                      .skedmaker.filters.categories.location.calculator.name),
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
                child: Text(strings.skedmaker.filters.reset),
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

        final str = strings.skedmaker.filters.categories.location.calculator;

        return StatefulBuilder(builder: (context, setState) {
          return ContentDialog(
            title: Text(str.title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      str.desc,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                InfoLabel(
                  label: str.from,
                  child: TextBox(
                    controller: controllerFrom,
                    placeholder: str.hint,
                  ),
                ),
                SizedBox(height: 8),
                InfoLabel(
                  label: str.to,
                  child: TextBox(
                    controller: controllerTo,
                    placeholder: str.hint,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Button(
                      child: Text(str.calculate),
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
                      str.result(n: distance.toInt()),
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
                child: Text(strings.general.general.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
      });
}

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

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ScheduleFilter<T> {
  final String key;
  final String? keyLocalized;
  final (String category, String filter)? keyDependsOn;
  final T valueDefault;
  final T? valueMost;
  final T? valueLeast;
  final List<T>? valueChoices;

  ScheduleFilter({
    required this.key,
    required this.valueDefault,
    this.keyDependsOn,
    this.keyLocalized,
    this.valueMost,
    this.valueLeast,
    this.valueChoices,
  });
}

class ScheduleFilters {
  Map<String, Map<String, dynamic>> values;

  ScheduleFilters._({
    this.values = const {},
  });

  factory ScheduleFilters() {
    return ScheduleFilters._(
      values: filters.map((key, value) => MapEntry(key.$1, {})),
    );
  }

  static final filters = <(String, IconData), List<ScheduleFilter>>{
    ('offerings', MdiIcons.schoolOutline): [
      ScheduleFilter<bool>(
        key: 'includeClosed',
        valueDefault: false,
      ),
      ScheduleFilter<bool>(
        key: 'includeFullSlots',
        valueDefault: false,
      ),
      ScheduleFilter<bool>(
        key: 'includeUnknownModality',
        valueDefault: true,
      ),
      ScheduleFilter<bool>(
        key: 'includeNoTeachers',
        valueDefault: true,
      ),
      ScheduleFilter(
        key: 'excludeSectionLetter',
        valueDefault: ScheduleFilterSpecial.stringsWithChip,
      ),
    ],
    ('day', MdiIcons.viewDayOutline): [
      for (final day in const [
        'monday',
        'tuesday',
        'wednesday',
        'thursday',
        'friday',
        'saturday'
      ]) ...[
        ScheduleFilter(
          key: '${day}Name',
          valueDefault: null,
        ),
        ScheduleFilter<int>(
          key: '${day}MaxNumberOfSubjects',
          keyLocalized: 'commonMaxNumberOfSubjects',
          valueDefault: -1,
          valueLeast: -1,
        ),
        ScheduleFilter(
          key: '${day}TimeInterval',
          keyLocalized: 'commonTimeInterval',
          valueDefault: {'start': 730, 'end': 2200},
          valueLeast: 0,
          valueMost: 2359,
        ),
        /* TODO add modality checker
        ScheduleFilter<String>(
          key: '${day}Modality',
          keyLocalized: 'commonModality',
          valueDefault: 'hybrid',
          valueChoices: ['hybrid', 'online', 'face'],
        ),
        */
        ScheduleFilter(
          key: '${day}StartWithSubject',
          keyLocalized: 'commonStartWithSubject',
          valueDefault: ScheduleFilterSpecial.subjects,
        ),
        ScheduleFilter(
          key: '${day}EndWithSubject',
          keyLocalized: 'commonEndWithSubject',
          valueDefault: ScheduleFilterSpecial.subjects,
        ),
        /* //TODO add breaktime
        ScheduleFilter(
          key: '${day}Breaktime',
          keyLocalized: 'commonBreaktime',
          valueDefault: [0, 0],
          valueLeast: 0,
          valueMost: 2359,
        ),
        */
      ]
    ],
    ('location', MdiIcons.mapMarkerOutline): [
      ScheduleFilter<bool>(
        key: 'enabled',
        valueDefault: false,
      ),
      ScheduleFilter<int>(
        key: 'checkingDistanceMinutes',
        keyDependsOn: ('location', 'enabled'),
        valueDefault: 20,
        valueLeast: -1,
      ),
      ScheduleFilter<int>(
        key: 'maxAllowedDistanceMeters',
        keyDependsOn: ('location', 'enabled'),
        valueDefault: 200,
        valueLeast: -1,
      ),
    ],
  };

  //factory ScheduleFilters.fromMap(Map map) {}

  Map<String, Map<String, dynamic>> toMap() => filters.map(
        (key, value) => MapEntry(
          key.$1,
          Map.fromEntries(value.map(
            (e) => MapEntry(
                e.key,
                values[key.$1]?[e.key] ??
                    (e.valueDefault is ScheduleFilterSpecial
                        ? e.valueDefault.valueDefault
                        : e.valueDefault)),
          )),
        ),
      );
}

enum ScheduleFilterSpecial {
  subjects(
    valueDefault: 'any',
  ),
  stringsWithChip,
  ;

  final dynamic valueDefault;
  const ScheduleFilterSpecial({this.valueDefault});
}

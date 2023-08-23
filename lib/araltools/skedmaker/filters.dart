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

import 'package:araltools/utils.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:xml/xml.dart';

import 'classes.dart';

/// Base class for filters
abstract class ScheduleFilter<T> {
  final String key;
  final String? keyLocalized;
  final (String category, String filter)? keyDependsOn;
  final T valueDefault;

  ScheduleFilter({
    required this.key,
    this.keyDependsOn,
    this.keyLocalized,
    required this.valueDefault,
  }) : value = valueDefault;

  T value;

  /// Sets the value for this filter.
  ///
  /// Override this if it needs a custom setter. Do not call super.
  void setValue(dynamic val) {
    value = val;
  }

  /// Resets the current value.
  ///
  /// Override this if it needs to handle resetting differently (eg. a list with `.clear()`).
  void reset() {
    value = valueDefault;
  }

  @override
  String toString() {
    return (key, value.toString()).toString();
  }

  /// Encode [this] filter into XML, given the [builder]
  void encodeXml(XmlBuilder builder);

  void decodeXml(XmlElement xml);
}

/// This is not a filter, but only a label/heading
class ScheduleFilterLabel extends ScheduleFilter<void> {
  ScheduleFilterLabel({
    required super.key,
    super.keyDependsOn,
    super.keyLocalized,
  }) : super(valueDefault: null);

  @override
  void encodeXml(XmlBuilder builder) {
    return;
  }

  @override
  void decodeXml(XmlElement xml) {
    return;
  }
}

/// Filter for a switch
class ScheduleFilterSwitch extends ScheduleFilter<bool> {
  ScheduleFilterSwitch({
    required super.key,
    super.keyDependsOn,
    super.keyLocalized,
    required super.valueDefault,
  });

  @override
  void encodeXml(XmlBuilder builder) {
    builder.element('filter', nest: () {
      builder.text(value);
      builder.attribute('key', key);
    });
  }

  @override
  void decodeXml(XmlElement xml) {
    if (xml.getAttribute('key')! == key) {
      value = bool.parse(xml.innerText);
    }
  }
}

/// Filter for an integer text field
class ScheduleFilterInteger extends ScheduleFilter<int> {
  ScheduleFilterInteger({
    required super.key,
    super.keyDependsOn,
    super.keyLocalized,
    required super.valueDefault,
    this.valueMost,
    this.valueLeast,
  });

  int? valueMost;
  int? valueLeast;

  @override
  void encodeXml(XmlBuilder builder) {
    builder.element('filter', nest: () {
      builder.text(value);
      builder.attribute('key', key);
    });
  }

  @override
  void decodeXml(XmlElement xml) {
    if (xml.getAttribute('key')! == key) {
      value = int.parse(xml.innerText);
    }
  }
}

/// Filter for a subject combobox
class ScheduleFilterSubjects extends ScheduleFilter<String> {
  ScheduleFilterSubjects({
    required super.key,
    super.keyDependsOn,
    super.keyLocalized,
  }) : super(valueDefault: 'any');

  @override
  void encodeXml(XmlBuilder builder) {
    builder.element('filter', nest: () {
      builder.text(value);
      builder.attribute('key', key);
    });
  }

  @override
  void decodeXml(XmlElement xml) {
    if (xml.getAttribute('key')! == key) {
      value = xml.innerText;
    }
  }
}

/// Filter for user-inputted list of strings in chips
class ScheduleFilterStringWithChip extends ScheduleFilter<Set<String>> {
  ScheduleFilterStringWithChip({
    required super.key,
    super.keyDependsOn,
    super.keyLocalized,
  }) : super(valueDefault: {});

  @override
  void reset() {
    value.clear();
  }

  @override
  void encodeXml(XmlBuilder builder) {
    builder.element('filter', nest: () {
      builder.attribute('key', key);
      for (final chip in value) {
        builder.element('chip', nest: chip);
      }
    });
  }

  @override
  void decodeXml(XmlElement xml) {
    if (xml.getAttribute('key')! == key) {
      final newValue = <String>{};
      for (final chipXml in xml.childElements) {
        newValue.add(chipXml.innerText);
      }
      value = newValue;
    }
  }
}

/// Filter for a time interval
class ScheduleFilterTimeInterval extends ScheduleFilter<(int, int)> {
  ScheduleFilterTimeInterval({
    required super.key,
    super.keyDependsOn,
    super.keyLocalized,
    required super.valueDefault,
    this.valueMost = 2359,
    this.valueLeast = 0,
  });

  int valueMost;
  int valueLeast;

  /// Clamps [value] to a valid 24-hour integer format.
  static int clamp(int value) {
    final hour = (value / 100).floor();
    final minute = value % 100;

    if (hour >= 24 && minute >= 60) {
      return 2359;
    } else if (hour >= 24 && minute < 60) {
      return minute + 2300;
    } else if (hour < 24 && minute >= 60) {
      return (hour * 100) + 59;
    } else if (hour < 24 && minute < 60) {
      return (hour * 100) + minute;
    } else {
      return value;
    }
  }

  @override
  void encodeXml(XmlBuilder builder) {
    builder.element('filter', nest: () {
      builder.attribute('key', key);
      builder.element('time', nest: () {
        builder.attribute('start', value.$1);
        builder.attribute('end', value.$2);
      });
    });
  }

  @override
  void decodeXml(XmlElement xml) {
    if (xml.getAttribute('key')! == key) {
      final time = xml.getElement('time')!;

      value = (
        time.getAttribute('start')!.toInt(),
        time.getAttribute('end')!.toInt(),
      );
    }
  }
}

/// Filter for a string from a list of choices
class ScheduleFilterStringChoices extends ScheduleFilter<String> {
  ScheduleFilterStringChoices({
    required super.key,
    super.keyDependsOn,
    super.keyLocalized,
    required super.valueDefault,
    required this.valueChoices,
  });

  List<String> valueChoices;

  @override
  void encodeXml(XmlBuilder builder) {
    builder.element('filter', nest: () {
      builder.text(value!);
      builder.attribute('key', key);
    });
  }

  @override
  void decodeXml(XmlElement xml) {
    if (xml.getAttribute('key')! == key) {
      value = xml.innerText;
    }
  }
}

class ScheduleFilters {
  ScheduleFilters();

  /// Resets all the filters to their default values.
  ///
  /// If [category] is set, then only that category's filters will be reset.
  void reset([String? category]) {
    if (category != null) {
      for (final filter in filters[category]!.values) {
        filter.reset();
      }
    } else {
      for (final cat in filters.values) {
        for (final filter in cat.values) {
          filter.reset();
        }
      }
    }
  }

  /// The actual list of filters
  final filters = <String, Map<String, ScheduleFilter>>{
    'offerings': {
      'includeClosed': ScheduleFilterSwitch(
        key: 'includeClosed',
        valueDefault: false,
      ),
      'includeFullSlots': ScheduleFilterSwitch(
        key: 'includeFullSlots',
        valueDefault: false,
      ),
      'includeUnknownModality': ScheduleFilterSwitch(
        key: 'includeUnknownModality',
        valueDefault: true,
      ),
      'includeNoTeachers': ScheduleFilterSwitch(
        key: 'includeNoTeachers',
        valueDefault: true,
      ),
      'excludeSectionLetter': ScheduleFilterStringWithChip(
        key: 'excludeSectionLetter',
      ),
      'includeFreshmanBlock': ScheduleFilterSwitch(
        key: 'includeFreshmanBlock',
        valueDefault: false,
      ),
    },
    'day': {
      for (final day in const [
        'monday',
        'tuesday',
        'wednesday',
        'thursday',
        'friday',
        'saturday'
      ]) ...{
        '${day}Name': ScheduleFilterLabel(
          key: '${day}Name',
        ),
        '${day}MaxNumberOfSubjects': ScheduleFilterInteger(
          key: '${day}MaxNumberOfSubjects',
          keyLocalized: 'commonMaxNumberOfSubjects',
          valueDefault: -1,
          valueLeast: -1,
        ),
        '${day}TimeInterval': ScheduleFilterTimeInterval(
          key: '${day}TimeInterval',
          keyLocalized: 'commonTimeInterval',
          valueDefault: (730, 2200),
        ),
        /* TODO add modality checker
        ScheduleFilter<String>(
          key: '${day}Modality',
          keyLocalized: 'commonModality',
          valueDefault: 'hybrid',
          valueChoices: ['hybrid', 'online', 'face'],
        ),
        */
        '${day}StartWithSubject': ScheduleFilterSubjects(
          key: '${day}StartWithSubject',
          keyLocalized: 'commonStartWithSubject',
        ),
        '${day}EndWithSubject': ScheduleFilterSubjects(
          key: '${day}EndWithSubject',
          keyLocalized: 'commonEndWithSubject',
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
      }
    },
    'location': {
      'enabled': ScheduleFilterSwitch(
        key: 'enabled',
        valueDefault: false,
      ),
      'checkingDistanceMinutes': ScheduleFilterInteger(
        key: 'checkingDistanceMinutes',
        keyDependsOn: ('location', 'enabled'),
        valueDefault: 20,
        valueLeast: -1,
      ),
      'maxAllowedDistanceMeters': ScheduleFilterInteger(
        key: 'maxAllowedDistanceMeters',
        keyDependsOn: ('location', 'enabled'),
        valueDefault: 200,
        valueLeast: -1,
      ),
    },
  };

  static const filterIcons = {
    'offerings': MdiIcons.schoolOutline,
    'day': MdiIcons.viewDayOutline,
    'location': MdiIcons.mapMarkerOutline,
  };

  /// Function whether to exclude [offering] from generation, given the current filters
  bool shouldExclude(Offering offering) {
    if ((filters['offerings']!['includeClosed']!.value == false &&
            offering.isClosed == true) ||
        (filters['offerings']!['includeFullSlots']!.value == false &&
            offering.slotTaken >= offering.slotCapacity) ||
        (filters['offerings']!['includeUnknownModality']!.value == false &&
            offering.scheduleDay.name.contains('nknown')) ||
        (filters['offerings']!['includeNoTeachers']!.value == false &&
            offering.teacher.isEmpty) ||
        (filters['offerings']!['excludeSectionLetter']!.value?.isNotEmpty ==
                true &&
            (filters['offerings']!['excludeSectionLetter']!.value
                    as Set<String>)
                .any((e) => offering.section
                    .toLowerCase()
                    .contains(e.toLowerCase()))) ||
        (filters['offerings']!['includeFreshmanBlock']!.value == false &&
            RegExp(r'(fr[eo]sh(man)?|fr) ?block')
                .hasMatch(offering.remarks.toLowerCase()))) {
      return true;
    } else {
      return false;
    }
  }

  /// Encode [this] filter into XML, given the [builder]
  void encodeXml(XmlBuilder builder) {
    builder.element('filters', nest: () {
      for (final category in filters.entries) {
        builder.element('category', nest: () {
          builder.attribute('key', category.key);
          for (final filter in category.value.values) {
            filter.encodeXml(builder);
          }
        });
      }
    });
  }

  factory ScheduleFilters.decodeXml(XmlElement xml) {
    final out = ScheduleFilters();

    for (final categoryXml in xml.childElements) {
      final filters = out.filters[categoryXml.getAttribute('key')]!;

      for (final filter in filters.values) {
        for (final filterXml in categoryXml.childElements) {
          if (filterXml.getAttribute('key')! == filter.key) {
            filter.decodeXml(filterXml);
            break;
          }
        }
      }
    }

    return out;
  }
}

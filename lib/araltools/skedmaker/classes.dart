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

// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures, constant_identifier_names

import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import '/strings.g.dart';
import '/utils.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vector_math/vector_math.dart';

import 'functions.dart';

/// An offering for a particular subject
class Offering implements Comparable {
  String subject;
  String section;
  String room;
  String teacher;
  int slotCapacity;
  int slotTaken;
  ScheduleDay scheduleDay;
  late int scheduleTimeStart;
  late int scheduleTimeEnd;
  int classNumber;
  bool isClosed;
  Color color;
  String remarks;

  Offering({
    required this.subject,
    required this.section,
    required this.scheduleDay,
    required this.classNumber,
    this.room = '',
    this.color = const Color(0xCC2196F3),
    this.slotTaken = 0,
    this.slotCapacity = 0,
    this.teacher = '',
    this.isClosed = false,
    this.remarks = ''
  });

  /// Expected input: `1245 - 1415`
  set scheduleTime(String time) {
    scheduleTimeStart = time.substring(0, 4).toInt();
    scheduleTimeEnd = time.substring(7).toInt();
  }

  String get scheduleTime => "$scheduleTimeStart - $scheduleTimeEnd";

  String get slots => "$slotTaken / $slotCapacity";

  double get slotPercentage => slotTaken / slotCapacity;

  bool get isAvailable => !isClosed && slotPercentage < 1.0;

  Map toMap() => {
        'classNumber': classNumber,
        'subject': subject,
        'section': section,
        'room': room,
        'slotCapacity': slotCapacity,
        'slotTaken': slotTaken,
        'scheduleTimeStart': scheduleTimeStart,
        'scheduleTimeEnd': scheduleTimeEnd,
        'scheduleDay': scheduleDay.name,
        'teacher': teacher,
        'color': {
          'r': color.red,
          'g': color.green,
          'b': color.blue,
          'a': color.alpha,
        },
        'isClosed': isClosed,
        'remarks':remarks
      };
  factory Offering.fromMap(Map map) => Offering(
        classNumber: map['classNumber'],
        subject: map['subject'],
        section: map['section'],
        room: map['room'],
        scheduleDay: ScheduleDay.values.byName(map['scheduleDay']),
        color: Color.fromARGB(
          map['color']['a'],
          map['color']['r'],
          map['color']['g'],
          map['color']['b'],
        ),
        teacher: map['teacher'],
        isClosed: map['isClosed'],
        slotCapacity: map['slotCapacity'],
        slotTaken: map['slotTaken'],
        remarks: map['remarks']
      )
        ..scheduleTimeStart = map['scheduleTimeStart']
        ..scheduleTimeEnd = map['scheduleTimeEnd'];

  @override
  String toString() =>
      "$subject-$section-$room ${scheduleDay.daycode}-$scheduleTimeStart-$scheduleTimeEnd";

  bool isAfter(Offering other) =>
      this.scheduleTimeStart > other.scheduleTimeEnd;
  bool isBefore(Offering other) =>
      this.scheduleTimeEnd < other.scheduleTimeStart;

  @override
  int compareTo(other) {
    if (isBefore(other))
      return -1;
    else if (isAfter(other))
      return 1;
    else
      return 0;
  }
}

/// An enum containing all possible schedule days, including their modality
enum ScheduleDay {
  mondayFace('M'),
  mondayOnline('M'),
  mondayHybrid('M'),
  mondayUnknown('M'),
  tuesdayFace('T'),
  tuesdayOnline('T'),
  tuesdayHybrid('T'),
  tuesdayUnknown('T'),
  wednesdayFace('W'),
  wednesdayOnline('W'),
  wednesdayHybrid('W'),
  wednesdayUnknown('W'),
  thursdayFace('H'),
  thursdayOnline('H'),
  thursdayHybrid('H'),
  thursdayUnknown('H'),
  fridayFace('F'),
  fridayOnline('F'),
  fridayHybrid('F'),
  fridayUnknown('F'),
  saturdayFace('S'),
  saturdayOnline('S'),
  saturdayHybrid('S'),
  saturdayUnknown('S'),
  mondaythursdayFace('MH'),
  mondaythursdayOnline('MH'),
  mondaythursdayOnlineface('MH'),
  mondaythursdayFaceonline('MH'),
  mondaythursdayUnknown('MH'),
  tuesdayfridayFace('TF'),
  tuesdayfridayOnline('TF'),
  tuesdayfridayOnlineface('TF'),
  tuesdayfridayFaceonline('TF'),
  tuesdayfridayUnknown('TF'),
  wednesdaysaturdayFace('WS'),
  wednesdaysaturdayOnline('WS'),
  wednesdaysaturdayOnlineface('WS'),
  wednesdaysaturdayFaceonline('WS'),
  wednesdaysaturdayUnknown('WS'),
  unknown('');

  final String daycode;
  const ScheduleDay(this.daycode);

  bool get isMultipleDays => daycode.length > 1;

  String get nameLocalized =>
      strings['skedmaker.scheduleDay.$name.name'] ?? name;
  String get nameShort =>
      strings['skedmaker.scheduleDay.$name.nameShort'] ?? name;

  /// This is meant to be executed once for the initial reading of the <tr>. If there is a second <tr>, call [ScheduleDay.refine()].
  factory ScheduleDay.fromRow({
    required String code,
    bool hasRoom = false,
    required String remarks,
  }) {
    remarks = remarks.toLowerCase();
    return switch (code) {
      'M' when remarks == 'hybrid' || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.mondayHybrid,
      'M' when remarks == 'full online' => ScheduleDay.mondayOnline,
      'M' when remarks == 'f2f' || hasRoom => ScheduleDay.mondayFace,
      'M' => ScheduleDay.mondayUnknown,
      'T' when remarks == 'hybrid' || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.tuesdayHybrid,
      'T' when remarks == 'full online' => ScheduleDay.tuesdayOnline,
      'T' when remarks == 'f2f' || hasRoom => ScheduleDay.tuesdayFace,
      'T' => ScheduleDay.tuesdayUnknown,
      'W' when remarks == 'hybrid' || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.wednesdayHybrid,
      'W' when remarks == 'full online' => ScheduleDay.wednesdayOnline,
      'W' when remarks == 'f2f' || hasRoom => ScheduleDay.wednesdayFace,
      'W' => ScheduleDay.wednesdayUnknown,
      'H' when remarks == 'hybrid' || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.thursdayHybrid,
      'H' when remarks == 'full online' => ScheduleDay.thursdayOnline,
      'H' when remarks == 'f2f' || hasRoom => ScheduleDay.thursdayFace,
      'H' => ScheduleDay.thursdayUnknown,
      'F' when remarks == 'hybrid' || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.fridayHybrid,
      'F' when remarks == 'full online' => ScheduleDay.fridayOnline,
      'F' when remarks == 'f2f' || hasRoom => ScheduleDay.fridayFace,
      'F' => ScheduleDay.fridayUnknown,
      _ => ScheduleDay.unknown
    };
  }

  factory ScheduleDay.refine(
    ScheduleDay old, {
    required String code,
    bool hasRoom = false,
  }) =>
      switch (code) {
        'H' when old == ScheduleDay.mondayFace && hasRoom =>
          ScheduleDay.mondaythursdayFace,
        'H' when old == ScheduleDay.mondayHybrid && !hasRoom =>
          ScheduleDay.mondaythursdayFaceonline,
        'H' when old == ScheduleDay.mondayHybrid && hasRoom =>
          ScheduleDay.mondaythursdayOnlineface,
        'H' when old == ScheduleDay.mondayOnline =>
          ScheduleDay.mondaythursdayOnline,
        'H' => ScheduleDay.mondaythursdayUnknown,
        'F' when old == ScheduleDay.tuesdayFace && hasRoom =>
          ScheduleDay.tuesdayfridayFace,
        'F' when old == ScheduleDay.tuesdayHybrid && !hasRoom =>
          ScheduleDay.tuesdayfridayFaceonline,
        'F' when old == ScheduleDay.tuesdayHybrid && hasRoom =>
          ScheduleDay.tuesdayfridayOnlineface,
        'F' when old == ScheduleDay.tuesdayOnline =>
          ScheduleDay.tuesdayfridayOnline,
        'F' => ScheduleDay.tuesdayfridayUnknown,
        'S' when old == ScheduleDay.wednesdayFace && hasRoom =>
          ScheduleDay.wednesdaysaturdayFace,
        'S' when old == ScheduleDay.wednesdayHybrid && !hasRoom =>
          ScheduleDay.wednesdaysaturdayFaceonline,
        'S' when old == ScheduleDay.wednesdayHybrid && hasRoom =>
          ScheduleDay.wednesdaysaturdayOnlineface,
        'S' when old == ScheduleDay.wednesdayOnline =>
          ScheduleDay.wednesdaysaturdayOnline,
        'S' => ScheduleDay.wednesdaysaturdayUnknown,
        _ => old
      };
}
/*
const distances = {
  'A':269,
  'AG':269,
  'J':66,
  'SJ':66,
  'E':288,
  'ER':288,
  'R':288,
  'G':178,
  'GK':178,
  'L':97,
  'LS':97,
  'Y':73,
  'EY':73,
  'M':98,
  'SM':98,
  'V':45,
  'VL':45
};*/

final distances = {
  'A': vectorFromAngle(236, 336),
  'AG': vectorFromAngle(236, 336),
  'J': vectorFromAngle(73, 272),
  'SJ': vectorFromAngle(73, 272),
  'E': vectorFromAngle(263, 335),
  'ER': vectorFromAngle(263, 335),
  'R': vectorFromAngle(263, 335),
  'G': vectorFromAngle(139, 338),
  'GK': vectorFromAngle(139, 338),
  'L': vectorFromAngle(83, 131),
  'LS': vectorFromAngle(83, 131),
  'Y': vectorFromAngle(62, 185),
  'EY': vectorFromAngle(62, 185),
  'M': vectorFromAngle(90, 332),
  'SM': vectorFromAngle(90, 332),
  'V': vectorFromAngle(55, 5),
  'VL': vectorFromAngle(55, 5),
  'MRE': vectorFromAngle(33776, 170),
};

Vector2 vectorFromAngle(num length, num degree) => Vector2(
      length * cos(degree * degrees2Radians),
      length * sin(degree * degrees2Radians),
    );

mixin LocationFunctions {
  static ({String building, int room, int floor})? parseLocation(
      String roomCode) {
    if (roomCode.isEmpty) return null;
    final room = int.parse(RegExp(r'[0-9]+').stringMatch(roomCode) ?? '0');
    return (
      building: RegExp(r'[A-Z]+').stringMatch(roomCode) ?? '',
      room: room,
      floor: (room / 100).floor()
    );
  }

  /// A vector representing the distance of the room location
  static Vector3 getLocationVector(String building, int floor) {
    final bldg = distances[building] ?? Vector2.zero();

    //Z value times 20 since average floor height (plus stairs) is 20 meters
    return Vector3(bldg.x, bldg.y, floor.toDouble() * 20);
  }

  static double getLocationDistance(String locationFrom, String locationTo) {
    final from = parseLocation(locationFrom);
    final to = parseLocation(locationTo);

    if (from == null || to == null) return 0;

    // the vectors to add
    final sequence = [
      getLocationVector(from.building, from.floor),
      if (from.building != to.building) getLocationVector(from.building, 1),
      if (from.building != to.building) getLocationVector(to.building, 1),
      getLocationVector(to.building, to.floor),
    ];

    // Add the [sequence] in succession
    return sequence.foldIndexed(
      0.0,
      (index, previous, element) =>
          previous +
          element.distanceTo(
            sequence.elementAtOrNull(index + 1) ?? element,
          ),
    );
  }
}

class ScheduleWeek {
  final _daysBytes = {
    0: BigInt.zero,
    1: BigInt.zero,
    2: BigInt.zero,
    3: BigInt.zero,
    4: BigInt.zero,
    5: BigInt.zero,
  };
  Map<int, Set<Offering>> daysOfferings;

  Set<Offering> subjects;

  String name;

  ScheduleWeek()
      // I am so sorry that this is repeated, but each set needs to be separately instantiated
      : daysOfferings = {
          0: SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTimeStart.compareTo(next.scheduleTimeStart)),
          1: SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTimeStart.compareTo(next.scheduleTimeStart)),
          2: SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTimeStart.compareTo(next.scheduleTimeStart)),
          3: SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTimeStart.compareTo(next.scheduleTimeStart)),
          4: SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTimeStart.compareTo(next.scheduleTimeStart)),
          5: SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTimeStart.compareTo(next.scheduleTimeStart)),
        },
        name = '',
        subjects = {};

  String get identifierString =>
      "${daysOfferings[0]!.isNotEmpty ? '🄼' : ''}${daysOfferings[1]!.isNotEmpty ? ' 🅃' : ''}${daysOfferings[2]!.isNotEmpty ? ' 🅆' : ''}${daysOfferings[3]!.isNotEmpty ? ' 🄷' : ''}${daysOfferings[4]!.isNotEmpty ? ' 🄵' : ''}${daysOfferings[5]!.isNotEmpty ? ' 🅂' : ''}";

  static const List<String> daycodes = ["M", "T", "W", "H", "F", "S"];

  static int dayFromCode(String code) => switch (code) {
        'M' => 0,
        'T' => 1,
        'W' => 2,
        'H' => 3,
        'F' => 4,
        'S' => 5,
        _ => throw ArgumentError()
      };

  static BigInt toByte(int start, int end) =>
      BigInt.two.pow(end - start) - BigInt.one << start;

  static bool isByteConflicting(BigInt a, BigInt b) => a & b != BigInt.zero;

  void _addByte({required int daycode, required int start, required int end}) {
    final toAdd = toByte(start, end);
    final byteOfDay = _daysBytes[daycode]!;

    if (isByteConflicting(byteOfDay, toAdd)) {
      throw InvalidScheduleError();
    }

    _daysBytes[daycode] = byteOfDay | toAdd;
  }

  void add(Offering offering) {
    if (subjects.contains(offering)) throw InvalidScheduleError();

    final start = offering.scheduleTimeStart;
    final end = offering.scheduleTimeEnd;

    // make it a for loop so that the multiple days are allowed
    for (final daycode in offering.scheduleDay.daycode.split('')) {
      _addByte(
        daycode: dayFromCode(daycode),
        start: start,
        end: end,
      );
      daysOfferings[dayFromCode(daycode)]!.add(offering);
    }
    subjects.add(offering);
  }

  String get daysOfferingsString =>
      JsonEncoder.withIndent("  ").convert(daysOfferings.map(
        (key, value) => MapEntry("$key ${value.length}",
            value.map((key) => key.toString()).toList()),
      ));

  Map toMap() => {
        'daysOfferings': daysOfferings.map((key, value) =>
            MapEntry(key, value.map((e) => e.toMap()).toList())),
        'subjects': subjects.map((e) => e.toMap()),
        'name': name
      };

  ScheduleWeek.fromMap(Map map)
      : daysOfferings = (map['daysOfferings'] as Map<int, List<Map>>).map(
            (key, value) => MapEntry(key, value.map(Offering.fromMap).toSet())),
        subjects =
            (map['subjects'] as Iterable<Map>).map(Offering.fromMap).toSet(),
        name = map['name'];

  double get weight => 0;
}

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
        keyDependsOn: ('location','enabled'),
        valueDefault: 20,
        valueLeast: -1,
      ),
      ScheduleFilter<int>(
        key: 'maxAllowedDistanceMeters',
        keyDependsOn: ('location','enabled'),
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

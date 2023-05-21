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

// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures

import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:vector_math/vector_math.dart';

/// An offering for a particular subject
class Offering implements Comparable {
  late String subject;
  late String section;
  late String room;
  String teacher;
  late int slotCapacity;
  int slotTaken;
  late ScheduleDay scheduleDay;
  late int scheduleTimeStart;
  late int scheduleTimeEnd;
  late int classNumber;

  Offering()
      : slotTaken = 0,
        teacher = '';

  /// Expected input: `1245 - 1415`
  set scheduleTime(String time) {
    scheduleTimeStart = time.substring(0, 4).toInt();
    scheduleTimeEnd = time.substring(7).toInt();
  }

  String get building => RegExp(r'[A-Z]+').stringMatch(room) ?? '';
  int get roomCode => int.parse(RegExp(r'[0-9]+').stringMatch(room) ?? '0');
  int get floor => (roomCode / 100).floor();

  /// A vector representing the distance of the room location
  Vector3 get location {
    final bldg = distances[building] ?? Vector2.zero();
    //Z falue times 3 since average floor height is 3 meters
    return Vector3(bldg.x, bldg.y, floor.toDouble() * 3);
  }

  /// Gets weight from [this] to [other]
  double getWeight(Offering other) {
    final distance = this.location.distanceTo(other.location);
    // TODO ADD PROF RATING
    return distance;
  }

  Map<Offering, double> generateWeighedGraph(Iterable<Offering> list) {
    return Map.fromEntries(list.map((e) => MapEntry(e, this.getWeight(e))));
  }

  bool isConflicting(Offering other) =>
      this.scheduleTimeStart <= other.scheduleTimeEnd &&
      this.scheduleTimeEnd >= other.scheduleTimeStart;

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
      };
  factory Offering.fromMap(Map map) => Offering()
    ..classNumber = map['classNumber']
    ..subject = map['subject']
    ..section = map['section']
    ..room = map['room']
    ..slotCapacity = map['slotCapacity']
    ..slotTaken = map['slotTaken']
    ..scheduleTimeStart = map['scheduleTimeStart']
    ..scheduleTimeEnd = map['scheduleTimeEnd']
    ..scheduleDay = ScheduleDay.values.byName(map['scheduleDay'])
    ..teacher = map['teacher'];

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

  String get color {
    final random = Random();
    return "hsl(${random.nextInt(45) * 8.0},${(random.nextDouble() * 0.6 + 0.3) * 100}%,${(1 - (random.nextDouble() * 0.6 + 0.3)) * 100}%)";
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

extension StringExtensions on String {
  int toInt() => int.parse(this);
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
  Map<int, List<Offering>> daysOfferings;

  Set<String> subjects;

  String name;

  ScheduleWeek()
      : daysOfferings = {
          0: [],
          1: [],
          2: [],
          3: [],
          4: [],
          5: [],
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

  _addByte({required int daycode, required int start, required int end}) {
    final toAdd = toByte(start, end);
    final byteOfDay = _daysBytes[daycode]!;

    if (isByteConflicting(byteOfDay, toAdd)) {
      throw Error();
    }

    _daysBytes[daycode] = byteOfDay | toAdd;
  }

  add(Offering offering) {
    if (subjects.contains(offering.subject)) throw Error();

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
    subjects.add(offering.subject);
  }

  String get daysOfferingsString => JsonEncoder.withIndent("  ").convert(
      daysOfferings.map((key, value) => MapEntry(
          key.toString() + " ${value.length}",
          value.map((key) => key.toString()).toList())));

  Map toMap() => {
        'daysOfferings': daysOfferings
            .map((key, value) => MapEntry(key, value.map((e) => e.toMap()).toList())),
        'subjects': subjects,
        'name': name
      };

  ScheduleWeek.fromMap(Map map)
      : daysOfferings = (map['daysOfferings'] as Map<int, List<Map>>).map((key, value) => MapEntry(key, value.map(Offering.fromMap).toList())),
        subjects = map['subjects'],
        name = map['name'];

  double get weight => 0;
}

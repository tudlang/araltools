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

import 'package:xml/xml.dart';

import '/strings.g.dart';
import '/utils.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
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
  ({int start, int end}) scheduleTime;
  ({int start, int end})? scheduleTime2;
  int classNumber;
  bool isClosed;
  Color color;
  String remarks;

  static blank(String subject, [Color? color]) => Offering(
      subject: subject,
      section: '0',
      scheduleDay: ScheduleDay.unknown,
      classNumber: 0,
      scheduleTime: '0000 - 0000',
      color: color ?? const Color(0xCC2196F3));

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
    this.remarks = '',
    required String scheduleTime,
  }) : scheduleTime = (
          start: scheduleTime.substring(0, 4).toInt(),
          end: scheduleTime.substring(7).toInt()
        );

  Offering.raw({
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
    this.remarks = '',
    required this.scheduleTime,
    this.scheduleTime2,
  });

  void setScheduleTime2(String val) {
    scheduleTime2 =
        (start: val.substring(0, 4).toInt(), end: val.substring(7).toInt());
  }

  String get scheduleTimeString => scheduleTime2 == null
      ? "${scheduleTime.start} - ${scheduleTime.end}"
      : "${scheduleTime.start} - ${scheduleTime.end}\n${scheduleTime2!.start} - ${scheduleTime2!.end}";

  List<Offering> split() {
    if (scheduleTime2 == null) return [this];

    final splitted = scheduleDay.split();

    return [
      this.copy()
        ..scheduleTime2 = null
        ..scheduleDay = splitted.$1,
      this.copy()
        ..scheduleTime = scheduleTime2!
        ..scheduleTime2 = null
        ..scheduleDay = splitted.$2,
    ];
  }

  String get slots => "$slotTaken / $slotCapacity";

  double get slotPercentage => slotCapacity == 0 ? 1 : slotTaken / slotCapacity;

  bool get isAvailable => !isClosed && slotPercentage < 1.0;

  /// Cretes a new instance of this
  Offering copy() => Offering.raw(
        subject: subject,
        section: section,
        scheduleDay: scheduleDay,
        classNumber: classNumber,
        room: room,
        color: color,
        slotCapacity: slotCapacity,
        slotTaken: slotTaken,
        teacher: teacher,
        isClosed: isClosed,
        remarks: remarks,
        scheduleTime: scheduleTime,
        scheduleTime2: scheduleTime2,
      );

  /// Encode [this] offering into XML, given the [builder]
  void encodeXml(XmlBuilder builder) {
    builder.element('offering', nest: () {
      builder.element('status', nest: isClosed ? 'closed' : 'open');
      builder.element('subject', nest: subject);
      builder.element('classno', nest: classNumber);
      builder.element('section', nest: section);
      builder.element('room', nest: room);
      builder.element('day', nest: scheduleDay.name);
      builder.element('teacher', nest: teacher);

      builder.element('time', nest: () {
        builder.attribute('start', scheduleTime.start);
        builder.attribute('end', scheduleTime.end);
      });
      if (scheduleTime2 != null) {
        builder.element('time', nest: () {
          builder.attribute('start', scheduleTime2!.start);
          builder.attribute('end', scheduleTime2!.end);
        });
      }
      builder.element('slots', nest: () {
        builder.attribute('available', slotTaken);
        builder.attribute('capacity', slotCapacity);
      });
      builder.element('remarks', nest: remarks);
      builder.element('color', nest: color.value.toRadixString(16));
    });
  }

  /// TODO if adding new fields, make them nullable since future files don't have it
  factory Offering.decodeXml(XmlElement xml) {
    final times = xml.findElements('time');
    final slot = xml.getElement('slots')!;

    return Offering.raw(
      isClosed: switch (xml.getElement('status')!.innerText) {
        'closed' => true,
        'open' => false,
        _ => false
      },
      subject: xml.getElement('subject')!.innerText,
      classNumber: xml.getElement('classno')!.innerText.toInt(),
      section: xml.getElement('section')!.innerText,
      room: xml.getElement('room')!.innerText,
      scheduleDay: ScheduleDay.values.byName(xml.getElement('day')!.innerText),
      teacher: xml.getElement('teacher')!.innerText,
      scheduleTime: (
        start: times.first.getAttribute('start')!.toInt(),
        end: times.first.getAttribute('end')!.toInt(),
      ),
      scheduleTime2: times.length == 2
          ? (
              start: times.last.getAttribute('start')!.toInt(),
              end: times.last.getAttribute('end')!.toInt(),
            )
          : null,
      remarks: xml.getElement('remarks')!.innerText,
      color: Color(xml.getElement('color')!.innerText.toInt(radix: 16)),
      slotCapacity: slot.getAttribute('capacity')!.toInt(),
      slotTaken: slot.getAttribute('available')!.toInt(),
    );
  }

  @override
  String toString() =>
      "$subject-$section-$room ${scheduleDay.daycode}-$scheduleTimeString";

  bool isAfter(Offering other) =>
      this.scheduleTime.start > other.scheduleTime.end;
  bool isBefore(Offering other) =>
      this.scheduleTime.end < other.scheduleTime.start;

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
      'M' when remarks.contains('hybrid') || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.mondayHybrid,
      'M'
          when remarks.contains('full online') ||
              remarks.contains('fullonline') =>
        ScheduleDay.mondayOnline,
      'M' when remarks.contains('f2f') || hasRoom => ScheduleDay.mondayFace,
      'M' => ScheduleDay.mondayUnknown,
      'T' when remarks.contains('hybrid') || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.tuesdayHybrid,
      'T'
          when remarks.contains('full online') ||
              remarks.contains('fullonline') =>
        ScheduleDay.tuesdayOnline,
      'T' when remarks.contains('f2f') || hasRoom => ScheduleDay.tuesdayFace,
      'T' => ScheduleDay.tuesdayUnknown,
      'W' when remarks.contains('hybrid') || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.wednesdayHybrid,
      'W'
          when remarks.contains('full online') ||
              remarks.contains('fullonline') =>
        ScheduleDay.wednesdayOnline,
      'W' when remarks.contains('f2f') || hasRoom => ScheduleDay.wednesdayFace,
      'W' => ScheduleDay.wednesdayUnknown,
      'H' when remarks.contains('hybrid') || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.thursdayHybrid,
      'H'
          when remarks.contains('full online') ||
              remarks.contains('fullonline') =>
        ScheduleDay.thursdayOnline,
      'H' when remarks.contains('f2f') || hasRoom => ScheduleDay.thursdayFace,
      'H' => ScheduleDay.thursdayUnknown,
      'F' when remarks.contains('hybrid') || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.fridayHybrid,
      'F'
          when remarks.contains('full online') ||
              remarks.contains('fullonline') =>
        ScheduleDay.fridayOnline,
      'F' when remarks.contains('f2f') || hasRoom => ScheduleDay.fridayFace,
      'F' => ScheduleDay.fridayUnknown,
      'S' when remarks.contains('hybrid') || (remarks.isEmpty && hasRoom) =>
        ScheduleDay.saturdayHybrid,
      'S'
          when remarks.contains('full online') ||
              remarks.contains('fullonline') =>
        ScheduleDay.saturdayOnline,
      'S' when remarks.contains('f2f') || hasRoom => ScheduleDay.saturdayFace,
      'S' => ScheduleDay.saturdayUnknown,
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
        'H' when old == ScheduleDay.mondayUnknown =>
          ScheduleDay.mondaythursdayUnknown,
        'F' when old == ScheduleDay.tuesdayFace && hasRoom =>
          ScheduleDay.tuesdayfridayFace,
        'F' when old == ScheduleDay.tuesdayHybrid && !hasRoom =>
          ScheduleDay.tuesdayfridayFaceonline,
        'F' when old == ScheduleDay.tuesdayHybrid && hasRoom =>
          ScheduleDay.tuesdayfridayOnlineface,
        'F' when old == ScheduleDay.tuesdayOnline =>
          ScheduleDay.tuesdayfridayOnline,
        'F' when old == ScheduleDay.tuesdayUnknown =>
          ScheduleDay.tuesdayfridayUnknown,
        'S' when old == ScheduleDay.wednesdayFace && hasRoom =>
          ScheduleDay.wednesdaysaturdayFace,
        'S' when old == ScheduleDay.wednesdayHybrid && !hasRoom =>
          ScheduleDay.wednesdaysaturdayFaceonline,
        'S' when old == ScheduleDay.wednesdayHybrid && hasRoom =>
          ScheduleDay.wednesdaysaturdayOnlineface,
        'S' when old == ScheduleDay.wednesdayOnline =>
          ScheduleDay.wednesdaysaturdayOnline,
        'S' when old == ScheduleDay.wednesdayUnknown =>
          ScheduleDay.wednesdaysaturdayUnknown,
        _ => old
      };

  (ScheduleDay, ScheduleDay) split() => switch (this) {
        mondaythursdayFace => (mondayFace, thursdayFace),
        mondaythursdayOnline => (mondayOnline, thursdayOnline),
        mondaythursdayFaceonline => (mondayFace, thursdayOnline),
        mondaythursdayOnlineface => (mondayOnline, thursdayFace),
        mondaythursdayUnknown => (mondayUnknown, thursdayUnknown),
        tuesdayfridayFace => (tuesdayFace, fridayFace),
        tuesdayfridayOnline => (tuesdayOnline, fridayOnline),
        tuesdayfridayFaceonline => (tuesdayFace, fridayOnline),
        tuesdayfridayOnlineface => (tuesdayOnline, fridayFace),
        tuesdayfridayUnknown => (tuesdayUnknown, fridayUnknown),
        wednesdaysaturdayFace => (wednesdayFace, saturdayFace),
        wednesdaysaturdayOnline => (wednesdayOnline, saturdayOnline),
        wednesdaysaturdayFaceonline => (wednesdayFace, saturdayOnline),
        wednesdaysaturdayOnlineface => (wednesdayOnline, saturdayFace),
        wednesdaysaturdayUnknown => (wednesdayUnknown, saturdayUnknown),
        // Default: just duplicate the original
        _ => (this, this)
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
    'M': BigInt.zero,
    'T': BigInt.zero,
    'W': BigInt.zero,
    'H': BigInt.zero,
    'F': BigInt.zero,
    'S': BigInt.zero,
  };
  Map<String, Set<Offering>> daysOfferings;

  Set<Offering> subjects;

  String name;
  String notes;

  bool isStarred;

  ScheduleWeek()
      // I am so sorry that this is repeated, but each set needs to be separately instantiated
      : daysOfferings = {
          'M': SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTime.start.compareTo(next.scheduleTime.start)),
          'T': SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTime.start.compareTo(next.scheduleTime.start)),
          'W': SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTime.start.compareTo(next.scheduleTime.start)),
          'H': SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTime.start.compareTo(next.scheduleTime.start)),
          'F': SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTime.start.compareTo(next.scheduleTime.start)),
          'S': SplayTreeSet<Offering>((prev, next) =>
              prev.scheduleTime.start.compareTo(next.scheduleTime.start)),
        },
        name = '',
        subjects = {},
        notes = '',
        isStarred = false;

  String get identifierString =>
      "${daysOfferings['M']!.isNotEmpty ? '🄼' : ''}${daysOfferings['T']!.isNotEmpty ? ' 🅃' : ''}${daysOfferings['W']!.isNotEmpty ? ' 🅆' : ''}${daysOfferings['H']!.isNotEmpty ? ' 🄷' : ''}${daysOfferings['F']!.isNotEmpty ? ' 🄵' : ''}${daysOfferings['S']!.isNotEmpty ? ' 🅂' : ''}";

  static const List<String> daycodes = ["M", "T", "W", "H", "F", "S"];

  static BigInt toByte(int start, int end) =>
      BigInt.two.pow(end - start) - BigInt.one << start;

  static bool isByteConflicting(BigInt a, BigInt b) => a & b != BigInt.zero;

  void _addByte(
      {required String daycode, required int start, required int end}) {
    final toAdd = toByte(start, end);
    final byteOfDay = _daysBytes[daycode]!;

    if (isByteConflicting(byteOfDay, toAdd)) {
      throw InvalidScheduleError();
    }

    _daysBytes[daycode] = byteOfDay | toAdd;
  }

  void add(Offering offering) {
    if (subjects.contains(offering)) throw InvalidScheduleError();

    // make it a for loop so that the multiple days are allowed
    for (final _offering in offering.split()) {
      _addByte(
        daycode: _offering.scheduleDay.daycode,
        start: _offering.scheduleTime.start,
        end: _offering.scheduleTime.end,
      );
      daysOfferings[_offering.scheduleDay.daycode]!.add(_offering);
    }
    subjects.add(offering);
  }

  String get daysOfferingsString =>
      JsonEncoder.withIndent("  ").convert(daysOfferings.map(
        (key, value) => MapEntry("$key ${value.length}",
            value.map((key) => key.toString()).toList()),
      ));

  double get weight => 0;

  /// Encode [this] schedule into XML, given the [builder]
  void encodeXml(XmlBuilder builder) {
    builder.element('schedule', nest: () {
      builder.element('name', nest: name);
      builder.element('notes', nest: notes);
      builder.element('isStarred', nest: isStarred);
      builder.element('subjects', nest: () {
        for (final subject in subjects) {
          subject.encodeXml(builder);
        }
      });
      builder.element('days', nest: () {
        for (final day in const [
          ('monday', 'M'),
          ('tuesday', 'T'),
          ('wednesday', 'W'),
          ('thursday', 'H'),
          ('friday', 'F'),
          ('saturday', 'S'),
        ])
          builder.element(day.$1, nest: () {
            for (final subject in daysOfferings[day.$2]!) {
              subject.encodeXml(builder);
            }
          });
      });
    });
  }

  /// TODO if adding new fields, make them nullable since future files don't have it
  factory ScheduleWeek.decodeXml(XmlElement xml) {
    final name = xml.getElement('name')!.innerText;
    final notes = xml.getElement('notes')!.innerText;
    final isStarred = bool.parse(xml.getElement('isStarred')!.innerText);
    final subjects = <Offering>{};
    final daysOfferings = <String, Set<Offering>>{};

    for (final subjectsXml in xml.getElement('subjects')!.childElements) {
      subjects.add(Offering.decodeXml(subjectsXml));
    }

    for (final day in const [
      ('monday', 'M'),
      ('tuesday', 'T'),
      ('wednesday', 'W'),
      ('thursday', 'H'),
      ('friday', 'F'),
      ('saturday', 'S'),
    ]) {
      final set = <Offering>{};

      for (final subject
          in xml.getElement('days')!.getElement(day.$1)!.childElements) {
        set.add(Offering.decodeXml(subject));
      }

      daysOfferings[day.$2] = set;
    }

    return ScheduleWeek()
      ..name = name
      ..notes = notes
      ..daysOfferings = daysOfferings
      ..subjects = subjects
      ..isStarred = isStarred;
  }
}

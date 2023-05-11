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
      "$subject-$section-$room $scheduleTimeStart-$scheduleTimeEnd";

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
    switch (code) {
      case 'M':
        if (remarks == 'hybrid' || (remarks.isEmpty && hasRoom)) {
          return ScheduleDay.mondayHybrid;
        } else if (remarks == 'full online') {
          return ScheduleDay.mondayOnline;
        } else if (remarks == 'f2f' || hasRoom) {
          return ScheduleDay.mondayFace;
        } else {
          return ScheduleDay.mondayUnknown;
        }
      case 'T':
        if (remarks == 'hybrid' || (remarks.isEmpty && hasRoom)) {
          return ScheduleDay.tuesdayHybrid;
        } else if (remarks == 'full online') {
          return ScheduleDay.tuesdayOnline;
        } else if (remarks == 'f2f' || hasRoom) {
          return ScheduleDay.tuesdayFace;
        } else {
          return ScheduleDay.tuesdayUnknown;
        }
      case 'W':
        if (remarks == 'hybrid' || (remarks.isEmpty && hasRoom)) {
          return ScheduleDay.wednesdayHybrid;
        } else if (remarks == 'full online') {
          return ScheduleDay.wednesdayOnline;
        } else if (remarks == 'f2f' || hasRoom) {
          return ScheduleDay.wednesdayFace;
        } else {
          return ScheduleDay.wednesdayUnknown;
        }
      case 'H':
        if (remarks == 'hybrid' || (remarks.isEmpty && hasRoom)) {
          return ScheduleDay.thursdayHybrid;
        } else if (remarks == 'full online') {
          return ScheduleDay.thursdayOnline;
        } else if (remarks == 'f2f' || hasRoom) {
          return ScheduleDay.thursdayFace;
        } else {
          return ScheduleDay.thursdayUnknown;
        }
      case 'F':
        if (remarks == 'hybrid' || (remarks.isEmpty && hasRoom)) {
          return ScheduleDay.fridayHybrid;
        } else if (remarks == 'full online') {
          return ScheduleDay.fridayOnline;
        } else if (remarks == 'f2f' || hasRoom) {
          return ScheduleDay.fridayFace;
        } else {
          return ScheduleDay.fridayUnknown;
        }
      default:
        return ScheduleDay.unknown;
    }
  }

  factory ScheduleDay.refine(
    ScheduleDay old, {
    required String code,
    bool hasRoom = false,
  }) {
    switch (code) {
      case 'H':
        if (old == ScheduleDay.mondayFace && hasRoom) {
          return ScheduleDay.mondaythursdayFace;
        } else if (old == ScheduleDay.mondayHybrid && !hasRoom) {
          return ScheduleDay.mondaythursdayFaceonline;
        } else if (old == ScheduleDay.mondayHybrid && hasRoom) {
          return ScheduleDay.mondaythursdayOnlineface;
        } else if (old == ScheduleDay.mondayOnline) {
          return ScheduleDay.mondaythursdayOnline;
        } else {
          return ScheduleDay.mondaythursdayUnknown;
        }
      case 'F':
        if (old == ScheduleDay.tuesdayFace && hasRoom) {
          return ScheduleDay.tuesdayfridayFace;
        } else if (old == ScheduleDay.tuesdayHybrid && !hasRoom) {
          return ScheduleDay.tuesdayfridayFaceonline;
        } else if (old == ScheduleDay.tuesdayHybrid && hasRoom) {
          return ScheduleDay.tuesdayfridayOnlineface;
        } else if (old == ScheduleDay.tuesdayOnline) {
          return ScheduleDay.tuesdayfridayOnline;
        } else {
          return ScheduleDay.tuesdayfridayUnknown;
        }
      case 'S':
        if (old == ScheduleDay.wednesdayFace && hasRoom) {
          return ScheduleDay.wednesdaysaturdayFace;
        } else if (old == ScheduleDay.wednesdayHybrid && !hasRoom) {
          return ScheduleDay.wednesdaysaturdayFaceonline;
        } else if (old == ScheduleDay.wednesdayHybrid && hasRoom) {
          return ScheduleDay.wednesdaysaturdayOnlineface;
        } else if (old == ScheduleDay.wednesdayOnline) {
          return ScheduleDay.wednesdaysaturdayOnline;
        } else {
          return ScheduleDay.wednesdaysaturdayUnknown;
        }
      default:
        return old;
    }
  }
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
  OfferingDay monday;
  OfferingDay tuesday;
  OfferingDay wednesday;
  OfferingDay thursday;
  OfferingDay friday;
  OfferingDay saturday;

  Set<String> subjects;

  String name;

  double weight;

  ScheduleWeek()
      : monday = OfferingDay('M'),
        tuesday = OfferingDay('T'),
        wednesday = OfferingDay('W'),
        thursday = OfferingDay('H'),
        friday = OfferingDay('F'),
        saturday = OfferingDay('S'),
        name = '',
        subjects = {},
        weight = 0;

  factory ScheduleWeek.fromList(
    List<OfferingDay> list, {
    double weight = 0,
  }) {
    if (list.length > 6) throw ArgumentError();

    final output = ScheduleWeek();
    output.weight = weight;
    final subjects = <String>{};
    for (OfferingDay day in list) {
      output
        ..monday = (day.every((e) {
          subjects.add(e.subject);
          return e.scheduleDay.daycode.contains('M');
        }))
            ? day
            : output.monday
        ..tuesday = (day.every((e) {
          subjects.add(e.subject);
          return e.scheduleDay.daycode.contains('T');
        }))
            ? day
            : output.tuesday
        ..wednesday = (day.every((e) {
          subjects.add(e.subject);
          return e.scheduleDay.daycode.contains('W');
        }))
            ? day
            : output.wednesday
        ..thursday = (day.every((e) {
          subjects.add(e.subject);
          return e.scheduleDay.daycode.contains('H');
        }))
            ? day
            : output.thursday
        ..friday = (day.every((e) {
          subjects.add(e.subject);
          return e.scheduleDay.daycode.contains('F');
        }))
            ? day
            : output.friday
        ..saturday = (day.every((e) {
          subjects.add(e.subject);
          return e.scheduleDay.daycode.contains('S');
        }))
            ? day
            : output.saturday;
    }

    return output..subjects = subjects;
  }

  OfferingDay from(String daycode) {
    switch (daycode) {
      case 'M':
        return monday;
      case 'T':
        return tuesday;
      case 'W':
        return wednesday;
      case 'H':
        return thursday;
      case 'F':
        return friday;
      case 'S':
        return saturday;
      default:
        throw ArgumentError(daycode);
    }
  }

  bool get isValid {
    if (monday.isEmpty &&
        tuesday.isEmpty &&
        wednesday.isEmpty &&
        thursday.isEmpty &&
        friday.isEmpty &&
        saturday.isEmpty) return false;

    final subjectsTemp = <String>{};

    late bool sameClass;

    for (final schedM in monday) {
      sameClass = thursday.any((e) => e.classNumber == schedM.classNumber);

      if (schedM.scheduleDay.daycode == 'MH' && !sameClass) return false;

      if (subjectsTemp.contains(schedM.subject) && !sameClass) return false;

      subjectsTemp.add(schedM.subject);
    }
    for (final schedT in tuesday) {
      sameClass = friday.any((e) => e.classNumber == schedT.classNumber);

      if (schedT.scheduleDay.daycode == 'TF' && !sameClass) return false;
      if (subjectsTemp.contains(schedT.subject) && !sameClass) return false;

      subjectsTemp.add(schedT.subject);
    }

    for (final schedW in wednesday) {
      sameClass = saturday.any((e) => e.classNumber == schedW.classNumber);

      if (schedW.scheduleDay.daycode == 'WS' && !sameClass) return false;

      if (subjectsTemp.contains(schedW.subject) && !sameClass) return false;

      subjectsTemp.add(schedW.subject);
    }

    for (final schedH in thursday) {
      sameClass = monday.any((e) => e.classNumber == schedH.classNumber);
      if (schedH.scheduleDay.daycode == 'MH' && !sameClass) return false;

      if (subjectsTemp.contains(schedH.subject) && !sameClass) return false;

      subjectsTemp.add(schedH.subject);
    }

    for (final schedF in friday) {
      sameClass = tuesday.any((e) => e.classNumber == schedF.classNumber);

      if (schedF.scheduleDay.daycode == 'TF' && !sameClass) return false;

      if (subjectsTemp.contains(schedF.subject) && !sameClass) return false;

      subjectsTemp.add(schedF.subject);
    }

    for (final schedS in saturday) {
      sameClass = wednesday.any((e) => e.classNumber == schedS.classNumber);

      if (schedS.scheduleDay.daycode == 'WS' && !sameClass) return false;

      if (subjectsTemp.contains(schedS.subject) && !sameClass) return false;

      subjectsTemp.add(schedS.subject);
    }

    if (!subjectsTemp.containsAll(this.subjects)) return false;
    return true;
  }

  String get identifierString =>
      "${monday.isNotEmpty ? '🄼' : ''}${tuesday.isNotEmpty ? ' 🅃' : ''}${wednesday.isNotEmpty ? ' 🅆' : ''}${thursday.isNotEmpty ? ' 🄷' : ''}${friday.isNotEmpty ? ' 🄵' : ''}${saturday.isNotEmpty ? ' 🅂' : ''}";

  static const List<String> daycodes = ["M", "T", "W", "H", "F", "S"];

  @override
  String toString() => {
        'm': monday,
        't': tuesday,
        'w': wednesday,
        'h': thursday,
        'f': friday,
        's': saturday
      }.toString();

  Map toMap() => {
        'm': monday.toMap(),
        't': tuesday.toMap(),
        'w': wednesday.toMap(),
        'h': thursday.toMap(),
        'f': friday.toMap(),
        's': saturday.toMap(),
        'name': name,
        'subjects': subjects,
        'weight': weight,
      };

  factory ScheduleWeek.fromMap(Map map) => ScheduleWeek()
    ..monday = OfferingDay.fromMap(map['m'])
    ..tuesday = OfferingDay.fromMap(map['t'])
    ..wednesday = OfferingDay.fromMap(map['w'])
    ..thursday = OfferingDay.fromMap(map['h'])
    ..friday = OfferingDay.fromMap(map['f'])
    ..saturday = OfferingDay.fromMap(map['s'])
    ..name = map['name']
    ..subjects = map['subjects']
    ..weight = map['weight'];

  @override
  operator ==(Object other) {
    if (other is! ScheduleWeek) return false;

    return this.monday.containsAll(other.monday) &&
        this.tuesday.containsAll(other.tuesday) &&
        this.wednesday.containsAll(other.wednesday) &&
        this.thursday.containsAll(other.thursday) &&
        this.friday.containsAll(other.friday) &&
        this.saturday.containsAll(other.saturday) &&
        this.name == other.name &&
        this.subjects.containsAll(other.subjects);
  }

  @override
  int get hashCode =>
      monday.hashCode +
      tuesday.hashCode +
      wednesday.hashCode +
      thursday.hashCode +
      friday.hashCode +
      saturday.hashCode;
}

/// A list of [Offering] that's on the same day
class OfferingDay implements Set<Offering> {
  //SplayTreeSet since we want to sort it by time
  SplayTreeSet<Offering> list;
  String daycode;

  OfferingDay(this.daycode, {Iterable? list})
      : list = SplayTreeSet.from(list ?? const [], (a, b) {
          return a.classNumber.compareTo(b.classNumber);
        });

  OfferingDay.single(this.daycode, Offering offering)
      : list = SplayTreeSet.from([offering], (a, b) {
          return a.classNumber.compareTo(b.classNumber);
        });

  Set<String> get subjects =>
      list.fold({}, (previous, element) => previous..add(element.subject));

  Offering getSubject(String subject) =>
      list.singleWhere((element) => element.subject == subject);

  bool conflictsWith(OfferingDay other) {
    try {
      // Different offerings of same subject remover
      final sameSubjects = this.subjects.intersection(other.subjects);
      for (final subject in sameSubjects) {
        if (this.getSubject(subject).classNumber !=
            other.getSubject(subject).classNumber) return true;
      }
    } catch (e) {
      return true;
    }
    return false;
  }

  @override
  String toString() => "$daycode $list";

  Map toMap() => {
        'list': list.map((e) => e.toMap()).toList(),
        'daycode': daycode,
      };

  factory OfferingDay.fromMap(Map map) => OfferingDay(map['daycode'],
      list: (map['list'] as Iterable<Map>).map(Offering.fromMap));

  @override
  bool any(bool Function(Offering element) test) => list.any(test);

  @override
  Set<R> cast<R>() => list.cast<R>();

  @override
  bool contains(Object? element) => list.contains(element);

  @override
  Offering elementAt(int index) => list.elementAt(index);

  @override
  bool every(bool Function(Offering element) test) => list.every(test);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(Offering element) toElements) =>
      list.expand(toElements);

  @override
  Offering get first => list.first;

  @override
  Offering firstWhere(bool Function(Offering element) test,
          {Offering Function()? orElse}) =>
      list.firstWhere(test, orElse: orElse);

  @override
  T fold<T>(T initialValue,
          T Function(T previousValue, Offering element) combine) =>
      list.fold(initialValue, combine);

  @override
  Iterable<Offering> followedBy(Iterable<Offering> other) => followedBy(other);

  @override
  void forEach(void Function(Offering element) action) => list.forEach(action);

  @override
  bool get isEmpty => list.isEmpty;

  @override
  bool get isNotEmpty => list.isNotEmpty;

  @override
  Iterator<Offering> get iterator => list.iterator;

  @override
  String join([String separator = ""]) => list.join(separator);

  @override
  Offering get last => list.last;

  @override
  Offering lastWhere(bool Function(Offering element) test,
          {Offering Function()? orElse}) =>
      list.lastWhere(test, orElse: orElse);

  @override
  int get length => list.length;

  @override
  Iterable<T> map<T>(T Function(Offering e) toElement) => list.map(toElement);

  @override
  Offering reduce(
          Offering Function(Offering value, Offering element) combine) =>
      list.reduce(combine);

  @override
  Offering get single => list.single;

  @override
  Offering singleWhere(bool Function(Offering element) test,
          {Offering Function()? orElse}) =>
      list.singleWhere(test, orElse: orElse);

  @override
  Iterable<Offering> skip(int count) => list.skip(count);

  @override
  Iterable<Offering> skipWhile(bool Function(Offering value) test) =>
      list.skipWhile(test);

  @override
  Iterable<Offering> take(int count) => list.take(count);

  @override
  Iterable<Offering> takeWhile(bool Function(Offering value) test) =>
      list.takeWhile(test);

  @override
  List<Offering> toList({bool growable = true}) =>
      list.toList(growable: growable);

  @override
  Set<Offering> toSet() => list.toSet();

  @override
  Iterable<Offering> where(bool Function(Offering element) test) =>
      list.where(test);

  @override
  Iterable<T> whereType<T>() => list.whereType<T>();

  @override
  bool add(Offering element) => list.add(element);

  @override
  void addAll(Iterable<Offering> elements) => list.addAll(elements);

  @override
  void clear() => list.clear();

  @override
  bool containsAll(Iterable<Object?> other) => list.containsAll(other);

  @override
  Set<Offering> difference(Set<Object?> other) => list.difference(other);

  @override
  Set<Offering> intersection(Set<Object?> other) => list.intersection(other);

  @override
  Offering? lookup(Object? object) => list.lookup(object);

  @override
  bool remove(Object? object) => list.remove(object);

  @override
  void removeAll(Iterable<Object?> elements) => list.removeAll(elements);

  @override
  void removeWhere(bool Function(Offering element) test) =>
      list.removeWhere(test);

  @override
  void retainAll(Iterable<Object?> elements) => list.removeAll(elements);

  @override
  void retainWhere(bool Function(Offering element) test) =>
      list.retainWhere(test);

  @override
  Set<Offering> union(Set<Offering> other) => list.union(other);
}

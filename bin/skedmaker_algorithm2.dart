import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:araltools/araltools/skedmaker/classes.dart' hide ScheduleWeek;
import 'package:araltools/araltools/skedmaker/functions.dart';
import 'package:araltools/araltools/skedmaker/test_tables.dart';
import 'package:collection/collection.dart';

int factorial(int n) => n == 0 ? 1 : n * factorial(n - 1);

void main() {
  // count execution time
  final stopwatch = Stopwatch()..start();

  Map<String, List<Offering>> subjects = {};

  subjects['CALENG2'] = parse(caleng2);
  subjects['LBYMF1C'] = parse(lbymf1c);
  subjects['LCLSONE'] = parse(lclsone);
  //subjects['LBYMF1D'] = parse(lbymf1d);

  //List<Offering> all = [for (final i in subjects.values) ...i];

  Set<ScheduleWeek> schedules = {};

  add(Map<String, List<Offering>> subjects){
    if (subjects.length==1){
      
    }
  }

  for (final entry in subjects.entries){

    


  }


  stopwatch.stop();
  print("ELAPSED TIME: ${stopwatch.elapsedMilliseconds}");
}

// set the weights AFTER

final days = ["M", "T", "W", "H", "F", "S"];

class ScheduleWeek {
  Map<int, BigInt> daysBytes;
  Map<int, List<Offering>> daysOfferings;
  Set<(String, int)> subjects;

  ScheduleWeek()
      : daysBytes = {
          0: BigInt.zero,
          1: BigInt.zero,
          2: BigInt.zero,
          3: BigInt.zero,
          4: BigInt.zero,
          5: BigInt.zero,
        },
        daysOfferings = {
          0: [],
          1: [],
          2: [],
          3: [],
          4: [],
          5: [],
        }, subjects={};

  BigInt toByte(int start, int end) =>
      BigInt.from(2).pow(end - start) - BigInt.one << start;

  bool isByteConflicting(BigInt a, BigInt b) => a & b != BigInt.zero;

  addByte({required int daycode, required int start, required int end}) {
    final toAdd = toByte(start, end);
    final byteOfDay = daysBytes[daycode]!;

    if (isByteConflicting(byteOfDay, toAdd)) {
      throw Error();
    }

    daysBytes[daycode] = byteOfDay | toAdd;
  }

  add(Offering offering) {
    final start = offering.scheduleTimeStart;
    final end = offering.scheduleTimeEnd;

    int dayFromCode(String code) => switch (code) {
          'M' => 0,
          'T' => 1,
          'W' => 2,
          'H' => 3,
          'F' => 4,
          'S' => 5,
          _ => throw ArgumentError()
        };

    // make it a for loop so that the multiple days are allowed
    for (final daycode in offering.scheduleDay.daycode.split('')) {
      addByte(
        daycode: dayFromCode(daycode),
        start: start,
        end: end,
      );
      daysOfferings[dayFromCode(daycode)]!.add(offering);
    }

  }

  String get daysOfferingsString => JsonEncoder.withIndent("  ").convert(
      daysOfferings.map((key, value) => MapEntry(
          key.toString() + " ${value.length}",
          value.map((key) => key.toString()).toList())));
}

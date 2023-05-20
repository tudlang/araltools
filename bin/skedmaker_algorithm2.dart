import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:araltools/araltools/skedmaker/classes.dart' hide ScheduleWeek;
import 'package:araltools/araltools/skedmaker/functions.dart';
import 'package:araltools/araltools/skedmaker/test_tables.dart';
import 'package:collection/collection.dart';
import 'package:directed_graph/directed_graph.dart';

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

  create(subjects).listen((event) {
    print(event.daysOfferingsString);
  print("ELAPSED TIME: ${stopwatch.elapsedMilliseconds}");
  });
  //stopwatch.stop();
}

// set the weights AFTER

Stream<ScheduleWeek> create(Map<String, List<Offering>> subjects) {
  late final StreamController<ScheduleWeek> controller;

  void generateCombination(Map<String, List<Offering>> currentMap,
      List<Offering> currentCombination) {
    if (currentMap.isEmpty) {
      // Base case: All entries processed, add the combination to the list

      try {
        final week = ScheduleWeek();
        for (final offering in currentCombination) {
          week.add(offering);
        }
        controller.add(week);
      } catch (e) {
        return;
      }
      return;
    }

    String currentKey = currentMap.keys.first;
    List<Offering> currentValues = currentMap[currentKey]!;

    // Iterate over each Offering in the current entry
    for (final currentOffering in currentValues) {
      // Create a copy of the current combination
      final updatedCombination = List<Offering>.from(currentCombination);
      updatedCombination.add(currentOffering);

      // Create a copy of the current map without the processed entry
      final updatedMap = Map<String, List<Offering>>.from(currentMap);
      updatedMap.remove(currentKey);

      // Recursively generate combinations for the updated map and combination
      generateCombination(updatedMap, updatedCombination);
    }
  }

  controller = StreamController(
    onListen: () {
      generateCombination(subjects, []);
    },
  );
  return controller.stream;
}

class ScheduleWeek {
  Map<int, BigInt> daysBytes;
  Map<int, List<Offering>> daysOfferings;
  Set<String> subjects;

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
        },
        subjects = {};

  static BigInt toByte(int start, int end) =>
      BigInt.two.pow(end - start) - BigInt.one << start;

  static bool isByteConflicting(BigInt a, BigInt b) => a & b != BigInt.zero;

  addByte({required int daycode, required int start, required int end}) {
    final toAdd = toByte(start, end);
    final byteOfDay = daysBytes[daycode]!;

    if (isByteConflicting(byteOfDay, toAdd)) {
      throw Error();
    }

    daysBytes[daycode] = byteOfDay | toAdd;
  }

  add(Offering offering) {
    if (subjects.contains(offering.subject)) throw Error();

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
    subjects.add(offering.subject);
  }

  String get daysOfferingsString => JsonEncoder.withIndent("  ").convert(
      daysOfferings.map((key, value) => MapEntry(
          key.toString() + " ${value.length}",
          value.map((key) => key.toString()).toList())));
}

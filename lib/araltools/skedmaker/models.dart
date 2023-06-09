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

import 'dart:async';

import 'package:araltools/utils.dart';
import 'package:flutter/material.dart';

import 'classes.dart';
import 'functions.dart';

/// The model used to store the entire state of SkedMaker, used with [ChangeNotifierProvider]
class SkedmakerModel extends ChangeNotifier {
  Map<String, List<Offering>> subjects;
  Set<ScheduleWeek> _schedules;
  ScheduleWeek? _schedulesSelected;

  void addSubject(String code, List<Offering> list) {
    subjects[code] = list;
    notifyListeners();
  }

  void removeSubject(String code) {
    subjects.remove(code);
    notifyListeners();
  }

  Set<ScheduleWeek> get schedules => _schedules;
  set schedules(Set<ScheduleWeek> a) {
    _schedules = a;
    _schedulesSelected = null;
    notifyListeners();
  }

  void addSchedule(ScheduleWeek a) {
    _schedules.add(a);
    notifyListeners();
  }

  void removeSchedule(ScheduleWeek a) {
    _schedules.remove(a);
    notifyListeners();
  }

  void modifySchedule(int tabIndex, void Function(ScheduleWeek week) modify) {
    modify(_schedules.elementAt(_tabs[tabIndex]));
    notifyListeners();
  }

  ScheduleWeek? get schedulesSelected => _schedulesSelected;
  set schedulesSelected(ScheduleWeek? a) {
    _schedulesSelected = a;
    notifyListeners();
  }

  bool _isGenerating = false;
  bool get isGenerating => _isGenerating;
  set isGenerating(bool a) {
    _isGenerating = a;
    if (a) _hasGenerated = true;
    notifyListeners();
  }

  bool _hasGenerated = false;
  bool get hasGenerated => _hasGenerated;
  set hasGenerated(bool a) {
    _hasGenerated = a;
    notifyListeners();
  }

  final List<int> _tabs;

  /// A list of indecies of [schedules]
  List<int> get tabs => _tabs;

  void addTab(int indexWeekCurrent) {
    _tabs.add(indexWeekCurrent);
    notifyListeners();
  }

  void removeTab(int indexTab) {
    if (_tabs.length == 1) return;
    _tabs.removeAt(indexTab);
    notifyListeners();
  }

  void updateTab(int indexTab, int indexWeek) {
    _tabs[indexTab] = indexWeek;
    notifyListeners();
  }

  void reorderTab(int from, int to) {
    _tabs.move(from, to);
    notifyListeners();
  }

  ScheduleFilters _filters;
  ScheduleFilters get filters => _filters;
  updateFilter<T>(String category, String key, T value, [String? index]) {
    if (index != null) {
      _filters.values[category]![key] ??= {};
      if (value == null) {
        _filters.values[category]![key].remove(index);
      } else {
        _filters.values[category]![key][index] = value;
      }
    } else {
      _filters.values[category]![key] = value;
    }
    notifyListeners();
  }

  resetFilterCategory(String category) {
    _filters.values[category]!.clear();
    notifyListeners();
  }

  late StreamSubscription _stream;
  bool schedulesIsPaused = false;
  // count execution time
  final generateStopwatch = Stopwatch();
  scheduleGenerate() {
    _schedules.clear();
    isGenerating = true;

    generateStopwatch.start();

    _stream = generateSchedules(
      subjects: subjects,
      filters: _filters,
    ).listen((event) {
      addSchedule(event);
    })
      ..onDone(() {
        generateStopwatch.stop();
        print("ELAPSED TIME: ${generateStopwatch.elapsedMilliseconds}");
        generateStopwatch.reset();

        isGenerating = false;
      });
  }

  schedulePause() {
    schedulesIsPaused = true;
    notifyListeners();
    _stream.pause();
    generateStopwatch.stop();
  }

  scheduleResume() {
    schedulesIsPaused = false;
    notifyListeners();
    _stream.resume();
    generateStopwatch.start();
  }

  scheduleCancel() {
    schedulesIsPaused = false;
    isGenerating = false;
    _stream.cancel();
    generateStopwatch.stop();
    print("ELAPSED TIME: ${generateStopwatch.elapsedMilliseconds}");
    generateStopwatch.reset();
  }

  SkedmakerModel()
      : subjects = {},
        _schedules = {},
        _tabs = [],
        _filters = ScheduleFilters();
}

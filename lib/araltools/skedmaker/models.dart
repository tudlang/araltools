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

import 'dart:async';
import 'dart:math';

import 'package:araltools/utils.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';

import 'classes.dart';
import 'filters.dart';
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

  void modifySubject(String code, void Function(List<Offering>) modify) {
    modify(subjects[code]!);
    notifyListeners();
  }

  void modifySubjectOffering(
      String code, int index, Offering Function(Offering) modify) {
    subjects[code]![index] = modify(subjects[code]![index]);
    notifyListeners();
  }

  final Set<String> _subjectsHidden;

  Set<String> get subjectsHidden => _subjectsHidden;
  void hideSubject(String code) {
    _subjectsHidden.add(code);
    notifyListeners();
  }

  void unhideSubject(String code) {
    _subjectsHidden.remove(code);
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

  void removeSchedule(int index) {
    final schedule = _schedules.elementAt(index);
    // remove the tabs first
    _tabs.removeWhere((element) => element == index);
    // then remove the schedule
    _schedules.remove(schedule);

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
    // Remove the element at oldIndex
    int removedElement = _tabs.removeAt(from);
    // Add new newIndex
    _tabs.insert(to, removedElement);
    notifyListeners();
  }

  ScheduleFilters _filters;
  ScheduleFilters get filters => _filters;
  updateFilter({
    required String category,
    required String key,
    dynamic value,
    void Function(ScheduleFilter)? action,
  }) {
    final filter = _filters.filters[category]![key]!;
    if (value != null) filter.setValue(value);
    if (action != null) action(filter);
    notifyListeners();
  }

  resetFilterCategory(String category) {
    _filters.reset(category);
    notifyListeners();
  }

  late StreamSubscription _stream;
  bool schedulesIsPaused = false;
  // count execution time
  final generateStopwatch = Stopwatch();
  scheduleGenerate() {
    // remove all unstarred schedules
    _schedules.removeWhere((e)=>!e.isStarred);

    _scheduleProgress = 0;
    _tabs
      ..clear()
      ..add(0);
    isGenerating = true; //notify first

    setScheduleCombinations();

    print("COMBINATIONS: $_scheduleCombinations");
    generateStopwatch.start();

    _stream = generateSchedules(
      subjects: subjects,
      filters: _filters,
      subjectsHidden: _subjectsHidden,
    ).listen((event) {
      _scheduleProgress++;
      if (event != null) {
        addSchedule(event);
      } else {
        notifyListeners(); // manually notify if it's null
      }
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

  int _scheduleCombinations = 1;

  /// Sets the number of possible combinations.
  void setScheduleCombinations() {
    final removed = <String, List<Offering>>{};

    // remove hidden subjects
    for (final subject in subjectsHidden) {
      removed[subject]= subjects.remove(subject)!;
    }

    // calculate the combinations
    _scheduleCombinations = subjects.values.fold(1, (prev, element) {
      int offeringsFiltered = 0;
      for (final offering in element) {
        if (_filters.shouldExclude(offering)) {
          offeringsFiltered++;
        }
      }
      return (prev * (element.length - offeringsFiltered)).toInt();
    });

    // return back the removed ones
    subjects.addAll(removed);

  }

  int _scheduleProgress = 0;
  int get scheduleProgress => _scheduleProgress;
  set scheduleProgress(int a) {
    _scheduleProgress = a;
    notifyListeners();
  }

  double get schedulePercentage =>
      (_scheduleProgress / _scheduleCombinations) * 100;

  String? path;

  Webview? webview;

  SkedmakerModel({
    Map<String, List<Offering>>? subjects,
    Set<ScheduleWeek>? schedules,
    Set<String>? subjectsHidden,
    List<int>? tabs,
    ScheduleFilters? filters,
    this.path,
  })  : subjects = subjects ?? {},
        _schedules = schedules ?? {},
        _tabs = tabs ?? [],
        _filters = filters ?? ScheduleFilters(),
        _subjectsHidden = subjectsHidden ?? {};
}

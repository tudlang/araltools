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

import 'classes.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

/// The model used to store the entire state of SkedMaker, used with [ChangeNotifierProvider]
class SkedmakerModel extends ChangeNotifier {
  Map<String, List<Offering>> subjects;
  Set<ScheduleWeek> _schedules;
  ScheduleWeek? _schedulesSelected;
  List<ScheduleWeek> _tabs;
  int _tabsIndex;

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

  ScheduleWeek? get schedulesSelected => _schedulesSelected;
  set schedulesSelected(ScheduleWeek? a) {
    _schedulesSelected = a;
    notifyListeners();
  }

  bool _isGenerating = false;
  bool get isGenerating => _isGenerating;
  set isGenerating(bool a) {
    _isGenerating = a;
    notifyListeners();
  }

  List<ScheduleWeek> get tabs => _tabs;

  void addTab(ScheduleWeek? week) {
    _tabs.add(week ?? _tabs[_tabsIndex]);
    _tabsIndex = _tabs.length - 1;
    notifyListeners();
  }

  void removeTab(ScheduleWeek week) {
    if (_tabs.length == 1) return;
    if (_tabsIndex == _tabs.length - 1) _tabsIndex = _tabs.length - 2;
    _tabs.remove(week);
    notifyListeners();
  }

  void updateTab(ScheduleWeek week) {
    _tabs[_tabsIndex] = week;
    notifyListeners();
  }

  void reorderTab(int from, int to) {
    _tabs.move(from, to);
    _tabsIndex = to - 1;
    notifyListeners();
  }

  int get tabsIndex => _tabsIndex;
  set tabsIndex(int a) {
    _tabsIndex = a;
    notifyListeners();
  }

  SkedmakerModel()
      : subjects = {},
        _schedules = {},
        _tabs = [],
        _tabsIndex = -1;
}


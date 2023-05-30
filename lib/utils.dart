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

import 'dart:io';

import 'package:flutter/foundation.dart';

// https://stackoverflow.com/a/66294173/14021404
extension MoveElement<T> on List<T> {
  void move(int from, int to) {
    RangeError.checkValidIndex(from, this, "from", length);
    RangeError.checkValidIndex(to, this, "to", length);
    var element = this[from];
    if (from < to) {
      this.setRange(from, to, this, from + 1);
    } else {
      this.setRange(to + 1, from + 1, this, to);
    }
    this[to] = element;
  }
}


T onPlatform<T>({
    required T all,
    T? web,
    T? android,
    T? ios,
    T? windows,
    T? macos,
    T? linux,
    T? fuchsia,
  }) =>
      switch (kIsWeb ? 'web' : Platform.operatingSystem) {
        'web' => web ?? all,
        'android' => android ?? all,
        'ios' => ios ?? all,
        'windows' => windows ?? all,
        'macos' => macos ?? all,
        'linux' => linux ?? all,
        'fuchsia' => fuchsia ?? all,
        _ => all,
      };
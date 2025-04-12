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

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

extension StringExtensions on String {
  int toInt({int? radix}) => int.parse(this, radix: radix);
  String ifEmpty(String replacement)=> isEmpty ? replacement : this;
}

/// Return a value depending on the platform
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

/// If [data] is null, then output an empty widget, otherwise create a [Text] widget
// ignore: non_constant_identifier_names
Widget TextOrNull(
  String? data, {
  Key? key,
  TextStyle? style,
  StrutStyle? strutStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  Locale? locale,
  bool? softWrap,
  TextOverflow? overflow,
  double? textScaleFactor,
  TextScaler? textScaler,
  int? maxLines,
  String? semanticsLabel,
  TextWidthBasis? textWidthBasis,
  TextHeightBehavior? textHeightBehavior,
  Color? selectionColor,
}) =>
    data == null
        ? SizedBox.shrink()
        : Text(
            data,
            key: key,
            style: style,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            textScaler: textScaler,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            selectionColor: selectionColor,
          );

/// If [condition] is true, use [parent], otherwise continue with [child].
Widget parentOrChild({
  required bool condition,
  required Widget Function(Widget child) parent,
  required Widget child,
}) =>
    condition ? parent(child) : child;
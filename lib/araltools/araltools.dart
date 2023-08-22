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

import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../strings.g.dart';
import 'skedmaker/skedmaker_activity.dart';

/// An enum containing all of the different AralTools
enum AralTools {
  skedmaker(
    route: '/skedmaker',
    widget: SkedmakerActivity(),
    icon: MdiIcons.calendarStar,
    platforms: ["windows"],
    extras: {'noAppbar': true},
    drawer: SkedmakerDrawer(),
  ),
  ;

  final String route;
  final bool enabled;
  final Widget widget;
  final Widget drawer;
  final IconData icon;
  final List<String> platforms;
  final Map<String, dynamic> extras;

  const AralTools({
    required this.route,
    this.enabled = true,
    required this.widget,
    required this.drawer,
    required this.icon,
    required this.platforms,
    this.extras = const {},
  });

  /// Gets the translated name
  String get localizedName => strings["$name.info.name"];

  /// Gets the translated description
  String get localizedDesc => strings["$name.info.description"];
}

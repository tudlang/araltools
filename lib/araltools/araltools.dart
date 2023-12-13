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
import 'package:material_design_icons_flutter/icon_map.dart';

import '../strings.g.dart';
import 'skedmaker/skedmaker_activity.dart';

/// An enum containing all of the different AralTools
enum AralTools {
  skedmaker(
    route: '/skedmaker',
    icon: ('mdi', 'calendarStar'),
    platforms: ["windows"],
    extras: {'noAppbar': true},
    fileExtensions: ['.atsm'],
  ),
  ;

  final String route;
  final bool enabled;
  final (String package, String id) icon;
  final List<String> platforms;
  final Map<String, dynamic> extras;
  final List<String> fileExtensions;

  const AralTools({
    required this.route,
    this.enabled = true,
    required this.icon,
    required this.platforms,
    this.extras = const {},
    this.fileExtensions = const [],
  });

  /// Gets the translated name
  String get localizedName => strings["$name.info.name"];

  /// Gets the translated description
  String get localizedDesc => strings["$name.info.desc"];

  Widget getWidget(Map<String, dynamic> extras) => switch (this) {
        skedmaker => SkedmakerActivity(
            path: extras['path'],
          )
      };
  Widget getDrawer(Map<String, dynamic> extras) =>
      switch (this) { skedmaker => SkedmakerDrawer() };

  IconData get iconData => switch (icon.$1) {
        'mdi' => iconMap[icon.$2]!,
        _ => IconData(0x0020) //empty space
      };
}

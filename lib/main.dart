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

import 'package:araltools/strings.g.dart';
import 'package:flutter/foundation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'araltools/skedmaker/skedmaker_activity.dart';
import 'home_activity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: strings.general.app.name,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    routes: [
      ShellRoute(
          builder: (context, state, child) {
            Map<String, String> extra =
                state.extra != null ? state.extra as Map<String, String> : {};
            return Scaffold(
              appBar: AppBar(
                title: Text(extra['title'] ?? strings.general.app.name),
              ),
              drawer: Drawer(
                child: ListView(
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      accountName: Text(
                        strings.general.app.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontFamily: 'Raleway', color: Colors.white),
                      ),
                      accountEmail: Container(),
                    ),
                    ListTile(
                      selected: state.matchedLocation == "/",
                      style: ListTileStyle.drawer,
                      leading: Icon(Icons.home),
                      title: Text(strings.general.home.name),
                      onTap: () {
                        GoRouter.of(context).go('/');

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About'),
                      onTap: () {
                        Navigator.pop(context);
                        showAboutDialog(context: context);
                      },
                    ),
                    Divider(),
                    for (final araltool in AralTools.values)
                      ListTile(
                        selected: araltool.route == state.matchedLocation,
                        style: ListTileStyle.drawer,
                        title: Text(araltool.localizedName),
                        leading: Icon(araltool.icon),
                        onTap: () {
                          GoRouter.of(context).go(araltool.route, extra: {
                            'title': araltool.localizedName,
                          });
                          Navigator.pop(context);
                        },
                      )
                  ],
                ),
              ),
              body: child,
            );
          },
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => HomeActivity(),
            ),
            for (final araltool in AralTools.values)
              GoRoute(
                path: araltool.route,
                builder: (context, state) => araltool.widget,
              )
          ]),
    ],
  );
}

/// An enum containing all of the different AralTools
enum AralTools {
  skedmaker(
      route: '/skedmaker',
      widget: SkedmakerActivity(),
      icon: MdiIcons.calendarStar,
      platforms: ["windows"]),
  ;

  final String route;
  final bool enabled;
  final Widget widget;
  final IconData icon;
  final List<String> platforms;

  const AralTools({
    required this.route,
    this.enabled = true,
    required this.widget,
    required this.icon,
    required this.platforms,
  });

  /// Gets the translated name
  String get localizedName => strings["$name.info.name"];

  /// Gets the translated description
  String get localizedDesc => strings["$name.info.description"];
}
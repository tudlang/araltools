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
import 'package:araltools/utils.dart';
import 'package:collection/collection.dart';
import 'package:fluent_ui/fluent_ui.dart'
    show FluentLocalizations, FluentTheme, FluentThemeData;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'araltools/araltools.dart';
import 'home_activity.dart';

void main() {
  // do platform-specific things
  onPlatform(
    all: null,
    windows: () async {
      final appdata = await getApplicationSupportDirectory();
      // create data folders
      for (final araltool in AralTools.values) {
        Directory('${appdata.path}/${araltool.name}').create();
      }
      //Directory(r'%appdata%\com.tudlang\araltools\skedmaker').create();
    }(),
  );

  WidgetsFlutterBinding.ensureInitialized(); // add this
  LocaleSettings.useDeviceLocale(); // and this
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
      localizationsDelegates: [
        ...onPlatform(
          all: const [],
          windows: [
            FluentLocalizations.delegate,
          ],
        )
      ],
      builder: (context, child) => onPlatform(
        all: child!,
        windows: FluentTheme(
          data: FluentThemeData(),
          child: child,
        ),
      ),
      supportedLocales: [
        const Locale('en'),
        ...onPlatform(
          all: const [],
          windows: FluentLocalizations.supportedLocales,
        ),
      ],
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => HomeActivity(),
      ),
      for (final araltool in AralTools.values)
        GoRoute(
          name: araltool.name,
          path: araltool.route,
          builder: (context, state) {
            final extra = state.extra != null
                ? state.extra as Map<String, dynamic>
                : <String, dynamic>{};

            print(extra);
            return Scaffold(
              drawer: araltool.drawer,
              body: araltool.widget,
            );
          },
        ),
    ],
  );
}

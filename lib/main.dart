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
import 'dart:io';

import 'package:araltools/intl/fluent-tl.dart';
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
import 'package:window_manager/window_manager.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'araltools/araltools.dart';
import 'home_activity.dart';
import 'intl/cupertino-tl-QP.dart';
import 'intl/fluent-tl_QP.dart';
import 'intl/material-tl_QP.dart';

void main(List<String> args) {
  // do platform-specific things
  onPlatform(
    all: () => null,
    windows: () async {
      final appdata = await getApplicationSupportDirectory();
      // create data folders
      for (final araltool in AralTools.values) {
        Directory('${appdata.path}/${araltool.name}').create();
      }

      // Must add this line.
      await windowManager.ensureInitialized();
    },
  )();

  WidgetsFlutterBinding.ensureInitialized(); // add this
  LocaleSettings.setLocale(AppLocale.tl);

  runApp(TranslationProvider(
    child: MyApp(
      path: args.isNotEmpty ? args[0] : null,
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    this.path,
  });

  /// When the app is launched from a .at** file, [path] is the file path to the file. `null` if otherwise.
  final String? path;

  @override
  Widget build(BuildContext context) {
    String? initialLocation;
    Map<String, dynamic>? initialExtra;

    if (path != null) {
      final extension = p.extension(path!);

      for (final araltool in AralTools.values) {
        if (araltool.fileExtensions.contains(extension)) {
          initialLocation = araltool.route;
          initialExtra = {
            'path': path!,
          };
        }
      }
    }

    return MaterialApp.router(
      title: strings.general.app.name,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,

        //Tagalog (Taglish)
        MaterialLocalizationTlQP.delegate,
        CupertinoLocalizationTlQP.delegate,

        //Platform-specific
        ...onPlatform(
          all: const [],
          windows: [
            FluentLocalizations.delegate,

            //Tagalog
            FluentLocalizationsTl.delegate,
            //Taglish
            FluentLocalizationsTlQP.delegate,
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
      locale: TranslationProvider.of(context).flutterLocale, // use provider
      supportedLocales: [
        const Locale('en'),
        const Locale('tl'),
        const Locale('tl', 'QP'),
        ...onPlatform(
          all: const [],
          windows: FluentLocalizations.supportedLocales,
        ),
      ],
      routerConfig: GoRouter(
        initialExtra: initialExtra,
        initialLocation: initialLocation,
        routes: [
          GoRoute(
            name: 'home',
            path: '/',
            builder: (context, state) {
              return HomeActivity();
            },
          ),
          for (final araltool in AralTools.values)
            GoRoute(
              name: araltool.name,
              path: araltool.route,
              builder: (context, state) {
                final extras = state.extra != null
                    ? state.extra as Map<String, dynamic>
                    : <String, dynamic>{};

                print(extras);
                return Scaffold(
                  drawer: araltool.getDrawer(extras),
                  body: araltool.getWidget(extras),
                );
              },
            ),
        ],
      ),
    );
  }
}

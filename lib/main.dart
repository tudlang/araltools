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
import 'dart:io';
import 'dart:math';

import 'package:araltools/intl/fluent-tl.dart';
import 'package:araltools/settings.dart';
import 'package:araltools/strings.g.dart';
import 'package:araltools/utils.dart';
import 'package:collection/collection.dart';
import 'package:fluent_ui/fluent_ui.dart'
    show ColorExtension, FluentLocalizations, FluentTheme, FluentThemeData, NavigationPaneThemeData;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'araltools/araltools.dart';
import 'home_activity.dart';
import 'intl/cupertino-tl-QP.dart';
import 'intl/fluent-tl_QP.dart';
import 'intl/locales.dart';
import 'intl/material-tl_QP.dart';

late final SharedPreferences prefs;

void main(List<String> args) async {
  // get preferences
  prefs = await SharedPreferences.getInstance();

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
  LocaleSettings.setLocaleRaw(getSettings('general', 'language'));

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
  }){
    random = Random();
  }

  /// When the app is launched from a .at** file, [path] is the file path to the file. `null` if otherwise.
  final String? path;

  late Random random;

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
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
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
          data: FluentThemeData.light().copyWith(
            navigationPaneTheme: NavigationPaneThemeData(),
            accentColor: ColorScheme.fromSeed(seedColor: Colors.green).primary.toAccentColor(),
          ),
          child: child,
        ),
      ),
      locale: TranslationProvider.of(context).flutterLocale, // use provider
      supportedLocales: [
        for (final i in locales.values) i.locale, //add all supported locales
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

                // All Araltools have a root of a Scaffold
                return Scaffold(
                  key: ValueKey(random.nextDouble()),
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

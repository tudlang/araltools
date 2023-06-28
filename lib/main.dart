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
import 'package:fluent_ui/fluent_ui.dart'
    show FluentLocalizations, FluentTheme, FluentThemeData;
import 'package:flutter/foundation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

import 'araltools/skedmaker/skedmaker_activity.dart';
import 'home_activity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      ShellRoute(
          builder: (context, state, child) {
            final extra = state.extra != null
                ? state.extra as Map<String, dynamic>
                : <String, dynamic>{};
            print(extra);
            return Scaffold(
              appBar: (extra['noAppbar'] == true)
                  ? null
                  : AppBar(
                      title: Row(
                        children: [
                          Text(
                            extra['title'] ?? strings.general.app.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
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
                      accountEmail: Text(''),
                    ),
                    ListTile(
                      selected: state.matchedLocation == "/",
                      style: ListTileStyle.drawer,
                      leading: Icon(Icons.home_outlined),
                      title: Text(strings.general.home.name),
                      onTap: () {
                        GoRouter.of(context).go('/');

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text('About'),
                      onTap: () async{
                        PackageInfo packageInfo = await PackageInfo.fromPlatform();
                        Navigator.pop(context);
                        showAboutDialog(
                          context: context,
                          applicationName: packageInfo.appName,
                          applicationVersion: "Version ${packageInfo.version} build ${packageInfo.buildNumber}",
                          applicationLegalese: "Copyright (C) 2023 Tudlang"
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.giftOutline),
                      trailing: Icon(MdiIcons.openInNew),
                      title: Text('Buy Me A Coffee'),
                      subtitle: Text('Support me!'),
                      onTap: () {
                        Navigator.pop(context);
                        launchUrl(
                            Uri.parse("https://www.buymeacoffee.com/Yivan4"));
                      },
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.fileCodeOutline),
                      trailing: Icon(MdiIcons.openInNew),
                      title: Text('View source code'),
                      subtitle: Text('Contribute to AralTools!'),
                      onTap: () {
                        Navigator.pop(context);
                        launchUrl(
                            Uri.parse("https://github.com/tudlang/araltools"));
                      },
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.bugOutline),
                      trailing: Icon(MdiIcons.openInNew),
                      title: Text('Issue tracker'),
                      subtitle: Text('Report issues & bugs here!'),
                      onTap: () {
                        Navigator.pop(context);
                        launchUrl(
                            Uri.parse("https://github.com/tudlang/araltools/issues"));
                      },
                    ),
                    Divider(),
                    for (final araltool in AralTools.values)
                      ListTile(
                        selected: araltool.route == state.matchedLocation,
                        style: ListTileStyle.drawer,
                        title: Text(
                          araltool.localizedName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  color: araltool.route == state.matchedLocation
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                        ),
                        leading: Icon(araltool.icon),
                        onTap: () {
                          GoRouter.of(context).go(araltool.route, extra: {
                            'title': araltool.localizedName,
                            ...araltool.extras
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
    platforms: ["windows"],
    extras: {'noAppbar': true},
  ),
  ;

  final String route;
  final bool enabled;
  final Widget widget;
  final IconData icon;
  final List<String> platforms;
  final Map<String, dynamic> extras;

  const AralTools({
    required this.route,
    this.enabled = true,
    required this.widget,
    required this.icon,
    required this.platforms,
    this.extras = const {},
  });

  /// Gets the translated name
  String get localizedName => strings["$name.info.name"];

  /// Gets the translated description
  String get localizedDesc => strings["$name.info.description"];
}

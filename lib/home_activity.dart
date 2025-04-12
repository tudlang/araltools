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

import 'package:araltools/settings.dart';
import 'package:araltools/strings.g.dart';
import 'package:araltools/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

import 'araltools/araltools.dart';
import 'intl/locales.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    onPlatform(
      all: null,
      windows: () {
        windowManager.setTitle('AralTools');
      }(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            strings.general.app.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
          ),
        ),
      ),
      drawer: HomeDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              strings.general.home.welcome,
              style: textTheme.headlineLarge,
            ),
          ),
          Divider(),
          Wrap(
            children: [
              for (final araltool in AralTools.values)
                HomeCard(
                  icon: araltool.iconData,
                  name: araltool.localizedName,
                  description: araltool.localizedDesc,
                  route: araltool.route,
                  extras: araltool.extras,
                  urlInfo: araltool.urlInfo,
                ),
              HomeCard(
                icon: Icons.add,
                name: strings.general.home.more.title,
                description: strings.general.home.more.desc,
              )
            ],
          )
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final IconData? icon;
  final String name;
  final String description;
  final String route;
  final Map<String, dynamic> extras;
  final String urlInfo;
  const HomeCard({
    super.key,
    this.icon,
    this.name = '',
    this.description = '',
    this.route = '',
    this.extras = const {},
    this.urlInfo = '',
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      constraints: BoxConstraints(maxWidth: 450, minWidth: 450),
      padding: EdgeInsets.only(left: 8),
      child: Card(
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 35),
                  SizedBox(width: 8),
                  Expanded(
                      child: Text(
                    name,
                    style: textTheme.headlineMedium?.copyWith(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
              Text(description),
              SizedBox(height: 20),
              Wrap( 
                spacing: 10,
                children: [
                  if (route.isNotEmpty)
                    FilledButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .go(route, extra: {'title': name, ...extras});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(strings.general.general.open.regular),
                      ),
                    ),
                  if (urlInfo.isNotEmpty)
                    OutlinedButton(
                      onPressed: () {
                        launchUrl(Uri.parse(urlInfo));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(strings.general.general.moreInfo),
                          ),
                          Icon(MdiIcons.openInNew)
                        ],
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final str = strings.general.drawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  ?.copyWith(fontFamily: 'Raleway', color: Colors.white),
            ),
            accountEmail: Text(''),
          ),
          ListTile(
            selected: true,
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
            title: Text(str.about.name),
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationName: packageInfo.appName,
                applicationVersion: str.about.version(
                    version: packageInfo.version,
                    build: packageInfo.buildNumber),
                applicationLegalese: str.about.copyright,
              );
            },
          ),
          ListTile(
            leading: Icon(MdiIcons.giftOutline),
            trailing: Icon(MdiIcons.openInNew),
            title: Text(str.support.title),
            subtitle: Text(str.support.desc),
            onTap: () {
              Navigator.pop(context);
              launchUrl(Uri.parse("https://www.buymeacoffee.com/Yivan4"));
            },
          ),
          ListTile(
            leading: Icon(MdiIcons.fileCodeOutline),
            trailing: Icon(MdiIcons.openInNew),
            title: Text(str.github.title),
            subtitle: Text(str.github.desc),
            onTap: () {
              Navigator.pop(context);
              launchUrl(Uri.parse("https://github.com/tudlang/araltools"));
            },
          ),
          ListTile(
            leading: Icon(MdiIcons.bugOutline),
            trailing: Icon(MdiIcons.openInNew),
            title: Text(str.bugs.title),
            subtitle: Text(str.bugs.desc),
            onTap: () {
              Navigator.pop(context);
              launchUrl(
                  Uri.parse("https://github.com/tudlang/araltools/issues"));
            },
          ),
          Divider(),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            child: ListTile(
              title: Text(str.language.title(
                  language: locales[getSettings("general", "language")]?.name ??
                      getSettings("general", "language"))),
              leading: Icon(Icons.language_outlined),
            ),
            tooltip: str.language.tooltip,
            itemBuilder: (context) => locales.entries
                .map((e) => PopupMenuItem(
                    value: e.key,
                    child: ListTile(
                      title: Text(e.value.name),
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                              color: Theme.of(context).iconTheme.color!),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child:
                              Text(e.value.locale.languageCode.toUpperCase()),
                        ),
                      ),
                    )))
                .toList(),
            onSelected: (value) {
              setState(() {
                setSettings('general', 'language', value);
                LocaleSettings.setLocaleRaw(value);
              });
            },
          ),
        ],
      ),
    );
  }
}

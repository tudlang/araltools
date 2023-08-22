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

import 'package:araltools/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'araltools/araltools.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              strings.general.app.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
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
                  icon: araltool.icon,
                  name: araltool.localizedName,
                  description: araltool.localizedDesc,
                  route: araltool.route,
                  extras: araltool.extras,
                ),
              HomeCard(
                icon: Icons.add,
                name: 'More coming soon!',
                description: 'Stay updated! :)',
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
  const HomeCard({
    super.key,
    this.icon,
    this.name = '',
    this.description = '',
    this.route = '',
    this.extras = const {},
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
              if (route.isNotEmpty)
                FilledButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .go(route, extra: {'title': name, ...extras});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Open'),
                  ),
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
            title: Text('About'),
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationName: packageInfo.appName,
                applicationVersion:
                    "Version ${packageInfo.version} build ${packageInfo.buildNumber}",
                applicationLegalese: "Copyright (C) 2023 Tudlang",
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
              launchUrl(Uri.parse("https://www.buymeacoffee.com/Yivan4"));
            },
          ),
          ListTile(
            leading: Icon(MdiIcons.fileCodeOutline),
            trailing: Icon(MdiIcons.openInNew),
            title: Text('View source code'),
            subtitle: Text('Contribute to AralTools!'),
            onTap: () {
              Navigator.pop(context);
              launchUrl(Uri.parse("https://github.com/tudlang/araltools"));
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
        ],
      ),
    );
  }
}

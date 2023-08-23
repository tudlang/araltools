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

import 'package:fluent_ui/fluent_ui.dart' hide Tooltip;
import 'package:flutter/material.dart'
    hide IconButton, Colors, showDialog, FilledButton;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:path/path.dart' as path;

import '../../araltools.dart';
import '../export_xml.dart';
import '../models.dart';
import '../skedmaker_activity.dart';
import 'ui_filters.dart';
import 'ui_schedules.dart';
import 'ui_subjects.dart';

/// This is the main activity of SkedMaker for Windows.
class SkedmakerActivityWindows extends StatefulWidget {
  const SkedmakerActivityWindows({super.key});

  @override
  State<SkedmakerActivityWindows> createState() =>
      _SkedmakerActivityWindowsState();
}

class _SkedmakerActivityWindowsState extends State<SkedmakerActivityWindows>
    with WindowListener {
  late int paneIndex;

  @override
  void initState() {
    super.initState();
    paneIndex = 0;
    windowManager.addListener(this);

    // This is to prompt to save first when clicking the close button
    windowManager.setPreventClose(true);

    final model = context.read<SkedmakerModel>();
    if (model.path != null) {
      windowManager.setTitle('AralTools SkedMaker - ${model.path}');
    } else {
      windowManager.setTitle('AralTools SkedMaker');
    }
  }

  @override
  void deactivate() {
    final model = provider.currentContext!.read<SkedmakerModel>();
    model.webview?.close();
    super.deactivate();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  /// This is to avoid multiple dialogs when the close button is spammed
  bool isSaveDialogDisplaying = false;

  @override
  void onWindowClose() async {
    if (!await windowManager.isPreventClose()) return;
    if (isSaveDialogDisplaying) return;
    isSaveDialogDisplaying = true;

    showDialog(
      context: context,
      dismissWithEsc: false,
      builder: (context) {
        return ContentDialog(
          title: Text('Save first before closing?'),
          actions: [
            FilledButton(
                child: Text('Save'),
                onPressed: () async {
                  final model = provider.currentContext!.read<SkedmakerModel>();

                  final newfile =
                      await exportXml(model: model, path: model.path);

                  if (newfile != null) {
                    // saved successfuly, time to exit
                    await windowManager.destroy();
                  }
                }),
            Button(
                child: Text('Don\'t Save'),
                onPressed: () async {
                  await windowManager.destroy();
                }),
            Button(
                child: Text('Cancel'),
                onPressed: () {
                  isSaveDialogDisplaying = false;
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return FluentApp(
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData.light()
          .copyWith(navigationPaneTheme: NavigationPaneThemeData()
              //accentColor: Colors.blue,
              //micaBackgroundColor: Theme.of(context).colorScheme.primary
              ),
      home: NavigationPaneTheme(
        data: NavigationPaneThemeData(
          backgroundColor: Theme.of(context).colorScheme.primary,
          highlightColor: Colors.white,
        ),
        child: NavigationView(
          pane: NavigationPane(
            size: NavigationPaneSize(
              topHeight: 56,
            ),
            header: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                AralTools.skedmaker.icon,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 30,
              ),
              SizedBox(width: 8),
              Text(
                AralTools.skedmaker.localizedName,
                style: textTheme.titleLarge?.copyWith(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              SizedBox(width: 16),
              VerticalDivider(),
            ]),
            leading: Tooltip(
              message: MaterialLocalizations.of(context).openAppDrawerTooltip,
              child: IconButton(
                icon: Icon(
                  MdiIcons.menu,
                  size: 25,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconButtonMode: IconButtonMode.large,
              ),
            ),
            selected: paneIndex,
            onChanged: (index) {
              setState(() {
                paneIndex = index;
              });
            },
            displayMode: PaneDisplayMode.top,
            items: [
              PaneItem(
                icon: Icon(MdiIcons.schoolOutline),
                title: Text(
                  'Subjects',
                  style: textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                body: NavigationPaneTheme(
                  data: FluentTheme.of(context).navigationPaneTheme,
                  child: SubjectsFragment(),
                ),
              ),
              PaneItem(
                icon: Icon(MdiIcons.filterOutline),
                title: Text(
                  'Filters',
                  style: textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                body: NavigationPaneTheme(
                  data: FluentTheme.of(context).navigationPaneTheme,
                  child: FiltersFragment(),
                ),
              ),
              /*PaneItem(
                icon: Icon(MdiIcons.filterOutline),
                title: Text('Professors'),
                body: Placeholder(),
              ),*/ //TODO new feature, add professors
              PaneItem(
                icon: Icon(MdiIcons.calendarBlankMultiple),
                title: Text(
                  'Schedules',
                  style: textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                body: NavigationPaneTheme(
                  data: FluentTheme.of(context).navigationPaneTheme,
                  child: NavigationView(content: SchedulesFragment()),
                ),
              ),
            ],
            footerItems: [
              /*PaneItem(
                icon: Icon(MdiIcons.filterOutline),
                title: Text('Settings'),
                body: Placeholder(),
              ),*/ //TODO add settings
            ],
          ),
        ),
      ),
    );
  }
}

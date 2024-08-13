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

import 'dart:math';

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    show DataTable, DataCell, DataColumn, DataRow;
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:string_unescape/string_unescape.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../strings.g.dart';
import 'functions.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'classes.dart';
import 'parser.dart';

var isWebviewAvailable = false;

Future<({List<Offering>? list, Webview webview})?> getSubject(
    BuildContext context, Webview? window) async {
  // a different dialog will appear if the user does not support WebView2
  if (!isWebviewAvailable && !await WebviewWindow.isWebviewAvailable()) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return ContentDialog(
            title: Text(strings.skedmaker.subjects.add.buttonMls.webviewTitle),
            content: Text.rich(
              strings.skedmaker.subjects.add.buttonMls.webviewDesc(
                webview: (webviewStr) => TextSpan(
                  text: webviewStr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(
                          'https://go.microsoft.com/fwlink/p/?LinkId=2124703'));
                    },
                  style: FluentTheme.of(context).typography.body!.copyWith(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
                learn: (learnStr) => TextSpan(
                  text: learnStr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(
                          'https://developer.microsoft.com/en-us/microsoft-edge/webview2'));
                    },
                  style: FluentTheme.of(context).typography.body!.copyWith(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ),
            actions: [
              Button(
                child: Text(strings.general.general.cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FilledButton(
                child: Text(strings.general.general.go),
                onPressed: () {
                  launchUrl(Uri.parse(
                      'https://go.microsoft.com/fwlink/p/?LinkId=2124703'));
                },
              )
            ],
          );
        });
  }
  // if it's avalable, set this to true so that it won't check again
  isWebviewAvailable = true;

  try {
    // ping the window if it is not null and is working
    await window!.evaluateJavaScript('');
  } catch (e) {
    // TODO add platform checking here
    window = await WebviewWindow.create(
        configuration: CreateConfiguration(
      userDataFolderWindows:
          '${(await getApplicationSupportDirectory()).path}/skedmaker',
      // I wish there was a way to customize the "title bar" (supposed to be appbar) further
      titleBarHeight: 0,
      title: strings.skedmaker.mlsCourseOfferings,
    ));
    window.launch('https://enroll.dlsu.edu.ph/dlsu/view_course_offerings');
  }

  // TODO add setting for this later

  return await showDialog(
    context: context,
    barrierDismissible: false, //false to avoid accidental exit
    dismissWithEsc: false,
    builder: (context) {
      bool isError = false;
      return StatefulBuilder(builder: (context, setState) {
        return ContentDialog(
          title: Text(strings.skedmaker.subjects.add.buttonMls.title),
          content: Text(strings.skedmaker.subjects.add.buttonMls.desc +
              (isError ? '\nError' : '')),
          actions: [
            Button(
              child: Text(strings.general.general.cancel),
              onPressed: () {
                Navigator.pop(context, (
                  list: null,
                  webview: window,
                ));
              },
            ),
            FilledButton(
              onPressed: () async {
                // Javascript code to get the HTML of the table
                final table = await window!.evaluateJavaScript(
                    "document.querySelector('td>form>table').outerHTML");
                try {
                  final parsed = parse(unescape(table!));

                  if (parsed.errors.isNotEmpty &&
                      !await errorAskIfProceed(context, parsed.errors)) {
                  } else
                    Navigator.pop(context, (
                      list: parsed.list,
                      webview: window,
                    ));
                } catch (e) {
                  setState(() {
                    isError = true;
                  });
                }
              },
              child: Text(strings.general.general.add),
            )
          ],
        );
      });
    },
  );
}

/// Dialog for adding subjects via HTML
Future<List<Offering>?> getSubjectFromString(BuildContext context) async {
  return await showDialog<List<Offering>>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      final controller = TextEditingController();
      bool isError = false;

      return StatefulBuilder(builder: (context, setState) {
        return ContentDialog(
          title: Text(strings.skedmaker.subjects.add.buttonCode.title),
          content: ListView(
            shrinkWrap: true,
            children: [
              Text.rich(strings.skedmaker.subjects.add.buttonCode.desc(
                mls: (mls) => TextSpan(
                  text: mls,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(
                          'https://enroll.dlsu.edu.ph/dlsu/view_course_offerings'));
                    },
                  style: FluentTheme.of(context).typography.body!.copyWith(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              )),
              TextBox(
                readOnly: true,
                controller: TextEditingController(
                    text: "document.querySelector('td>form>table').outerHTML"),
                suffix: Tooltip(
                  message: strings.general.general.copy,
                  child: IconButton(
                    icon: Icon(MdiIcons.contentCopy, size: 15),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                        text:
                            "document.querySelector('td>form>table').outerHTML",
                      ));
                    },
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(strings.skedmaker.subjects.add.buttonCode.field),
              SizedBox(height: 8),
              TextBox(
                controller: controller,
                placeholder: strings.skedmaker.subjects.add.buttonCode.hint,
                maxLines: null,
                autofocus: true,
              ),
              if (isError)
                Text(strings.skedmaker.subjects.add.buttonCode.error),
            ],
          ),
          actions: [
            Button(
              child: Text(strings.general.general.cancel),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FilledButton(
              child: Text(strings.general.general.add),
              onPressed: () async {
                final table = controller.text;
                try {
                  table.substring(1, table.length - 1);

                  final parsed = parse(unescape(table));

                  if (parsed.errors.isNotEmpty &&
                      !await errorAskIfProceed(context, parsed.errors)) {
                  } else {
                    Navigator.pop(context, parsed.list);
                  }
                } catch (e) {
                  print(e);
                  setState(() {
                    isError = true;
                  });
                }
              },
            ),
          ],
        );
      });
    },
  );
}

/// The dialog that pops up if there is any error in the parsing of the HTML.
Future<bool> errorAskIfProceed(
    BuildContext context, List<CannotParseError> errors) async {
  print(errors.first.header.outerHtml);
  return await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        dismissWithEsc: false,
        builder: (context) {
          return ContentDialog(
            constraints: BoxConstraints.tightFor(),
            title: Text(strings.skedmaker.subjects.add.errorParse.title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InfoBar(
                    title: Text(strings.skedmaker.subjects.add.errorParse.messagebox),
                    severity: InfoBarSeverity.warning,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    // combine all of the rows into a single HTML widget.
                      child: HtmlWidget(
                          "<table>${errors.first.header.outerHtml.replaceAll("<font color=\"#FFFFFF\">", "<font style='font-weight: bold;'>")} ${errors.fold("", (prev, cur) => prev + cur.row.outerHtml)}</table>")),
                ),
                Text(strings.skedmaker.subjects.add.errorParse.footer)
              ],
            ),
            actions: [
              Button(
                  child: Text(strings.general.general.cancel),
                  onPressed: () {
                    Navigator.pop(context, false);
                  }),
              FilledButton(
                  child: Text(strings.general.general.proceed),
                  onPressed: () {
                    Navigator.pop(context, true);
                  })
            ],
          );
        },
      ) ??
      true;
}

// Currently an unused function
/// Shows a dialog box that loads the possible schedules. Returns a [Future] that completes when the schedule generation is done.
/*
Future<List<ScheduleWeek>?> loadSchedules(
    BuildContext context, List<Offering> all, Set<String> subjects) {
  return showDialog<List<ScheduleWeek>>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      final output = <ScheduleWeek>[];
      final stream = generageSchedules(all, subjects);
      return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          final state = snapshot.connectionState;

          print('Recieved sched: ${snapshot.data}');

          return AlertDialog(
            key: Key(output.length.toString()),
            title: Text('Generating possible schedules'),
            content: () {
              switch (state) {
                case ConnectionState.none:
                  return Text('none');
                case ConnectionState.waiting:
                  return LinearProgressIndicator();
                case ConnectionState.done:
                  return Text("${output.length} found");
                case ConnectionState.active:
                  if (snapshot.hasData) output.add(snapshot.data!);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearProgressIndicator(),
                      SizedBox(height: 8),
                      Text("${output.length} found"),
                    ],
                  );
              }
            }(),
            actions: [
              if (state == ConnectionState.done)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, output);
                  },
                  child: Text('CLOSE'),
                ),
              if (state == ConnectionState.active)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, output);
                  },
                  child: Text('STOP'),
                ),
              if (state != ConnectionState.done)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  child: Text('CANCEL'),
                ),
            ],
          );
        },
      );
    },
  );
}
*/

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

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:path_provider/path_provider.dart';
import 'package:string_unescape/string_unescape.dart';
import 'package:url_launcher/url_launcher.dart';
import 'functions.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'classes.dart';
import 'parser.dart';

var isWebviewAvailable = false;

Future<List<Offering>?> getSubject(BuildContext context) async {
  if (!isWebviewAvailable && !await WebviewWindow.isWebviewAvailable()) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return ContentDialog(
            title: Text('WebView2 is not installed'),
            content: RichText(
              text: TextSpan(
                  style: FluentTheme.of(context).typography.body,
                  children: [
                    TextSpan(
                      text: 'You need to download and install the ',
                    ),
                    TextSpan(
                        text: 'Microsoft Edge WebView2 Runtime',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(
                                'https://go.microsoft.com/fwlink/p/?LinkId=2124703'));
                          },
                        style: FluentTheme.of(context)
                            .typography
                            .body!
                            .copyWith(
                                color: Colors.blue,
                                decoration: TextDecoration.underline)),
                    TextSpan(
                        text:
                            ' to access My.LaSalle within AralTools SkedMaker. This program is already included with Windows 11, but your device doesn\'t.\n\n'),
                    TextSpan(
                        text: 'Click here to learn more.',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(
                                'https://developer.microsoft.com/en-us/microsoft-edge/webview2'));
                          },
                        style: FluentTheme.of(context)
                            .typography
                            .body!
                            .copyWith(
                                color: Colors.blue,
                                decoration: TextDecoration.underline)),
                  ]),
            ),
            actions: [
              Button(
                child: Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FilledButton(
                  child: Text('Download'),
                  onPressed: () {
                    launchUrl(Uri.parse(
                        'https://go.microsoft.com/fwlink/p/?LinkId=2124703'));
                  })
            ],
          );
        });
  }
  // if it's avalable, set this to true so that it won't check again
  isWebviewAvailable = true;

  // TODO add platform checking here
  Webview window = await WebviewWindow.create(
      configuration: CreateConfiguration(
    userDataFolderWindows:
        '${(await getApplicationSupportDirectory()).path}/skedmaker',
    // I wish there was a way to customize the "title bar" (supposed to be appbar) further
    titleBarHeight: 0,
    title: 'View course offerings',
  ));
  // TODO add setting for this later
  window.launch('https://enroll.dlsu.edu.ph/dlsu/view_course_offerings');

  return await showDialog<List<Offering>>(
    context: context,
    barrierDismissible: false, //false to avoid accidental exit
    dismissWithEsc: false,
    builder: (context) {
      bool isError = false;
      return StatefulBuilder(builder: (context, setState) {
        return ContentDialog(
          title: Text('Add subject'),
          content: Text(
              'Enter your ID number and the subject code on the pop-up window. Once the offerings are displayed, click "Add".${isError ? '\nError' : ''}'),
          actions: [
            Button(
              child: Text('Cancel'),
              onPressed: () {
                window.close();
                Navigator.pop(context);
              },
            ),
            FilledButton(
              onPressed: () async {
                // Javascript code to get the HTML of the table
                final table = await window.evaluateJavaScript(
                    "document.querySelector('td>form>table').outerHTML");
                try {
                  Navigator.pop(context, parse(unescape(table!)));
                  window.close();
                } catch (e) {
                  setState(() {
                    isError = true;
                  });
                }
              },
              child: Text('Add'),
            )
          ],
        );
      });
    },
  );
}

Future<List<Offering>?> getSubjectFromString(BuildContext context) async {
  return await showDialog<List<Offering>>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      final controller = TextEditingController();
      bool isError = false;

      return StatefulBuilder(builder: (context, setState) {
        return ContentDialog(
          title: Text('Add subjects via code'),
          content: ListView(
            shrinkWrap: true,
            children: [
              Text(
                  'Open My.LaSalle\'s Course Offerings on a browser and enter your ID number and subject code as normal. Once the offerings are displayed, open the Developer Console and enter this command:'),
              SizedBox(height: 8),
              TextBox(
                readOnly: true,
                controller: TextEditingController(
                    text: "document.querySelector('td>form>table').outerHTML"),
              ),
              SizedBox(height: 8),
              Text('Copy the output and paste it here:'),
              SizedBox(height: 8),
              TextBox(
                controller: controller,
                placeholder: 'The command output',
                maxLines: null,
                autofocus: true,
              ),
              if (isError) Text('Invalid input'),
            ],
          ),
          actions: [
            Button(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FilledButton(
              child: Text('Add'),
              onPressed: () {
                final table = controller.text;
                try {
                  table.substring(1, table.length - 1);

                  Navigator.pop(context, parse(unescape(table)));
                } catch (e) {
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

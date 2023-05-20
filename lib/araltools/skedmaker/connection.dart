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
import 'package:string_unescape/string_unescape.dart';
import 'functions.dart';
import 'package:flutter/material.dart';

import 'classes.dart';

Future<List<Offering>?> getSubject(BuildContext context) async {
  //return ;
  // TODO add platform checking here
  Webview window = await WebviewWindow.create(
      configuration: CreateConfiguration(
    titleBarHeight:
        0, // I wish there was a way to customize the title bar (supposed to be appbar) further
    title: 'View course offerings',
  ));
  // TODO add setting for this later
  window.launch('https://enroll.dlsu.edu.ph/dlsu/view_course_offerings');

  return await showDialog<List<Offering>>(
    context: context,
    builder: (context) {
      bool isError = false;
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: Text('Add subject'),
          content: Text(
              'Enter your ID number and the subject code on the pop-up window. Once the offerings are displayed, click "Add".${(isError) ? '\nError' : ''}'),
          actions: [
            TextButton(
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('ADD'),
              ),
            )
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
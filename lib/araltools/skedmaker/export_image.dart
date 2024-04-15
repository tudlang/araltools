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

import 'package:araltools/araltools/skedmaker/classes.dart';
import 'package:araltools/araltools/skedmaker/skedmaker_activity.dart';
import 'package:araltools/strings.g.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Scrollbar;
import 'package:flutter/material.dart'
    hide showDialog, Colors, FilledButton, IconButton, ButtonStyle;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:file_picker/file_picker.dart';

import 'windows/ui_schedules.dart';

exportImage(BuildContext context, ScheduleWeek schedule) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: FluentTheme.of(context).micaBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: kElevationToShadow[6],
        ),
        padding: EdgeInsets.all(16),
        child: ExportImagePreview(
          schedule: schedule,
        ),
      );
    },
  );
}

class ExportImagePreview extends StatefulWidget {
  const ExportImagePreview({super.key, required this.schedule});

  final ScheduleWeek schedule;

  @override
  State<ExportImagePreview> createState() => _ExportImagePreviewState();
}

class _ExportImagePreviewState extends State<ExportImagePreview> {
  ScreenshotController screenshotController = ScreenshotController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                strings.skedmaker.schedules.commandbar.saveImage.title,
                style: FluentTheme.of(context).typography.title,
              ),
            ),
            SizedBox(width: 15),
            Text(strings.skedmaker.schedules.commandbar.saveImage.desc),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                MdiIcons.close,
                size: 20,
              ),
              iconButtonMode: IconButtonMode.large,
            )
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: Center(
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              interactive: true,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Screenshot(
                  controller: screenshotController,
                  child: ExportImageLandscape(schedule: widget.schedule),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(strings.general.general.cancel),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(width: 8),
            FilledButton(
              onPressed: () async {
                final path = await FilePicker.platform.saveFile(
                  dialogTitle:
                      strings.skedmaker.schedules.commandbar.saveImage.title,
                  fileName: "${widget.schedule.name}.png",
                  lockParentWindow: true,
                  type: FileType.image,
                );
                if (path == null) return;

                final file = File(path);
                final result = await screenshotController.captureAndSave(
                    file.parent.path,
                    fileName: file.uri.pathSegments.last);

                if (result != null) {
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(strings.general.general.save),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ExportImageLandscape extends StatelessWidget {
  const ExportImageLandscape({super.key, required this.schedule});

  final ScheduleWeek schedule;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                width: 110 * 7 - 11,
                height: 71 * 14,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: IgnorePointer(
                      child: Material(
                    child: Timetable2Fragment(
                      week: schedule,
                    ),
                  )),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      schedule.name,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      schedule.notes,
                      textAlign: TextAlign.center,
                      style:
                          textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final subject in schedule.subjects)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: ScheduleFragmentCard(
                              subject: subject,
                            ),
                          )
                      ],
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      strings.skedmaker.schedules.commandbar.saveImage.credits(
                        name: (name) => TextSpan(
                          text: name,
                          style: textTheme.bodyLarge?.copyWith(
                              fontFamily: 'Raleway',
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

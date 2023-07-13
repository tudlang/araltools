import 'dart:io';

import 'package:araltools/araltools/skedmaker/classes.dart';
import 'package:araltools/araltools/skedmaker/skedmaker_activity.dart';
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
    barrierDismissible: true,
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
                'Save as image',
                style: FluentTheme.of(context).typography.title,
              ),
            ),
            SizedBox(width: 15),
            Text(
                'Resize the window to adjust the image format. When done, click "Save".'),
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
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Cancel'),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(width: 8),
            FilledButton(
              onPressed: () async {
                final path = await FilePicker.platform.saveFile(
                  dialogTitle: 'Save schedule',
                  fileName: "${widget.schedule.name}.png",
                  lockParentWindow: true,
                  type: FileType.image,
                );
                if (path == null) return;

                final file = File(path);
                final result = await screenshotController.captureAndSave(file.parent.path,
                    fileName: file.uri.pathSegments.last);

                if (result != null){
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Save'),
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
                height: 50 * 14 + 68,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: TimetableFragment(week: schedule),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      schedule.name,
                      style: textTheme.headlineLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 10),
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
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: 'generated by '),
                      TextSpan(
                          text: 'AralTools SkedMaker',
                          style: textTheme.bodyLarge?.copyWith(
                              fontFamily: 'Raleway',
                              color: Colors.white,
                              fontSize: 20)),
                    ]))
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

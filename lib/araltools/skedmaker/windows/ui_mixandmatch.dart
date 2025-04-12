import 'package:araltools/araltools/skedmaker/classes.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Card;
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:provider/provider.dart';

import '../models.dart';
import '../skedmaker_activity.dart';
import '/strings.g.dart';
import 'ui_schedules.dart';

class MixandmatchFragment extends StatefulWidget {
  const MixandmatchFragment({super.key});

  @override
  State<MixandmatchFragment> createState() => _MixandmatchFragmentState();
}

class _MixandmatchFragmentState extends State<MixandmatchFragment> {
  @override
  Widget build(BuildContext context) {
    return MultiSplitViewTheme(
      data: MultiSplitViewThemeData(
        dividerThickness: 5,
        dividerPainter: DividerPainters.background(
            color: Color(0xFFeaeaea),
            highlightedColor: Color.fromARGB(255, 192, 192, 192)),
      ),
      child: MultiSplitView(
        axis: Axis.horizontal,
        initialAreas: [
          Area(
            builder: (context, area) => MixandmatchOfferings(),
          ),
          Area(
            builder: (context, area) => MixandmatchSchedule(),
          ),
        ],
      ),
    );
  }
}

class MixandmatchOfferings extends StatefulWidget {
  const MixandmatchOfferings({super.key});

  @override
  State<MixandmatchOfferings> createState() => _MixandmatchOfferingsState();
}

class _MixandmatchOfferingsState extends State<MixandmatchOfferings> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final model = context.watch<SkedmakerModel>();

    return Column(children: [
      Text(
        strings.skedmaker.mixandmatch.offerings.title,
        style: textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
      Expanded(
        child: ListView.builder(
          itemCount: model.subjects.keys.length,
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final subjects = model.subjects;
            final offeringsAtSubject = subjects.values.elementAt(index);

            return Expander(
              header: Row(
                children: [
                  SubjectText(
                    offering: offeringsAtSubject.first,
                  ),
                  SizedBox(width: 8),
                  Text(strings.skedmaker.mixandmatch.offerings.numberSelected(
                      number: offeringsAtSubject
                          .where((o) => model.mixandmatchOfferings.contains(o))
                          .length))
                ],
              ),
              content: LimitedBox(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final offering in offeringsAtSubject)
                      InkWell(
                        onHover: (isHovered) {
                          if (model.mixandmatchOfferings.contains(offering)) {
                            return;
                          }

                          model.modifyMixandmatchWeek((week) {
                            if (isHovered) {
                              week.add(offering,
                                  bypassSubjectChecker: true,
                                  bypassConflictChecker: true);
                            } else {
                              model.modifyMixandmatchWeek((week) {
                                week.remove(offering);
                              });
                            }
                          });
                        },
                        onTap: () {
                          model.modifyMixandmatchOfferings((offerings) {
                            if (offerings.contains(offering)) {
                              offerings.remove(offering);
                              model.modifyMixandmatchWeek((week) {
                                week.remove(offering);
                              });
                            } else {
                              offerings.add(offering);
                              model.modifyMixandmatchWeek((week) {
                                week.add(offering,
                                    bypassSubjectChecker: true,
                                    bypassConflictChecker: true);
                              });
                            }
                          });
                        },
                        child: Container(
                          foregroundDecoration:
                              model.mixandmatchOfferings.contains(offering)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 5, color: theme.primaryColor))
                                  : null,
                          child: ScheduleFragmentCard(
                            subject: offering,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      )
    ]);
  }
}

class MixandmatchSchedule extends StatefulWidget {
  const MixandmatchSchedule({super.key});

  @override
  State<MixandmatchSchedule> createState() => _MixandmatchScheduleState();
}

class _MixandmatchScheduleState extends State<MixandmatchSchedule> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final model = context.watch<SkedmakerModel>();

    return Column(children: [
      Text(
        strings.skedmaker.mixandmatch.schedule.title,
        style: textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CommandBarCard(
          child: CommandBar(
            primaryItems: [
              CommandBarButton(
                label: Text(strings.skedmaker.mixandmatch.schedule.commandbar
                    .addToSchedules.name),
                icon: Icon(MdiIcons.calendarExportOutline),
                onPressed: () {
                  final model = context.read<SkedmakerModel>();

                  if (model.mixandmatchOfferings.isEmpty) {
                    displayInfoBar(context, builder: (context, close) {
                      return InfoBar(
                        title: Text(strings.skedmaker.mixandmatch.schedule
                            .commandbar.addToSchedules.empty),
                        severity: InfoBarSeverity.error,
                      );
                    });
                    return;
                  }

                  model.addSchedule(model.mixandmatchWeek.copy()
                    ..name = strings.skedmaker.mixandmatch.name);

                  // direct user to schedules pane
                  context.read<SkedmakerUiModel>().paneIndex = 2;

                  displayInfoBar(context, builder: (context, close) {
                    return InfoBar(
                      title: Text(strings.skedmaker.mixandmatch.schedule
                          .commandbar.addToSchedules.success),
                      severity: InfoBarSeverity.success,
                    );
                  });
                },
              ),
              CommandBarSeparator(),
              CommandBarButton(
                label: Text(strings.general.general.reset),
                icon: Icon(MdiIcons.calendarExportOutline),
                onPressed: () {
                  final model = context.read<SkedmakerModel>();

                  model.resetMixandmatch();
                },
              ),
            ],
          ),
        ),
      ),
      Expanded(
          child: Timetable2Fragment(
        week: model.mixandmatchWeek,
      )),
    ]);
  }
}

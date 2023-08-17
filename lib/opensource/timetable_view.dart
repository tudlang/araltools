import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_timetable/simple_timetable.dart';
import 'package:simple_timetable/src/event.dart';
import 'package:simple_timetable/src/events_create.dart';
import 'package:simple_timetable/src/helpers.dart';
import 'package:simple_timetable/src/timeline.dart';
import 'package:simple_timetable/src/timetable_helper.dart';
import 'package:simple_timetable/src/extensions.dart';

class SimpleTimetable<T> extends StatefulWidget {
  const SimpleTimetable({
    required this.events,
    this.initialDate,
    this.cellHeight = 60,
    this.timelineColumnWidth = 50,
    this.horizontalIndent = 0,
    this.buildHeader,
    this.buildCell,
    this.buildCard,
    this.onChange,
    this.visibleTimeline = true,
    int this.dayStart = 8,
    int this.dayEnd = 24,
    this.visibleRange = 7,
    this.colorTimeline,
    this.prevButton,
    this.nextButton,
  })  : assert(dayStart < dayEnd),
        assert(dayEnd > dayStart),
        assert(dayStart >= 0 && dayStart <= 23),
        assert(dayEnd > 0 && dayEnd <= 24);

  final bool visibleTimeline;
  final List<Event<T>> events;
  final DateTime? initialDate;
  final Color? colorTimeline;
  final double? cellHeight;
  final double? timelineColumnWidth;
  final double? horizontalIndent;
  final int? visibleRange;
  final int? dayStart;
  final int? dayEnd;
  final void Function(
    List<DateTime> currentColumns,
    TimetableDirection? dir,
  )? onChange;
  final Widget Function(Event<T> event, bool isPast)? buildCard;
  final Widget Function(bool isFirstColumn, bool isLastColumn)? buildCell;
  final Widget Function(DateTime date, bool isToday)? buildHeader;
  final Widget? prevButton;
  final Widget? nextButton;

  @override
  SimpleTimetableState<T> createState() => SimpleTimetableState();
}

class SimpleTimetableState<T> extends State<SimpleTimetable<T>> {
  late Timer _timer;
  double? _dragDirection = 0;
  List<DateTime> _timeLine = [];
  late TimetableHelper _timetableHelper;
  Map<DateTime, List<DateTime>> _columns = {};
  Map<DateTime, List<List<Event<T>>>> _groups = {};
  final ValueNotifier<double> _timeLinePosition = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();

    _timelinePosition();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _timelinePosition();
    });

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _createTable(
        start: widget.initialDate ?? DateTime.now(),
        dir: TimetableDirection.none,
      );
      _createGroups();
    });
  }

  @override
  void didUpdateWidget(SimpleTimetable<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.visibleRange != widget.visibleRange) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _createTable(
          start: _columns.keys.first,
          dir: TimetableDirection.none,
        );
      });
    }

    if (widget.initialDate != null) {
      if (oldWidget.initialDate!.startOfDay != widget.initialDate!.startOfDay) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          _createTable(
            start: widget.initialDate,
            dir: TimetableDirection.none,
          );
        });
      }
    }

    _createGroups();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Future<void> _createGroups() async {
    final data = await getGroups<T>(widget.events);
    setState(() {
      _groups = data;
    });
  }

  void _timelinePosition() {
    final _t = widget.cellHeight! / 60;
    final _todayStart = DateTime.now().startOfDay.addHour(widget.dayStart!);
    final _now = DateTime.now();

    int _diff = _todayStart.difference(_now).inMinutes.abs();

    if (_todayStart.difference(_now).inMinutes < 0) {
      _diff = _todayStart.difference(_now).inMinutes.abs();
    } else {
      _diff = 0;
    }
    _timeLinePosition.value = _diff * _t;
  }

  void _createTable({DateTime? start, TimetableDirection? dir}) {
    _timetableHelper = TimetableHelper(
      dayStartTime: widget.dayStart,
      dayEndTime: widget.dayEnd,
      visibleRange: widget.visibleRange,
    );
    _columns = _timetableHelper.getTable(start);
    _timeLine = _timetableHelper.getTimeLineForDay(start);

    if (widget.onChange != null) {
      widget.onChange!(_columns.keys.toList(), dir);
    }
    setState(() {});
  }

  bool _getLastColumn(DateTime date) => _columns.keys.last == date;

  bool _getFirstColumn(DateTime date) => _columns.keys.first == date;

  BoxDecoration _cellDefaultStyle(bool isFirst, bool isLast) => BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor),
          right: isLast
              ? BorderSide.none
              : BorderSide(color: Theme.of(context).dividerColor),
        ),
      );

  Column _cell(MapEntry<DateTime, List<DateTime>> column) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...column.value.map(
          (elem) {
            final bool _isFirstColumn = _getFirstColumn(column.key);
            final bool _isLastColumn = _getLastColumn(column.key);
            return Container(
              decoration: widget.buildCell != null
                  ? null
                  : _cellDefaultStyle(_isFirstColumn, _isLastColumn),
              height: widget.cellHeight,
              child: widget.buildCell == null
                  ? null
                  : widget.buildCell!(_isFirstColumn, _isLastColumn),
            );
          },
        ).toList()
      ],
    );
  }

  Widget _cellHeader(DateTime day, bool _isToday) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: _isToday ? Colors.blue[400] : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Text('${day.day}'),
      ),
    );
  }

  Widget _prev(DateTime date) {
    return IconButton(
      onPressed: () {
        _createTable(
          start: date.subDay(1),
          dir: TimetableDirection.backward,
        );
      },
      icon: widget.prevButton ??
          const Icon(
            Icons.arrow_back_ios,
          ),
    );
  }

  Widget _next(DateTime date) {
    return IconButton(
      onPressed: () {
        _createTable(
          start: date.addDay(1),
          dir: TimetableDirection.forward,
        );
      },
      icon: widget.nextButton ??
          const Icon(
            Icons.arrow_forward_ios,
          ),
    );
  }

  Widget _eventsForColumn(MapEntry<DateTime, List<DateTime>> column) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cellWidth = constraints.constrainWidth();
        List<Widget>? eventWidgets;
        if (_groups.keys.contains(column.key)) {
          eventWidgets = eventsCreate<T>(
            dayStartFrom: widget.dayStart!,
            events: _groups[column.key]!,
            cellHeight: widget.cellHeight!,
            cellWidth: cellWidth,
            buildCard: widget.buildCard,
          );
        }
        return Stack(
          children: [
            _cell(column),
            ...?eventWidgets,
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_timeLine.isEmpty || _columns.isEmpty) return const SizedBox.shrink();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: widget.horizontalIndent!,
            right: widget.horizontalIndent!,
          ),
          child: Row(
            children: [
              // SizedBox( TODO MODIFIED THIS
              //   width: widget.timelineColumnWidth,
              //   child: _prev(_columns.keys.first),
              // ),
              ..._columns.keys.map(
                (day) {
                  final bool _isToday = day.isToday;

                  return Expanded(
                    child: SizedBox(
                      height: 60,
                      child: Align(
                          child: _columns.keys.last == day
                              ? Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    if (widget.buildHeader != null)
                                      widget.buildHeader!(day, _isToday)
                                    else
                                      _cellHeader(day, _isToday),
                                    //Positioned( TODO MODIFIED THIS
                                    //  top: 0,
                                    //  right: 0,
                                    //  bottom: 0,
                                    //  child: _next(_columns.keys.first),
                                    //)
                                  ],
                                )
                              : widget.buildHeader != null
                                  ? widget.buildHeader!(day, _isToday)
                                  : _cellHeader(day, _isToday)),
                    ),
                  );
                },
              ).toList(),
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            /* TODO MODIFIED THIS
            onHorizontalDragUpdate: (details) {
              _dragDirection = details.primaryDelta;
            },
            onHorizontalDragEnd: (DragEndDetails details) {
              if (_dragDirection! < 0) {
                final DateTime _date = _columns.keys.first.addDay(1);
                _createTable(start: _date, dir: TimetableDirection.forward);
              } else {
                final DateTime _date = _columns.keys.first.subDay(1);
                _createTable(start: _date, dir: TimetableDirection.backward);
              }
            },*/
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  left: widget.horizontalIndent!,
                  right: widget.horizontalIndent!,
                ),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: widget.timelineColumnWidth,
                          child: Stack(
                            clipBehavior: Clip.antiAlias,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ..._timeLine.map(
                                    (item) {
                                      return Container(
                                        alignment: Alignment.topRight,
                                        decoration: const BoxDecoration(
                                          border: Border(),
                                        ),
                                        height: widget.cellHeight,
                                        child: Transform.translate(
                                          offset: const Offset(-8.0, -8.0),
                                          child: SizedBox(
                                            child: Text('${item.hour}:00'),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList()
                                ],
                              ),
                            ],
                          ),
                        ),
                        ..._columns.entries.map(
                          (column) {
                            return Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _eventsForColumn(column),
                                ],
                              ),
                            );
                          },
                        ).toList()
                      ],
                    ),
                    if (_timeLinePosition.value != 0.0 &&
                        widget.visibleTimeline)
                      ValueListenableBuilder<double>(
                        valueListenable: _timeLinePosition,
                        builder: (
                          BuildContext context,
                          double value,
                          Widget? child,
                        ) =>
                            TimeLine(
                          color: widget.colorTimeline,
                          offsetTop: _timeLinePosition.value,
                          timelineColumnWidth: widget.timelineColumnWidth!,
                          horizontalIndent: widget.horizontalIndent!,
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

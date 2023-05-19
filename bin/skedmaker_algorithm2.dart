import 'dart:convert';

import 'package:araltools/araltools/skedmaker/classes.dart' hide ScheduleWeek;
import 'package:araltools/araltools/skedmaker/functions.dart';
import 'package:araltools/araltools/skedmaker/test_tables.dart';
import 'package:collection/collection.dart';

void main() {
  // count execution time
  final stopwatch = Stopwatch()..start();

  Map<String, List<Offering>> subjects = {};

  subjects['CALENG2'] = parse(caleng2);
  subjects['LBYMF1C'] = parse(lbymf1c);
  //subjects['LCLSONE'] = parse(lclsone);
  //subjects['LBYMF1D'] = parse(lbymf1d);

  //List<Offering> all = [for (final i in subjects.values) ...i];




  stopwatch.stop();
  print("ELAPSED TIME: ${stopwatch.elapsedMilliseconds}");
}
//Set<ScheduleWeek> schedules;
// set the weights AFTER

final days = ["M", "T", "W", "H", "F", "S"];

class ScheduleWeek{


}
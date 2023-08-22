import 'dart:convert';

import 'package:araltools/araltools/skedmaker/classes.dart';
import 'package:araltools/araltools/skedmaker/filters.dart';
import 'package:archive/archive_io.dart';
import 'package:xml/xml.dart';

import 'models.dart';

SkedmakerModel importXml({
  required String path,
}) {
  // Use an InputFileStream to access the zip file without storing it in memory.
  final inputStream = InputFileStream(path);

  final archive = ZipDecoder().decodeBuffer(inputStream);


  final decoderUtf8 = Utf8Decoder();

  Map<String, List<Offering>> subjects = {};
  Set<ScheduleWeek> schedules = {};
  late ScheduleFilters filters;

  for (final file in archive.files) {
    final xml = XmlDocument.parse(decoderUtf8.convert(file.content));

    switch (file.name) {
      case 'subjects.xml':
        subjects = importXmlSubjects(xml);
      case 'schedules.xml':
        schedules = importXmlSchedules(xml);
      case 'filters.xml':
        filters = importXmlFilters(xml);
    }
  }

  inputStream.close();

  return SkedmakerModel(
    path: path,
    subjects: subjects,
    schedules: schedules,
    filters: filters,
  );
}

Map<String, List<Offering>> importXmlSubjects(XmlDocument xml) {
  final subjects = <String, List<Offering>>{};

  for (final subjectXml in xml.rootElement.childElements) {
    final code = subjectXml.getAttribute('code')!;
    final offerings = <Offering>[];

    for (final offeringXml in subjectXml.childElements) {
      offerings.add(Offering.decodeXml(offeringXml));
    }

    subjects[code] = offerings;
  }

  return subjects;
}

ScheduleFilters importXmlFilters(XmlDocument xml) {
  return ScheduleFilters.decodeXml(xml.rootElement);
}

Set<ScheduleWeek> importXmlSchedules(XmlDocument xml) {
  final schedules = <ScheduleWeek>{};

  for (final scheduleXml in xml.rootElement.childElements) {
    schedules.add(ScheduleWeek.decodeXml(scheduleXml));
  }

  return schedules;
}

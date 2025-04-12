// Copyright (C) 2025 Tudlang
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

import 'dart:convert';

import 'package:araltools/araltools/skedmaker/classes.dart';
import 'package:araltools/araltools/skedmaker/filters.dart';
import 'package:araltools/utils.dart';
import 'package:archive/archive_io.dart';
import 'package:xml/xml.dart';

import 'models.dart';

SkedmakerModel importXml({
  required String path,
}) {

  print("OPENING " + path);

  // Use an InputFileStream to access the zip file without storing it in memory.
  final inputStream = InputFileStream(path);

  final archive = ZipDecoder().decodeStream(inputStream);

  final decoderUtf8 = Utf8Decoder();

  Map<String, List<Offering>> subjects = {};
  Set<String> subjectsHidden = {};
  Set<ScheduleWeek> schedules = {};
  late ScheduleFilters filters;
  List<int> tabs = [];

  for (final file in archive.files) {
    final xml = XmlDocument.parse(decoderUtf8.convert(file.content));

    switch (file.name) {
      case 'subjects.xml':
        final _ = importXmlSubjects(xml);
        subjects = _.subjects;
        subjectsHidden = _.subjectsHidden;
      case 'schedules.xml':
        schedules = importXmlSchedules(xml);
      case 'filters.xml':
        filters = importXmlFilters(xml);
      case 'schedules_tabs.xml':
        tabs = importXmlTabs(xml);
    }
  }

  inputStream.close();

  return SkedmakerModel(
    path: path,
    subjects: subjects,
    schedules: schedules,
    filters: filters,
    tabs: tabs,
    subjectsHidden: subjectsHidden,
  );
}

({
  Map<String, List<Offering>> subjects,
  Set<String> subjectsHidden,
}) importXmlSubjects(XmlDocument xml) {
  final subjects = <String, List<Offering>>{};
  final subjectsHidden = <String>{};

  for (final subjectXml in xml.rootElement.childElements) {
    final code = subjectXml.getAttribute('code')!;

    if (subjectXml.getAttribute('hidden') != null) {
      subjectsHidden.add(code);
    }

    final offerings = <Offering>[];

    for (final offeringXml in subjectXml.childElements) {
      offerings.add(Offering.decodeXml(offeringXml));
    }

    subjects[code] = offerings;
  }

  return (
    subjects: subjects,
    subjectsHidden: subjectsHidden,
  );
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

List<int> importXmlTabs(XmlDocument xml) {
  List<int> tabs = [];

  for (final scheduleXml in xml.rootElement.childElements) {
    tabs.add(scheduleXml.innerText.toInt());
  }
  return tabs;
}

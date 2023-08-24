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

import 'dart:convert';
import 'package:araltools/araltools/skedmaker/filters.dart';
import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:xml/xml.dart';

import 'models.dart';
import 'classes.dart';

Future<File?> exportXml({
  required SkedmakerModel model,
  String? path,
}) async {
  path ??= await FilePicker.platform.saveFile(
    dialogTitle: 'Save to file',
    fileName: "Untitled.atsm",
    lockParentWindow: true,
    type: FileType.custom,
    allowedExtensions: ['atsm'],
  );
  if (path == null) return null;
  if (!path.endsWith('.atsm')) path += '.atsm';

  final archive = Archive();
  final encoderUtf8 = Utf8Encoder();

  // iterate thru the xml files
  for (final xml in [
    (exportXmlSubjects(model.subjects, model.subjectsHidden), 'subjects.xml'),
    (exportXmlFilters(model.filters), 'filters.xml'),
    (exportXmlSchedules(model.schedules), 'schedules.xml'),
    (exportXmlTabs(model.tabs), 'schedules_tabs.xml'),
  ]) {
    final string = xml.$1.toXmlString(pretty: true);
    final stringEncoded = encoderUtf8.convert(string);

    archive.addFile(ArchiveFile(xml.$2, 0, stringEncoded));
  }

  final encoderZip = ZipEncoder();
  // encode to binary data
  final zipData = encoderZip.encode(archive)!;

  final file = File(path);
  return await file.writeAsBytes(zipData);
}

/// Export [subjects] to XML
///
/// Outputted XML example:
///
///```xml
///<subjects>
///    <subject code="ENGCHEM" hidden>
///        <offering>
///            <status>open</status>
///            <classno>4142</classno>
///            <section>ER2</section>
///            <room>VL201</room>
///            <day>mondayUnknown</day>
///            <time start='1300' end='1400' />
///            <time start='1300' end='1400' />
///            <slots available='3' capacity='' />
///            <remarks></remarks>
///            <color>ffffff</color>
///        </offering>
///        <offering>...</offering>
///    </subject>
///    <subject>...</subject>
///</subjects>
///```
XmlDocument exportXmlSubjects(
    Map<String, List<Offering>> subjects, Set<String> subjectsHidden) {
  final builder = XmlBuilder();

  builder.element('subjects', nest: () {
    for (final subject in subjects.entries) {
      builder.element('subject', nest: () {
        builder.attribute('code', subject.key);

        if (subjectsHidden.contains(subject.key)) {
          builder.attribute('hidden', '');
        }

        for (final offering in subject.value) {
          offering.encodeXml(builder);
        }
      });
    }
  });

  return builder.buildDocument();
}

XmlDocument exportXmlFilters(ScheduleFilters filters) {
  final builder = XmlBuilder();

  filters.encodeXml(builder);

  return builder.buildDocument();
}

/// Export [schedules] to XML
///
/// Outputted XML example:
///
///```xml
///<schedules>
///   <schedule>
///       <name>Schedule 1</name>
///       <notes></notes>
///       <subjects>
///           <offering>...</offering>
///           ...
///       </subjects>
///       <days>
///           <monday>
///               <offering>...</offering>
///               ...
///           </monday>
///           <tuesday>
///               <offering>...</offering>
///               ...
///           </tuesday>
///           <wednesday>
///               <offering>...</offering>
///               ...
///           </wednesday>
///           <thursday>
///               <offering>...</offering>
///               ...
///           </thursday>
///           <friday>
///               <offering>...</offering>
///               ...
///           </friday>
///           <saturday>
///               <offering>...</offering>
///               ...
///           </saturday>
///       </days>
///   </schedule>
///   ...
///</schedules
///```
XmlDocument exportXmlSchedules(Set<ScheduleWeek> schedules) {
  final builder = XmlBuilder();

  builder.element('schedules', nest: () {
    for (final schedule in schedules) {
      schedule.encodeXml(builder);
    }
  });

  return builder.buildDocument();
}

/// Export [tabs] to XML
///
/// Outputted XML example:
///
///```xml
///<tabs>
///   <tab>2</tab>
///   ...
///</tabs>
///```
XmlDocument exportXmlTabs(List<int> tabs) {
  final builder = XmlBuilder();

  builder.element('tabs', nest: () {
    for (final tab in tabs) {
      builder.element('tab', nest: tab);
    }
  });

  return builder.buildDocument();
}

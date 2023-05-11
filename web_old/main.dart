library;

import 'dart:html';
import 'dart:math';

part './sched.dart';

void main() {
  final timetable = document.querySelector('#timetable')!;

  for (int i = 0; i <= 2359; i = i + 5) {
    if (i % 100 >= 60) continue; // because there's only 60 minutes in an hour

    if (i < 700) continue;
    if (i >= 1900) continue;

    final row = document.createElement('tr');
    row.id = "$i";

    if (i % 100 == 0) {
      row.style.borderTop = "1px solid #e1e1e1";
      //appending 1st
      final col1 = document.createElement("td");
      col1.attributes["rowspan"] = "12";
      col1.text = "${i / 100}";
      row.append(col1);
    }

    for (final day in ScheduleDay.values) {
      final cell = document.createElement('td');
      cell.id = "${day.name}$i";
      cell.classes.add("schedcell");
      //cell.text="${day.name}$i";
      cell.style.borderLeft = "1px solid grey";
      row.append(cell);
    }

    timetable.append(row);
  }

  final checkboxes = document.querySelector("#checkboxes")!;
  final root = document.querySelector(":root")!;
  final timeinfo = document.querySelector("#timeinfo")!;
  final style = document.querySelector("style")!;

  // scanner
  for (final subject in sched) {
    final subjectCode = "sub-" + subject.code;

    root.style.setProperty("--$subjectCode", subject.color);

    style.appendText("""td.$subjectCode{background-color:${subject.color};}""");

    final checkbox = document.createElement("input") as CheckboxInputElement;
    checkbox.attributes["type"] = "checkbox";
    checkbox.attributes["checked"] = "true";
    checkbox.id = "$subjectCode-checkbox";
    checkbox.addEventListener('change', (event) {
      if (checkbox.checked == true) {
        document.querySelectorAll(".x$subjectCode").forEach((element) {
            element.classes
              ..remove('x$subjectCode')
              ..add(subjectCode);
          });
        //root.style.setProperty("--$subjectCode", subject.color);
        //document.querySelectorAll(".$subjectCode").forEach((element) {
        //  element.style.visibility = "visible";
        //});
      } else {
        document.querySelectorAll(".$subjectCode").forEach((element) {
            element.classes
              ..remove(subjectCode)
              ..add('x$subjectCode');
          });
        //root.style.setProperty("--$subjectCode", 'transparent');
        //document.querySelectorAll(".$subjectCode").forEach((element) {
        //  element.style.visibility = "hidden";
        //});
      }
    });
    checkboxes.append(checkbox);
    checkboxes.append(document.createElement('label')
      ..attributes["for"] = "$subjectCode-checkbox"
      ..text = subject.code);

    checkboxes.append(document.createElement('br'));

    //Looping thru offerings
    for (final offering in subject.offerings) {
      final subjectSection = "section-${subject.code}-${offering.section}";

      style.appendText("""td.$subjectSection{visibility:visible;}""");

      root.style.setProperty("--$subjectSection", "visible");

      final checkbox2 = document.createElement("input") as CheckboxInputElement;
      checkbox2.attributes["type"] = "checkbox";
      checkbox2.attributes["checked"] = "true";
      checkbox2.id = "$subjectSection-checkbox";
      checkbox2.addEventListener('change', (event) {
        if (checkbox2.checked == true) {
          document.querySelectorAll(".$subjectSection").forEach((element) {
            element.style.visibility = 'visible';
          });
          //root.style.setProperty("--$subjectSection", 'visible');
        } else {
          document.querySelectorAll(".$subjectSection").forEach((element) {
             element.style.visibility = 'hidden';
          });

          //root.style.setProperty("--$subjectSection", 'hidden');
        }
      });
      checkboxes.insertAdjacentElement('beforeEnd', checkbox2);
      checkboxes.insertAdjacentElement(
          'beforeEnd',
          document.createElement('label')
            ..attributes["for"] = "$subjectSection-checkbox"
            ..text = subjectSection);

      for (final schedule in offering.schedules.entries) {
        for (var i = schedule.value.start; i < schedule.value.end; i++) {
          final cell = document.querySelector("#${schedule.key.name}$i");
          if (cell == null) continue;

          //cell.style.backgroundColor =
          //    "${cell.style.backgroundColor}${(cell.style.backgroundColor.isNotEmpty ? ', ' : '')}var(--$subjectCode)";
          //cell.style.backgroundColor =
          //    "var(--$subjectCode)";
          cell.style.visibility = "var(--$subjectSection)";
          cell.classes.add(subjectCode);
          cell.classes.add(subjectSection);
          cell.addEventListener('mouseover', (event) {
            timeinfo.innerHtml = (timeinfo.innerHtml ?? '') +
                offering.toTimeinfo(subjectSection);
            document
                .querySelectorAll("td.$subjectCode:not(.$subjectSection)")
                .forEach((element) {
              element.style.opacity = "0.5";
            });
          });
          cell.addEventListener('mouseout', (event) {
            timeinfo.innerHtml = '';
            document
                .querySelectorAll("td.$subjectCode:not(.$subjectSection)")
                .forEach((element) {
              element.style.opacity = "1";
            });
          });
        }
      }
    }

    checkboxes.append(document.createElement('br'));
    checkboxes.append(document.createElement('br'));
  }
}

class Subject {
  String code;
  List<Offering> offerings;

  Subject({
    this.code = '',
    this.offerings = const [],
  });

  String get color {
    final random = Random();
    return "hsl(${random.nextInt(45) * 8.0},${(random.nextDouble() * 0.6 + 0.3) * 100}%,${(1 - (random.nextDouble() * 0.6 + 0.3)) * 100}%)";
  }
}

class Offering {
  String section;
  String room;
  String teacher;
  int enrollmentCapacity;
  Modality modality;
  Map<ScheduleDay, ScheduleTime> schedules;
  int classNumber;

  Offering({
    required this.section,
    this.room = '',
    this.teacher = '',
    this.enrollmentCapacity = 0,
    this.modality = Modality.hybrid,
    this.schedules = const {},
    this.classNumber = 0,
  });

  String toTimeinfo(String sec) => """<br/>
<b>$sec</b>
<small>$teacher</small><br/>
$room
${schedules.entries.fold("", (prev, element) => "$prev<br/>${element.key.name} ${element.value}")}
  """;

  String get building => room.substring(0,2);
}

enum Modality { hybrid, f2f, pol }

enum ScheduleDay { M, T, W, H, F, S }

class ScheduleTime {
  int start;
  int end;
  ScheduleTime(this.start, this.end);

  @override
  String toString() => "$start - $end";
}

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

import 'package:flutter/material.dart';

import 'classes.dart';

importTestSubjects(model) {
  for (var subject in debugSubjects) {
    model.addSubject(subject.first.subject, subject);
  }
}

/// These are subjects used for debug.
/// Have fun adding more :)
final debugSubjects = [
  [
    Offering(
      subject: 'FNAF101',
      section: 'EA1',
      scheduleDay: ScheduleDay.mondaythursdayFace,
      classNumber: 1,
      teacher: 'THE GAME THEORISTS',
      slotCapacity: 20,
      slotTaken: 21,
      scheduleTime: '0730 - 0900',
      scheduleTime2: '0730 - 0900',
    ),
    Offering(
      subject: 'FNAF101',
      section: 'EA2',
      scheduleDay: ScheduleDay.mondaythursdayFace,
      classNumber: 2,
      teacher: 'THE GAME THEORISTS',
      slotCapacity: 20,
      slotTaken: 23,
      scheduleTime: '0915 - 1030',
      scheduleTime2: '0915 - 1030',
    ),
    Offering(
      subject: 'FNAF101',
      section: 'EA3',
      scheduleDay: ScheduleDay.mondaythursdayFace,
      classNumber: 100,
      teacher: 'THE GAME THEORISTS',
      slotCapacity: 30,
      slotTaken: 23,
      scheduleTime: '1100 - 1230',
      scheduleTime2: '1100 - 1230',
    ),
    Offering(
      subject: 'FNAF101',
      section: 'EA4',
      scheduleDay: ScheduleDay.mondaythursdayFace,
      classNumber: 101,
      teacher: 'THE GAME THEORISTS',
      slotCapacity: 30,
      slotTaken: 23,
      scheduleTime: '1300 - 1530',
      scheduleTime2: '1300 - 1530',
    ),
    Offering(
      subject: 'FNAF101',
      section: 'EB1',
      scheduleDay: ScheduleDay.tuesdayfridayFace,
      classNumber: 3,
      teacher: 'FUHNAF',
      slotCapacity: 30,
      slotTaken: 0,
      scheduleTime: '0730 - 0900',
      scheduleTime2: '0730 - 0900',
    ),
    Offering(
      subject: 'FNAF101',
      section: 'EB2',
      scheduleDay: ScheduleDay.tuesdayfridayFace,
      classNumber: 2,
      teacher: 'FUHNAF',
      slotCapacity: 30,
      slotTaken: 22,
      room: 'AG1101',
      scheduleTime: '0900 - 1030',
      scheduleTime2: '0900 - 1030',
    ),
    Offering(
      subject: 'FNAF101',
      section: 'EC1',
      scheduleDay: ScheduleDay.wednesdaysaturdayFaceonline,
      classNumber: 5,
      teacher: 'RYETOAST',
      slotCapacity: 23,
      slotTaken: 20,
      room: 'AG1201',
      scheduleTime: '1245 - 1415',
      scheduleTime2: '1245 - 1415',
    ),
    Offering(
      subject: 'FNAF101',
      section: 'EC2',
      scheduleDay: ScheduleDay.wednesdaysaturdayFaceonline,
      classNumber: 6,
      teacher: 'RYETOAST',
      slotCapacity: 25,
      slotTaken: 9,
      room: 'SJ201',
      scheduleTime: '1415 - 1545',
      scheduleTime2: '1415 - 1545',
    ),
  ]..forEach((element) {
      element.color = Color(0xFFFFCDD2);
    }),
  [
    Offering(
      subject: 'TECHTIP',
      section: 'Y01',
      scheduleDay: ScheduleDay.mondayFace,
      classNumber: 7,
      teacher: 'LINUS TECH TIPS',
      slotCapacity: 35,
      slotTaken: 0,
      room: 'SJ221',
      scheduleTime: '0730 - 1200',
    ),
    Offering(
      subject: 'TECHTIP',
      section: 'Y02',
      scheduleDay: ScheduleDay.mondayFace,
      classNumber: 8,
      teacher: 'LINUS TECH TIPS',
      slotCapacity: 35,
      slotTaken: 0,
      room: 'SM201',
      scheduleTime: '1300 - 1730',
    ),
    Offering(
      subject: 'TECHTIP',
      section: 'Y03',
      scheduleDay: ScheduleDay.tuesdayFace,
      classNumber: 9,
      teacher: 'SHORTCIRCUIT',
      slotCapacity: 35,
      slotTaken: 17,
      room: 'SM201',
      scheduleTime: '0730 - 1200',
    ),
    Offering(
      subject: 'TECHTIP',
      section: 'Y04',
      scheduleDay: ScheduleDay.tuesdayFace,
      classNumber: 9,
      teacher: 'SHORTCIRCUIT',
      slotCapacity: 35,
      slotTaken: 17,
      room: 'LS202',
      scheduleTime: '1300 - 1730',
    ),
    Offering(
      subject: 'TECHTIP',
      section: 'Y05',
      scheduleDay: ScheduleDay.wednesdayFace,
      classNumber: 10,
      teacher: 'TECHQUICKIE',
      slotCapacity: 35,
      slotTaken: 17,
      room: 'SM201',
      scheduleTime: '0730 - 1200',
    ),
    Offering(
      subject: 'TECHTIP',
      section: 'Y06',
      scheduleDay: ScheduleDay.wednesdayFace,
      classNumber: 11,
      teacher: 'TECHQUICKIE',
      slotCapacity: 35,
      slotTaken: 17,
      room: 'LS221',
      scheduleTime: '1300 - 1730',
    ),
  ]..forEach((element) {
      element.color = Color(0xFFEBE7AD);
    }),
  [
    Offering(
      subject: 'STRWRS1',
      section: 'Z01',
      scheduleDay: ScheduleDay.mondaythursdayOnlineface,
      classNumber: 12,
      teacher: "DARTH'D",
      slotCapacity: 35,
      slotTaken: 16,
      room: 'VL301',
      scheduleTime: '1500 - 1700',
      scheduleTime2: '1500 - 1700',
    ),
    Offering(
      subject: 'STRWRS1',
      section: 'Z02',
      scheduleDay: ScheduleDay.mondaythursdayFaceonline,
      classNumber: 13,
      teacher: "DARTH'D",
      slotCapacity: 35,
      slotTaken: 9,
      scheduleTime: '1730 - 1930',
      scheduleTime2: '1730 - 1930',
    ),
    Offering(
      subject: 'STRWRS1',
      section: 'Z03',
      scheduleDay: ScheduleDay.thursdayOnline,
      classNumber: 14,
      teacher: "MAULER",
      slotCapacity: 35,
      slotTaken: 16,
      scheduleTime: '1300 - 1500',
    ),
    Offering(
      subject: 'STRWRS1',
      section: 'Z04',
      scheduleDay: ScheduleDay.saturdayOnline,
      classNumber: 15,
      teacher: "MAULER",
      slotCapacity: 40,
      slotTaken: 9,
      scheduleTime: '1300 - 1500',
    ),
    Offering(
      subject: 'STRWRS1',
      section: 'Z04',
      scheduleDay: ScheduleDay.fridayHybrid,
      classNumber: 16,
      teacher: "STAR WARS THEORY",
      slotCapacity: 15,
      slotTaken: 0,
      scheduleTime: '1900 - 2000',
    ),
  ]..forEach((element) {
      element.color = Color(0xFFD8CDF4);
    }),
  [
    Offering(
      subject: 'CLKBAIT',
      section: 'XX1',
      scheduleDay: ScheduleDay.tuesdayUnknown,
      classNumber: 16,
      teacher: "MR. BEAST",
      slotCapacity: 40,
      slotTaken: 50,
      scheduleTime: '0900 - 1015',
    ),
    Offering(
      subject: 'CLKBAIT',
      section: 'XX2',
      scheduleDay: ScheduleDay.wednesdayHybrid,
      classNumber: 17,
      teacher: "MR. BEAST",
      slotCapacity: 40,
      slotTaken: 50,
      scheduleTime: '0900 - 1015',
    ),
    Offering(
      subject: 'CLKBAIT',
      section: 'XX3',
      scheduleDay: ScheduleDay.tuesdayUnknown,
      classNumber: 18,
      teacher: "PEWDIEPIE",
      slotCapacity: 50,
      slotTaken: 50,
      scheduleTime: '1030 - 1200',
    ),
    Offering(
      subject: 'CLKBAIT',
      section: 'XX4',
      scheduleDay: ScheduleDay.saturdayHybrid,
      classNumber: 19,
      teacher: "PEWDIEPIE",
      slotCapacity: 50,
      slotTaken: 15,
      scheduleTime: '0900 - 1030',
    ),
    Offering(
      subject: 'CLKBAIT',
      section: 'XX5',
      scheduleDay: ScheduleDay.mondayUnknown,
      classNumber: 20,
      teacher: "JACKSFILMS",
      slotCapacity: 20,
      slotTaken: 15,
      scheduleTime: '1030 - 1200',
      scheduleTime2: '1030 - 1200',
    ),
    Offering(
      subject: 'CLKBAIT',
      section: 'XX6',
      scheduleDay: ScheduleDay.tuesdayUnknown,
      classNumber: 21,
      teacher: "JACKSFILMS",
      slotCapacity: 20,
      slotTaken: 12,
      scheduleTime: '1300 - 1430',
    ),
  ]..forEach((element) {
      element.color = Color(0xFFEFC9F8);
    }),
  [
    Offering(
      subject: 'LEGALYT',
      section: 'LE1',
      scheduleDay: ScheduleDay.wednesdayOnline,
      classNumber: 210,
      teacher: "LEGAL EAGLE",
      slotCapacity: 45,
      slotTaken: 18,
      scheduleTime: '1300 - 1530',
    ),
    Offering(
      subject: 'LEGALYT',
      section: 'LE2',
      scheduleDay: ScheduleDay.wednesdayOnline,
      classNumber: 210,
      teacher: "LEGAL EAGLE",
      slotCapacity: 45,
      slotTaken: 17,
      scheduleTime: '1000 - 1230',
    ),
  ]..forEach((element) {
      element.color = Color(0xFFE7B1B1);
    }),
];

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

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class _TlQPFluentLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _TlQPFluentLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode == 'tl' && locale.countryCode == 'QP';

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    final String localeName = Intl.canonicalizedLocale(locale.toString());

    late DateFormat fullYearFormat;
    late DateFormat dayFormat;
    late DateFormat mediumDateFormat;
    // We don't want any additional decoration here. The am/pm is handled in
    // the date picker. We just want an hour number localized.
    late DateFormat singleDigitHourFormat;
    late DateFormat singleDigitMinuteFormat;
    late DateFormat doubleDigitMinuteFormat;
    late DateFormat singleDigitSecondFormat;
    late NumberFormat decimalFormat;

    void loadFormats(String? locale) {
      fullYearFormat = DateFormat.y(locale);
      dayFormat = DateFormat.d(locale);
      mediumDateFormat = DateFormat.MMMEd(locale);
      // TODO(xster): fix when https://github.com/dart-lang/intl/issues/207 is resolved.
      singleDigitHourFormat = DateFormat('HH', locale);
      singleDigitMinuteFormat = DateFormat.m(locale);
      doubleDigitMinuteFormat = DateFormat('mm', locale);
      singleDigitSecondFormat = DateFormat.s(locale);
      decimalFormat = NumberFormat.decimalPattern(locale);
    }

    if (DateFormat.localeExists(localeName)) {
      loadFormats(localeName);
    } else if (DateFormat.localeExists(locale.languageCode)) {
      loadFormats(locale.languageCode);
    } else {
      loadFormats(null);
    }
    return SynchronousFuture<CupertinoLocalizations>(CupertinoLocalizationTlQP(
      fullYearFormat: fullYearFormat,
      dayFormat: dayFormat,
      mediumDateFormat: mediumDateFormat,
      singleDigitHourFormat: singleDigitHourFormat,
      singleDigitMinuteFormat: singleDigitMinuteFormat,
      doubleDigitMinuteFormat: doubleDigitMinuteFormat,
      singleDigitSecondFormat: singleDigitSecondFormat,
      decimalFormat: decimalFormat, 
      weekdayFormat: dayFormat, //TODO TEMP
    ));
  }

  @override
  bool shouldReload(old) => false;
}

/// The translations for Tagalog (Taglish).
class CupertinoLocalizationTlQP extends GlobalCupertinoLocalizations {
  /// Create an instance of the translation bundle for English.
  ///
  /// For details on the meaning of the arguments, see [GlobalCupertinoLocalizations].
  const CupertinoLocalizationTlQP({
    super.localeName = 'tl_QP',
    required super.fullYearFormat,
    required super.dayFormat,
    required super.mediumDateFormat,
    required super.singleDigitHourFormat,
    required super.singleDigitMinuteFormat,
    required super.doubleDigitMinuteFormat,
    required super.singleDigitSecondFormat,
    required super.decimalFormat, 
    required super.weekdayFormat,
  });

  
  
  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _TlQPFluentLocalizationsDelegate();

  @override
  String get alertDialogLabel => 'Alert';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get copyButtonLabel => 'I-copy';

  @override
  String get cutButtonLabel => 'I-cut';

  @override
  String get datePickerDateOrderString => 'mdy';

  @override
  String get datePickerDateTimeOrderString => 'date_time_dayPeriod';

  @override
  String? get datePickerHourSemanticsLabelFew => null;

  @override
  String? get datePickerHourSemanticsLabelMany => null;

  @override
  String? get datePickerHourSemanticsLabelOne => r"$hour o'clock";

  @override
  String get datePickerHourSemanticsLabelOther => r"$hour o'clock";

  @override
  String? get datePickerHourSemanticsLabelTwo => null;

  @override
  String? get datePickerHourSemanticsLabelZero => null;

  @override
  String? get datePickerMinuteSemanticsLabelFew => null;

  @override
  String? get datePickerMinuteSemanticsLabelMany => null;

  @override
  String? get datePickerMinuteSemanticsLabelOne => '1 minute';

  @override
  String get datePickerMinuteSemanticsLabelOther => r'$minute minutes';

  @override
  String? get datePickerMinuteSemanticsLabelTwo => null;

  @override
  String? get datePickerMinuteSemanticsLabelZero => null;

  @override
  String get modalBarrierDismissLabel => 'I-dismiss';

  @override
  String get noSpellCheckReplacementsLabel => 'Walang Replacements na Nahanap';

  @override
  String get pasteButtonLabel => 'I-paste';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get searchTextFieldPlaceholderLabel => 'Mag-search';

  @override
  String get selectAllButtonLabel => 'I-select lahat';

  @override
  String get tabSemanticsLabelRaw => r'Tab $tabIndex of $tabCount';

  @override
  String? get timerPickerHourLabelFew => null;

  @override
  String? get timerPickerHourLabelMany => null;

  @override
  String? get timerPickerHourLabelOne => 'hour';

  @override
  String get timerPickerHourLabelOther => 'hours';

  @override
  String? get timerPickerHourLabelTwo => null;

  @override
  String? get timerPickerHourLabelZero => null;

  @override
  String? get timerPickerMinuteLabelFew => null;

  @override
  String? get timerPickerMinuteLabelMany => null;

  @override
  String? get timerPickerMinuteLabelOne => 'min.';

  @override
  String get timerPickerMinuteLabelOther => 'min.';

  @override
  String? get timerPickerMinuteLabelTwo => null;

  @override
  String? get timerPickerMinuteLabelZero => null;

  @override
  String? get timerPickerSecondLabelFew => null;

  @override
  String? get timerPickerSecondLabelMany => null;

  @override
  String? get timerPickerSecondLabelOne => 'sec.';

  @override
  String get timerPickerSecondLabelOther => 'sec.';

  @override
  String? get timerPickerSecondLabelTwo => null;

  @override
  String? get timerPickerSecondLabelZero => null;

  @override
  String get todayLabel => 'Today';
  
  @override
  String get lookUpButtonLabel => 'Mag-look Up';
  
  @override
  String get menuDismissLabel => 'I-dismiss ang menu';
  
  @override
  String get searchWebButtonLabel => 'I-search sa Web';
  
  @override
  String get shareButtonLabel => 'I-share...';
  
  @override
  String get clearButtonLabel => 'I-clear';
}

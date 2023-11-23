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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/intl.dart';


class _TlQPMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _TlQPMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tl' && locale.countryCode == 'QP';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    final String localeName = Intl.canonicalizedLocale("tl_QP");

    // The locale needs to be initialized into the custom
    // date symbols and patterns setup that Flutter uses.
    initializeDateFormattingCustom(
      locale: localeName,
      patterns: _patterns_tlQP,
      symbols: _symbols_tlQP,
    );

    return SynchronousFuture<MaterialLocalizations>(
      MaterialLocalizationTlQP(
        localeName: localeName,
        // The `intl` library's NumberFormat class is generated from CLDR data
        // (see https://github.com/dart-lang/i18n/blob/main/pkgs/intl/lib/number_symbols_data.dart).
        // Unfortunately, there is no way to use a locale that isn't defined in
        // this map and the only way to work around this is to use a listed
        // locale's NumberFormat symbols. So, here we use the number formats
        // for 'en_US' instead.
        decimalFormat: NumberFormat('#,##0.###', 'en_US'),
        twoDigitZeroPaddedFormat: NumberFormat('00', 'en_US'),
        // DateFormat here will use the symbols and patterns provided in the
        // `date_symbol_data_custom.initializeDateFormattingCustom` call above.
        // However, an alternative is to simply use a supported locale's
        // DateFormat symbols, similar to NumberFormat above.
        fullYearFormat: DateFormat('y', localeName),
        compactDateFormat: DateFormat('yMd', localeName),
        shortDateFormat: DateFormat('yMMMd', localeName),
        mediumDateFormat: DateFormat('EEE, MMM d', localeName),
        longDateFormat: DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: DateFormat('MMMM y', localeName),
        shortMonthDayFormat: DateFormat('MMM d'),
      ),
    );
  }

  @override
  bool shouldReload(_TlQPMaterialLocalizationsDelegate old) => false;
}


/// We hard-code the locale data for en_US here so that there's at least one
/// locale always available.
final DateSymbols _symbols_tlQP = DateSymbols(
    NAME: 'tl_QP',
    ERAS: const ['BC', 'AD'],
    ERANAMES: const ['Before Christ', 'Anno Domini'],
    NARROWMONTHS: const [
      'J',
      'F',
      'M',
      'A',
      'M',
      'J',
      'J',
      'A',
      'S',
      'O',
      'N',
      'D'
    ],
    STANDALONENARROWMONTHS: const [
      'J',
      'F',
      'M',
      'A',
      'M',
      'J',
      'J',
      'A',
      'S',
      'O',
      'N',
      'D'
    ],
    MONTHS: const [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ],
    STANDALONEMONTHS: const [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ],
    SHORTMONTHS: const [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ],
    STANDALONESHORTMONTHS: const [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ],
    WEEKDAYS: const [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ],
    STANDALONEWEEKDAYS: const [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ],
    SHORTWEEKDAYS: const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
    STANDALONESHORTWEEKDAYS: const [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat'
    ],
    NARROWWEEKDAYS: const ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
    STANDALONENARROWWEEKDAYS: const ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
    SHORTQUARTERS: const ['Q1', 'Q2', 'Q3', 'Q4'],
    QUARTERS: const [
      '1st quarter',
      '2nd quarter',
      '3rd quarter',
      '4th quarter'
    ],
    AMPMS: const ['AM', 'PM'],
    DATEFORMATS: const ['EEEE, MMMM d, y', 'MMMM d, y', 'MMM d, y', 'M/d/yy'],
    TIMEFORMATS: const ['h:mm:ss a zzzz', 'h:mm:ss a z', 'h:mm:ss a', 'h:mm a'],
    FIRSTDAYOFWEEK: 6,
    WEEKENDRANGE: const [5, 6],
    FIRSTWEEKCUTOFFDAY: 5,
    DATETIMEFORMATS: const [
      '{1}, {0}',
      '{1}, {0}',
      '{1}, {0}',
      '{1}, {0}',
    ]);

// ignore: constant_identifier_names
const Map<String, String> _patterns_tlQP = {
  'd': 'd', // DAY
  'E': 'ccc', // ABBR_WEEKDAY
  'EEEE': 'cccc', // WEEKDAY
  'LLL': 'LLL', // ABBR_STANDALONE_MONTH
  'LLLL': 'LLLL', // STANDALONE_MONTH
  'M': 'L', // NUM_MONTH
  'Md': 'M/d', // NUM_MONTH_DAY
  'MEd': 'EEE, M/d', // NUM_MONTH_WEEKDAY_DAY
  'MMM': 'LLL', // ABBR_MONTH
  'MMMd': 'MMM d', // ABBR_MONTH_DAY
  'MMMEd': 'EEE, MMM d', // ABBR_MONTH_WEEKDAY_DAY
  'MMMM': 'LLLL', // MONTH
  'MMMMd': 'MMMM d', // MONTH_DAY
  'MMMMEEEEd': 'EEEE, MMMM d', // MONTH_WEEKDAY_DAY
  'QQQ': 'QQQ', // ABBR_QUARTER
  'QQQQ': 'QQQQ', // QUARTER
  'y': 'y', // YEAR
  'yM': 'M/y', // YEAR_NUM_MONTH
  'yMd': 'M/d/y', // YEAR_NUM_MONTH_DAY
  'yMEd': 'EEE, M/d/y', // YEAR_NUM_MONTH_WEEKDAY_DAY
  'yMMM': 'MMM y', // YEAR_ABBR_MONTH
  'yMMMd': 'MMM d, y', // YEAR_ABBR_MONTH_DAY
  'yMMMEd': 'EEE, MMM d, y', // YEAR_ABBR_MONTH_WEEKDAY_DAY
  'yMMMM': 'MMMM y', // YEAR_MONTH
  'yMMMMd': 'MMMM d, y', // YEAR_MONTH_DAY
  'yMMMMEEEEd': 'EEEE, MMMM d, y', // YEAR_MONTH_WEEKDAY_DAY
  'yQQQ': 'QQQ y', // YEAR_ABBR_QUARTER
  'yQQQQ': 'QQQQ y', // YEAR_QUARTER
  'H': 'HH', // HOUR24
  'Hm': 'HH:mm', // HOUR24_MINUTE
  'Hms': 'HH:mm:ss', // HOUR24_MINUTE_SECOND
  'j': 'h a', // HOUR
  'jm': 'h:mm a', // HOUR_MINUTE
  'jms': 'h:mm:ss a', // HOUR_MINUTE_SECOND
  'jmv': 'h:mm a v', // HOUR_MINUTE_GENERIC_TZ
  'jmz': 'h:mm a z', // HOUR_MINUTETZ
  'jz': 'h a z', // HOURGENERIC_TZ
  'm': 'm', // MINUTE
  'ms': 'mm:ss', // MINUTE_SECOND
  's': 's', // SECOND
  'v': 'v', // ABBR_GENERIC_TZ
  'z': 'z', // ABBR_SPECIFIC_TZ
  'zzzz': 'zzzz', // SPECIFIC_TZ
  'ZZZZ': 'ZZZZ' // ABBR_UTC_TZ
};


/// The translations for Tagalog (Taglish).
class MaterialLocalizationTlQP extends GlobalMaterialLocalizations {
  /// Create an instance of the translation bundle for English.
  ///
  /// For details on the meaning of the arguments, see [GlobalMaterialLocalizations].
  const MaterialLocalizationTlQP({
    super.localeName = 'tl_QP',
    required super.fullYearFormat,
    required super.compactDateFormat,
    required super.shortDateFormat,
    required super.mediumDateFormat,
    required super.longDateFormat,
    required super.yearMonthFormat,
    required super.shortMonthDayFormat,
    required super.decimalFormat,
    required super.twoDigitZeroPaddedFormat,
  });

  
  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _TlQPMaterialLocalizationsDelegate();

  @override
  String get aboutListTileTitleRaw => r'About $applicationName';

  @override
  String get alertDialogLabel => 'Alert';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get backButtonTooltip => 'Back';

  @override
  String get bottomSheetLabel => 'Bottom Sheet';

  @override
  String get calendarModeButtonLabel => 'Switch to calendar';

  @override
  String get cancelButtonLabel => "I-cancel";

  @override
  String get closeButtonLabel => 'I-close';

  @override
  String get closeButtonTooltip => 'I-close';

  @override
  String get collapsedHint => 'I-expand';

  @override
  String get collapsedIconTapHint => 'I-expand';

  @override
  String get continueButtonLabel => 'Mag-continue';

  @override
  String get copyButtonLabel => 'I-copy';

  @override
  String get currentDateLabel => 'Ngayon';

  @override
  String get cutButtonLabel => 'I-cut';

  @override
  String get dateHelpText => 'mm/dd/yyyy';

  @override
  String get dateInputLabel => 'I-enter ang date';

  @override
  String get dateOutOfRangeLabel => 'Wala sa range.';

  @override
  String get datePickerHelpText => 'I-select ang date';

  @override
  String get dateRangeEndDateSemanticLabelRaw => r'End date $fullDate';

  @override
  String get dateRangeEndLabel => 'End Date';

  @override
  String get dateRangePickerHelpText => 'I-select ang range';

  @override
  String get dateRangeStartDateSemanticLabelRaw => r'Start date $fullDate';

  @override
  String get dateRangeStartLabel => 'Start Date';

  @override
  String get dateSeparator => '/';

  @override
  String get deleteButtonTooltip => 'I-delete';

  @override
  String get dialModeButtonLabel => 'Mag-switch sa dial picker mode';

  @override
  String get dialogLabel => 'Dialog';

  @override
  String get drawerLabel => 'Navigation menu';

  @override
  String get expandedHint => 'Na-collapse';

  @override
  String get expandedIconTapHint => 'I-collapse';

  @override
  String get expansionTileCollapsedHint => 'double tap para i-expand';

  @override
  String get expansionTileCollapsedTapHint => 'I-expand para sa mas maraming details';

  @override
  String get expansionTileExpandedHint => 'double tap para i-collapse';

  @override
  String get expansionTileExpandedTapHint => 'I-ollapse';

  @override
  String get firstPageTooltip => 'Unang page';

  @override
  String get hideAccountsLabel => 'I-hide ang accounts';

  @override
  String get inputDateModeButtonLabel => 'Mag-switch sa input';

  @override
  String get inputTimeModeButtonLabel => 'Mag-switch to text input mode';

  @override
  String get invalidDateFormatLabel => 'Invalid ang format.';

  @override
  String get invalidDateRangeLabel => 'Invalid ang range.';

  @override
  String get invalidTimeLabel => 'Mag-enter ng valid na oras';

  @override
  String get keyboardKeyAlt => 'Alt';

  @override
  String get keyboardKeyAltGraph => 'AltGr';

  @override
  String get keyboardKeyBackspace => 'Backspace';

  @override
  String get keyboardKeyCapsLock => 'Caps Lock';

  @override
  String get keyboardKeyChannelDown => 'Channel Down';

  @override
  String get keyboardKeyChannelUp => 'Channel Up';

  @override
  String get keyboardKeyControl => 'Ctrl';

  @override
  String get keyboardKeyDelete => 'Del';

  @override
  String get keyboardKeyEject => 'Eject';

  @override
  String get keyboardKeyEnd => 'End';

  @override
  String get keyboardKeyEscape => 'Esc';

  @override
  String get keyboardKeyFn => 'Fn';

  @override
  String get keyboardKeyHome => 'Home';

  @override
  String get keyboardKeyInsert => 'Insert';

  @override
  String get keyboardKeyMeta => 'Meta';

  @override
  String get keyboardKeyMetaMacOs => 'Command';

  @override
  String get keyboardKeyMetaWindows => 'Win';

  @override
  String get keyboardKeyNumLock => 'Num Lock';

  @override
  String get keyboardKeyNumpad0 => 'Num 0';

  @override
  String get keyboardKeyNumpad1 => 'Num 1';

  @override
  String get keyboardKeyNumpad2 => 'Num 2';

  @override
  String get keyboardKeyNumpad3 => 'Num 3';

  @override
  String get keyboardKeyNumpad4 => 'Num 4';

  @override
  String get keyboardKeyNumpad5 => 'Num 5';

  @override
  String get keyboardKeyNumpad6 => 'Num 6';

  @override
  String get keyboardKeyNumpad7 => 'Num 7';

  @override
  String get keyboardKeyNumpad8 => 'Num 8';

  @override
  String get keyboardKeyNumpad9 => 'Num 9';

  @override
  String get keyboardKeyNumpadAdd => 'Num +';

  @override
  String get keyboardKeyNumpadComma => 'Num ,';

  @override
  String get keyboardKeyNumpadDecimal => 'Num .';

  @override
  String get keyboardKeyNumpadDivide => 'Num /';

  @override
  String get keyboardKeyNumpadEnter => 'Num Enter';

  @override
  String get keyboardKeyNumpadEqual => 'Num =';

  @override
  String get keyboardKeyNumpadMultiply => 'Num *';

  @override
  String get keyboardKeyNumpadParenLeft => 'Num (';

  @override
  String get keyboardKeyNumpadParenRight => 'Num )';

  @override
  String get keyboardKeyNumpadSubtract => 'Num -';

  @override
  String get keyboardKeyPageDown => 'PgDown';

  @override
  String get keyboardKeyPageUp => 'PgUp';

  @override
  String get keyboardKeyPower => 'Power';

  @override
  String get keyboardKeyPowerOff => 'Power Off';

  @override
  String get keyboardKeyPrintScreen => 'Print Screen';

  @override
  String get keyboardKeyScrollLock => 'Scroll Lock';

  @override
  String get keyboardKeySelect => 'Select';

  @override
  String get keyboardKeyShift => 'Shift';

  @override
  String get keyboardKeySpace => 'Space';

  @override
  String get lastPageTooltip => 'Huling page';

  @override
  String? get licensesPackageDetailTextFew => null;

  @override
  String? get licensesPackageDetailTextMany => null;

  @override
  String? get licensesPackageDetailTextOne => '1 license';

  @override
  String get licensesPackageDetailTextOther => r'$licenseCount (na) license';

  @override
  String? get licensesPackageDetailTextTwo => null;

  @override
  String? get licensesPackageDetailTextZero => 'Walang license';

  @override
  String get licensesPageTitle => 'Mga License';

  @override
  String get menuBarMenuLabel => 'Menu bar menu';

  @override
  String get modalBarrierDismissLabel => 'I-dismiss';

  @override
  String get moreButtonTooltip => 'More';

  @override
  String get nextMonthTooltip => 'Next month';

  @override
  String get nextPageTooltip => 'Next na page';

  @override
  String get okButtonLabel => 'OK';

  @override
  String get openAppDrawerTooltip => 'I-open ang navigation menu';

  @override
  String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow ng $rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw => r'$firstRow–$lastRow ng mahigit-$rowCount';

  @override
  String get pasteButtonLabel => 'I-paste';

  @override
  String get popupMenuLabel => 'Popup na menu';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get previousMonthTooltip => 'Previous na month';

  @override
  String get previousPageTooltip => 'Previous na page';

  @override
  String get refreshIndicatorSemanticLabel => 'I-refresh';

  @override
  String? get remainingTextFieldCharacterCountFew => null;

  @override
  String? get remainingTextFieldCharacterCountMany => null;

  @override
  String? get remainingTextFieldCharacterCountOne => '1 natitirang character';

  @override
  String get remainingTextFieldCharacterCountOther => r'$remainingCount natitirang characters';

  @override
  String? get remainingTextFieldCharacterCountTwo => null;

  @override
  String? get remainingTextFieldCharacterCountZero => 'Walang natitirang character';

  @override
  String get reorderItemDown => 'I-move pababa';

  @override
  String get reorderItemLeft => 'I-move pakaliwa';

  @override
  String get reorderItemRight => 'I-move pakanan';

  @override
  String get reorderItemToEnd => 'I-move sa end';

  @override
  String get reorderItemToStart => 'I-move sa start';

  @override
  String get reorderItemUp => 'I-move sa taas';

  @override
  String get rowsPerPageTitle => 'Rows kada page:';

  @override
  String get saveButtonLabel => 'I-save';

  @override
  String get scanTextButtonLabel => 'I-scan ang text';

  @override
  String get scrimLabel => 'Scrim';

  @override
  String get scrimOnTapHintRaw => r'I-close ang $modalRouteContentName';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => 'Mag-search';

  @override
  String get selectAllButtonLabel => 'I-select all';

  @override
  String get selectYearSemanticsLabel => 'I-select ang taon';

  @override
  String? get selectedRowCountTitleFew => null;

  @override
  String? get selectedRowCountTitleMany => null;

  @override
  String? get selectedRowCountTitleOne => '1 item ang selected';

  @override
  String get selectedRowCountTitleOther => r'$selectedRowCount items ang selected';

  @override
  String? get selectedRowCountTitleTwo => null;

  @override
  String? get selectedRowCountTitleZero => 'Walang item ang selected';

  @override
  String get showAccountsLabel => 'I-show ang accounts';

  @override
  String get showMenuTooltip => 'I-show ang menu';

  @override
  String get signedInLabel => 'Naka-signed in';

  @override
  String get tabLabelRaw => r'Tab $tabIndex ng $tabCount';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;

  @override
  String get timePickerDialHelpText => 'I-select ang time';

  @override
  String get timePickerHourLabel => 'Oras';

  @override
  String get timePickerHourModeAnnouncement => 'I-select ang oras';

  @override
  String get timePickerInputHelpText => 'I-enter ang oras';

  @override
  String get timePickerMinuteLabel => 'Minuto';

  @override
  String get timePickerMinuteModeAnnouncement => 'I-select ang minuto:';

  @override
  String get unspecifiedDate => 'Date';

  @override
  String get unspecifiedDateRange => 'Date Range';

  @override
  String get viewLicensesButtonLabel => 'I-view ang licenses';
  
  @override
  String get lookUpButtonLabel => 'Mag-look Up';
  
  @override
  String get menuDismissLabel => 'I-dismiss ang menu';
  
  @override
  String get searchWebButtonLabel => 'I-search sa Web';
  
  @override
  String get shareButtonLabel => 'I-share...';
}

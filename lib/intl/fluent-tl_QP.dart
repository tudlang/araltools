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


import 'package:fluent_ui/l10n/generated/fluent_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _TlQPFluentLocalizationsDelegate
    extends LocalizationsDelegate<FluentLocalizations> {
  const _TlQPFluentLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tl' && locale.countryCode == 'QP';

@override
  Future<FluentLocalizations> load(Locale locale) {
    return SynchronousFuture<FluentLocalizations>(
        FluentLocalizationsTlQP());
  }

  
  @override
  bool shouldReload(old) => false;
}

/// The translations for Tagalog (Taglish).
class FluentLocalizationsTlQP extends FluentLocalizations {
  FluentLocalizationsTlQP([String locale = 'tl_QP']) : super(locale);

  static const LocalizationsDelegate<FluentLocalizations> delegate =
      _TlQPFluentLocalizationsDelegate();

  @override
  String get backButtonTooltip => 'Back';

  @override
  String get closeButtonLabel => 'I-close';

  @override
  String get searchLabel => 'Mag-search';

  @override
  String get closeNavigationTooltip => 'I-close ang navigation';

  @override
  String get openNavigationTooltip => 'I-open ang navigation';

  @override
  String get clickToSearch => 'I-click para mag-search';

  @override
  String get modalBarrierDismissLabel => 'I-dismiss';

  @override
  String get minimizeWindowTooltip => 'I-minimize';

  @override
  String get restoreWindowTooltip => 'I-restore';

  @override
  String get closeWindowTooltip => 'I-close';

  @override
  String get dialogLabel => 'Dialog';

  @override
  String get cutActionLabel => 'I-cut';

  @override
  String get copyActionLabel => 'I-copy';

  @override
  String get pasteActionLabel => 'I-paste';

  @override
  String get selectAllActionLabel => 'I-select lahat';

  @override
  String get newTabLabel => 'Magdagdag ng new tab';

  @override
  String get closeTabLabelSuffix => 'I-close ang tab';

  @override
  String get scrollTabBackwardLabel => 'I-scroll ang tab list pa-forward';

  @override
  String get scrollTabForwardLabel => 'I-scroll ang tab list pa-backward';

  @override
  String get noResultsFoundLabel => 'Walang nahanap na results';

  @override
  String get copyActionTooltip => 'I-copy ang selected content sa clipboard';

  @override
  String get cutActionTooltip =>
      'I-remove ang selected content at ipunta sa clipboard';

  @override
  String get pasteActionTooltip =>
      'I-insert ang contents ng clipboard sa current location';

  @override
  String get selectAllActionTooltip => 'I-select ang all content';

  @override
  String get hour => 'hour';

  @override
  String get minute => 'minute';

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get month => 'month';

  @override
  String get day => 'day';

  @override
  String get year => 'year';

  @override //TODO TEMPORARY
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

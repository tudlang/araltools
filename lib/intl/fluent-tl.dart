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


import 'package:fluent_ui/l10n/generated/fluent_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _TlFluentLocalizationsDelegate
    extends LocalizationsDelegate<FluentLocalizations> {
  const _TlFluentLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tl';

@override
  Future<FluentLocalizations> load(Locale locale) {
    return SynchronousFuture<FluentLocalizations>(
        FluentLocalizationsTl());
  }

  
  @override
  bool shouldReload(old) => false;
}

/// The translations for Tagalog (Taglish).
class FluentLocalizationsTl extends FluentLocalizations {
  FluentLocalizationsTl([String locale = 'tl']) : super(locale);

  static const LocalizationsDelegate<FluentLocalizations> delegate =
      _TlFluentLocalizationsDelegate();

  @override
  String get backButtonTooltip => 'Bumalik';

  @override
  String get closeButtonLabel => 'Isara';

  @override
  String get searchLabel => 'Maghanap';

  @override
  String get closeNavigationTooltip => 'Isara ang nabigasyon';

  @override
  String get openNavigationTooltip => 'Buksan ang nabigasyon';

  @override
  String get clickToSearch => 'I-klik para mag-hanap';

  @override
  String get modalBarrierDismissLabel => 'I-dismiss';

  @override
  String get minimizeWindowTooltip => 'I-minimize';

  @override
  String get restoreWindowTooltip => 'I-restore';

  @override
  String get closeWindowTooltip => 'Isara';

  @override
  String get dialogLabel => 'Dialog';

  @override
  String get cutActionLabel => 'Gupitin';

  @override
  String get copyActionLabel => 'Kopyahin';

  @override
  String get pasteActionLabel => 'I-paste';

  @override
  String get selectAllActionLabel => 'Selektahin lahat';

  @override
  String get newTabLabel => 'Magdagdag ng panibagong tab';

  @override
  String get closeTabLabelSuffix => 'Isara ang tab';

  @override
  String get scrollTabBackwardLabel => 'I-scroll ang listahan ng tab paharap';

  @override
  String get scrollTabForwardLabel => 'I-scroll ang listahan ng pabalik';

  @override
  String get noResultsFoundLabel => 'Walang nahanap na resulta';

  @override
  String get copyActionTooltip => 'Kopyahin ang nakaselektang nilalaman sa clipboard';

  @override
  String get cutActionTooltip =>
      'Tanggalin ang nakaselektang nilalaman at ipunta sa clipboard';

  @override
  String get pasteActionTooltip =>
      'Ilagay ang nilalaman ng clipboard sa kasalukuyang lokasyon';

  @override
  String get selectAllActionTooltip => 'Selektahin ang lahat ng nilalaman';

  @override
  String get hour => 'oras';

  @override
  String get minute => 'minuto';

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get month => 'buwan';

  @override
  String get day => 'araw';

  @override
  String get year => 'taon';

  @override //TODO TEMPORARY
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

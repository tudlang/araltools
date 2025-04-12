///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsTlQp extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTlQp({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tlQp,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tl-QP>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsTlQp _root = this; // ignore: unused_field

	@override 
	TranslationsTlQp $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTlQp(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsGeneralTlQp general = _TranslationsGeneralTlQp._(_root);
	@override late final _TranslationsSkedmakerTlQp skedmaker = _TranslationsSkedmakerTlQp._(_root);
}

// Path: general
class _TranslationsGeneralTlQp extends TranslationsGeneralEn {
	_TranslationsGeneralTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsGeneralAppTlQp app = _TranslationsGeneralAppTlQp._(_root);
	@override late final _TranslationsGeneralHomeTlQp home = _TranslationsGeneralHomeTlQp._(_root);
	@override late final _TranslationsGeneralDrawerTlQp drawer = _TranslationsGeneralDrawerTlQp._(_root);
	@override late final _TranslationsGeneralFunctionsTlQp functions = _TranslationsGeneralFunctionsTlQp._(_root);
	@override late final _TranslationsGeneralGeneralTlQp general = _TranslationsGeneralGeneralTlQp._(_root);
}

// Path: skedmaker
class _TranslationsSkedmakerTlQp extends TranslationsSkedmakerEn {
	_TranslationsSkedmakerTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerInfoTlQp info = _TranslationsSkedmakerInfoTlQp._(_root);
	@override late final _TranslationsSkedmakerDrawerTlQp drawer = _TranslationsSkedmakerDrawerTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsTlQp subjects = _TranslationsSkedmakerSubjectsTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersTlQp filters = _TranslationsSkedmakerFiltersTlQp._(_root);
	@override late final _TranslationsSkedmakerSchedulesTlQp schedules = _TranslationsSkedmakerSchedulesTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTlQp scheduleDay = _TranslationsSkedmakerScheduleDayTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleRoomTlQp scheduleRoom = _TranslationsSkedmakerScheduleRoomTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDefaultTlQp scheduleDefault = _TranslationsSkedmakerScheduleDefaultTlQp._(_root);
	@override String get mlsCourseOfferings => 'My.LaSalle\'s Course Offerings';
	@override late final _TranslationsSkedmakerInfobarTlQp infobar = _TranslationsSkedmakerInfobarTlQp._(_root);
}

// Path: general.app
class _TranslationsGeneralAppTlQp extends TranslationsGeneralAppEn {
	_TranslationsGeneralAppTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'AralTools';
}

// Path: general.home
class _TranslationsGeneralHomeTlQp extends TranslationsGeneralHomeEn {
	_TranslationsGeneralHomeTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Home';
	@override String get welcome => 'Welcome!';
	@override late final _TranslationsGeneralHomeMoreTlQp more = _TranslationsGeneralHomeMoreTlQp._(_root);
}

// Path: general.drawer
class _TranslationsGeneralDrawerTlQp extends TranslationsGeneralDrawerEn {
	_TranslationsGeneralDrawerTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsGeneralDrawerAboutTlQp about = _TranslationsGeneralDrawerAboutTlQp._(_root);
	@override late final _TranslationsGeneralDrawerSupportTlQp support = _TranslationsGeneralDrawerSupportTlQp._(_root);
	@override late final _TranslationsGeneralDrawerGithubTlQp github = _TranslationsGeneralDrawerGithubTlQp._(_root);
	@override late final _TranslationsGeneralDrawerBugsTlQp bugs = _TranslationsGeneralDrawerBugsTlQp._(_root);
	@override late final _TranslationsGeneralDrawerLanguageTlQp language = _TranslationsGeneralDrawerLanguageTlQp._(_root);
}

// Path: general.functions
class _TranslationsGeneralFunctionsTlQp extends TranslationsGeneralFunctionsEn {
	_TranslationsGeneralFunctionsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsGeneralFunctionsBackToHomeTlQp backToHome = _TranslationsGeneralFunctionsBackToHomeTlQp._(_root);
	@override late final _TranslationsGeneralFunctionsNewProjectTlQp newProject = _TranslationsGeneralFunctionsNewProjectTlQp._(_root);
}

// Path: general.general
class _TranslationsGeneralGeneralTlQp extends TranslationsGeneralGeneralEn {
	_TranslationsGeneralGeneralTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get go => 'Go';
	@override String get ok => 'OK';
	@override late final _TranslationsGeneralGeneralOpenTlQp open = _TranslationsGeneralGeneralOpenTlQp._(_root);
	@override String get delete => 'I-delete';
	@override String get add => 'I-add';
	@override String get select => 'I-select';
	@override String get save => 'I-save';
	@override String get saveDont => '\'Wag i-save';
	@override late final _TranslationsGeneralGeneralSaveAsTlQp saveAs = _TranslationsGeneralGeneralSaveAsTlQp._(_root);
	@override String get cancel => 'I-cancel';
	@override String get resume => 'I-resume';
	@override String get pause => 'I-pause';
	@override String get stop => 'I-stop';
	@override String get close => 'I-close';
	@override String get rename => 'I-rename';
	@override String get copy => 'I-copy';
	@override String get new_ => 'New';
	@override String get moreInfo => 'More info';
	@override String get proceed => 'Mag-proceed';
}

// Path: skedmaker.info
class _TranslationsSkedmakerInfoTlQp extends TranslationsSkedmakerInfoEn {
	_TranslationsSkedmakerInfoTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'SkedMaker';
	@override String get nameFull => '${_root.general.app.name} ${_root.skedmaker.info.name}';
	@override String get desc => 'Ang automatic na class schedule maker para sa DLSU students';
}

// Path: skedmaker.drawer
class _TranslationsSkedmakerDrawerTlQp extends TranslationsSkedmakerDrawerEn {
	_TranslationsSkedmakerDrawerTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerDrawerFileLocationTlQp fileLocation = _TranslationsSkedmakerDrawerFileLocationTlQp._(_root);
}

// Path: skedmaker.subjects
class _TranslationsSkedmakerSubjectsTlQp extends TranslationsSkedmakerSubjectsEn {
	_TranslationsSkedmakerSubjectsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Subjects';
	@override late final _TranslationsSkedmakerSubjectsAddTlQp add = _TranslationsSkedmakerSubjectsAddTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTlQp subject = _TranslationsSkedmakerSubjectsSubjectTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsEmptyTlQp empty = _TranslationsSkedmakerSubjectsEmptyTlQp._(_root);
}

// Path: skedmaker.filters
class _TranslationsSkedmakerFiltersTlQp extends TranslationsSkedmakerFiltersEn {
	_TranslationsSkedmakerFiltersTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Filters';
	@override late final _TranslationsSkedmakerFiltersCategoriesTlQp categories = _TranslationsSkedmakerFiltersCategoriesTlQp._(_root);
	@override String get any => 'Any na subject';
	@override String get reset => 'I-reset lahat';
}

// Path: skedmaker.schedules
class _TranslationsSkedmakerSchedulesTlQp extends TranslationsSkedmakerSchedulesEn {
	_TranslationsSkedmakerSchedulesTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Schedules';
	@override late final _TranslationsSkedmakerSchedulesGenerateTlQp generate = _TranslationsSkedmakerSchedulesGenerateTlQp._(_root);
	@override late final _TranslationsSkedmakerSchedulesCommandbarTlQp commandbar = _TranslationsSkedmakerSchedulesCommandbarTlQp._(_root);
	@override late final _TranslationsSkedmakerSchedulesDetailsTlQp details = _TranslationsSkedmakerSchedulesDetailsTlQp._(_root);
	@override late final _TranslationsSkedmakerSchedulesInfoTlQp info = _TranslationsSkedmakerSchedulesInfoTlQp._(_root);
	@override late final _TranslationsSkedmakerSchedulesOptionsTlQp options = _TranslationsSkedmakerSchedulesOptionsTlQp._(_root);
}

// Path: skedmaker.scheduleDay
class _TranslationsSkedmakerScheduleDayTlQp extends TranslationsSkedmakerScheduleDayEn {
	_TranslationsSkedmakerScheduleDayTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerScheduleDayMondayFaceTlQp mondayFace = _TranslationsSkedmakerScheduleDayMondayFaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondayOnlineTlQp mondayOnline = _TranslationsSkedmakerScheduleDayMondayOnlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondayHybridTlQp mondayHybrid = _TranslationsSkedmakerScheduleDayMondayHybridTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondayUnknownTlQp mondayUnknown = _TranslationsSkedmakerScheduleDayMondayUnknownTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayFaceTlQp tuesdayFace = _TranslationsSkedmakerScheduleDayTuesdayFaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayOnlineTlQp tuesdayOnline = _TranslationsSkedmakerScheduleDayTuesdayOnlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayHybridTlQp tuesdayHybrid = _TranslationsSkedmakerScheduleDayTuesdayHybridTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayUnknownTlQp tuesdayUnknown = _TranslationsSkedmakerScheduleDayTuesdayUnknownTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdayFaceTlQp wednesdayFace = _TranslationsSkedmakerScheduleDayWednesdayFaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdayOnlineTlQp wednesdayOnline = _TranslationsSkedmakerScheduleDayWednesdayOnlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdayHybridTlQp wednesdayHybrid = _TranslationsSkedmakerScheduleDayWednesdayHybridTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdayUnknownTlQp wednesdayUnknown = _TranslationsSkedmakerScheduleDayWednesdayUnknownTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayThursdayFaceTlQp thursdayFace = _TranslationsSkedmakerScheduleDayThursdayFaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayThursdayOnlineTlQp thursdayOnline = _TranslationsSkedmakerScheduleDayThursdayOnlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayThursdayHybridTlQp thursdayHybrid = _TranslationsSkedmakerScheduleDayThursdayHybridTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayThursdayUnknownTlQp thursdayUnknown = _TranslationsSkedmakerScheduleDayThursdayUnknownTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayFridayFaceTlQp fridayFace = _TranslationsSkedmakerScheduleDayFridayFaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayFridayOnlineTlQp fridayOnline = _TranslationsSkedmakerScheduleDayFridayOnlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayFridayHybridTlQp fridayHybrid = _TranslationsSkedmakerScheduleDayFridayHybridTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayFridayUnknownTlQp fridayUnknown = _TranslationsSkedmakerScheduleDayFridayUnknownTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDaySaturdayFaceTlQp saturdayFace = _TranslationsSkedmakerScheduleDaySaturdayFaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDaySaturdayOnlineTlQp saturdayOnline = _TranslationsSkedmakerScheduleDaySaturdayOnlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDaySaturdayHybridTlQp saturdayHybrid = _TranslationsSkedmakerScheduleDaySaturdayHybridTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDaySaturdayUnknownTlQp saturdayUnknown = _TranslationsSkedmakerScheduleDaySaturdayUnknownTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondaythursdayFaceTlQp mondaythursdayFace = _TranslationsSkedmakerScheduleDayMondaythursdayFaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondaythursdayOnlineTlQp mondaythursdayOnline = _TranslationsSkedmakerScheduleDayMondaythursdayOnlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceTlQp mondaythursdayOnlineface = _TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineTlQp mondaythursdayFaceonline = _TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondaythursdayUnknownTlQp mondaythursdayUnknown = _TranslationsSkedmakerScheduleDayMondaythursdayUnknownTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayfridayFaceTlQp tuesdayfridayFace = _TranslationsSkedmakerScheduleDayTuesdayfridayFaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayfridayOnlineTlQp tuesdayfridayOnline = _TranslationsSkedmakerScheduleDayTuesdayfridayOnlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceTlQp tuesdayfridayOnlineface = _TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineTlQp tuesdayfridayFaceonline = _TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayfridayUnknownTlQp tuesdayfridayUnknown = _TranslationsSkedmakerScheduleDayTuesdayfridayUnknownTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceTlQp wednesdaysaturdayFace = _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineTlQp wednesdaysaturdayOnline = _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTlQp wednesdaysaturdayOnlineface = _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTlQp wednesdaysaturdayFaceonline = _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownTlQp wednesdaysaturdayUnknown = _TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownTlQp._(_root);
	@override late final _TranslationsSkedmakerScheduleDayUnknownTlQp unknown = _TranslationsSkedmakerScheduleDayUnknownTlQp._(_root);
}

// Path: skedmaker.scheduleRoom
class _TranslationsSkedmakerScheduleRoomTlQp extends TranslationsSkedmakerScheduleRoomEn {
	_TranslationsSkedmakerScheduleRoomTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Walang room';
	@override String get online => 'Online';
	@override String hybrid({required Object room}) => '${room} at online';
}

// Path: skedmaker.scheduleDefault
class _TranslationsSkedmakerScheduleDefaultTlQp extends TranslationsSkedmakerScheduleDefaultEn {
	_TranslationsSkedmakerScheduleDefaultTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String name({required Object n}) => 'Schedule ${n}';
}

// Path: skedmaker.infobar
class _TranslationsSkedmakerInfobarTlQp extends TranslationsSkedmakerInfobarEn {
	_TranslationsSkedmakerInfobarTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get currentlyGeneratingSchedules => 'Naggegenerate ng schedules ngayon. Hindi mag-aapply ang mga changes dito hanggang sa mag-generate ka ulit.';
}

// Path: general.home.more
class _TranslationsGeneralHomeMoreTlQp extends TranslationsGeneralHomeMoreEn {
	_TranslationsGeneralHomeMoreTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'More pa coming soon!';
	@override String get desc => 'Maging updated! :)';
}

// Path: general.drawer.about
class _TranslationsGeneralDrawerAboutTlQp extends TranslationsGeneralDrawerAboutEn {
	_TranslationsGeneralDrawerAboutTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'About';
	@override String version({required Object version, required Object build}) => 'Version ${version} build ${build}';
	@override String get copyright => 'Copyright (C) 2024 Yivan Padsoyan';
}

// Path: general.drawer.support
class _TranslationsGeneralDrawerSupportTlQp extends TranslationsGeneralDrawerSupportEn {
	_TranslationsGeneralDrawerSupportTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buy Me A Coffee';
	@override String get desc => 'I-support ako!';
}

// Path: general.drawer.github
class _TranslationsGeneralDrawerGithubTlQp extends TranslationsGeneralDrawerGithubEn {
	_TranslationsGeneralDrawerGithubTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tignan ang source code';
	@override String get desc => 'Mag-contribute sa AralTools!';
}

// Path: general.drawer.bugs
class _TranslationsGeneralDrawerBugsTlQp extends TranslationsGeneralDrawerBugsEn {
	_TranslationsGeneralDrawerBugsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Issue tracker';
	@override String get desc => 'Mag-report ng mga issue at bug dito!';
}

// Path: general.drawer.language
class _TranslationsGeneralDrawerLanguageTlQp extends TranslationsGeneralDrawerLanguageEn {
	_TranslationsGeneralDrawerLanguageTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String title({required Object language}) => 'Language: ${language}';
	@override String get tooltip => 'Palitan ang language';
}

// Path: general.functions.backToHome
class _TranslationsGeneralFunctionsBackToHomeTlQp extends TranslationsGeneralFunctionsBackToHomeEn {
	_TranslationsGeneralFunctionsBackToHomeTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Bumalik sa home';
	@override String get title => 'Bumalik sa home?';
	@override String get desc => 'Lahat ng unsaved data ay mawawala.';
}

// Path: general.functions.newProject
class _TranslationsGeneralFunctionsNewProjectTlQp extends TranslationsGeneralFunctionsNewProjectEn {
	_TranslationsGeneralFunctionsNewProjectTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gumawa ng bagong project?';
	@override String get desc => 'Lahat ng unsaved data ay mawawala.';
}

// Path: general.general.open
class _TranslationsGeneralGeneralOpenTlQp extends TranslationsGeneralGeneralOpenEn {
	_TranslationsGeneralGeneralOpenTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get regular => 'I-open';
	@override String get ellipsis => 'I-open...';
}

// Path: general.general.saveAs
class _TranslationsGeneralGeneralSaveAsTlQp extends TranslationsGeneralGeneralSaveAsEn {
	_TranslationsGeneralGeneralSaveAsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get regular => 'I-save as';
	@override String get ellipsis => 'I-save as...';
}

// Path: skedmaker.drawer.fileLocation
class _TranslationsSkedmakerDrawerFileLocationTlQp extends TranslationsSkedmakerDrawerFileLocationEn {
	_TranslationsSkedmakerDrawerFileLocationTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'File location';
	@override String get empty => '-';
	@override String get open => 'I-open ang file location';
}

// Path: skedmaker.subjects.add
class _TranslationsSkedmakerSubjectsAddTlQp extends TranslationsSkedmakerSubjectsAddEn {
	_TranslationsSkedmakerSubjectsAddTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mag-add ng subject';
	@override late final _TranslationsSkedmakerSubjectsAddButtonMlsTlQp buttonMls = _TranslationsSkedmakerSubjectsAddButtonMlsTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsAddButtonManualTlQp buttonManual = _TranslationsSkedmakerSubjectsAddButtonManualTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsAddButtonCodeTlQp buttonCode = _TranslationsSkedmakerSubjectsAddButtonCodeTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsAddErrorParseTlQp errorParse = _TranslationsSkedmakerSubjectsAddErrorParseTlQp._(_root);
}

// Path: skedmaker.subjects.subject
class _TranslationsSkedmakerSubjectsSubjectTlQp extends TranslationsSkedmakerSubjectsSubjectEn {
	_TranslationsSkedmakerSubjectsSubjectTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String title({required Object subject, required Object offering, required Object available}) => '${subject} - ${offering} offerings (${available} available)';
	@override late final _TranslationsSkedmakerSubjectsSubjectActionsTlQp actions = _TranslationsSkedmakerSubjectsSubjectActionsTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableTlQp table = _TranslationsSkedmakerSubjectsSubjectTableTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectInfobarTlQp infobar = _TranslationsSkedmakerSubjectsSubjectInfobarTlQp._(_root);
}

// Path: skedmaker.subjects.empty
class _TranslationsSkedmakerSubjectsEmptyTlQp extends TranslationsSkedmakerSubjectsEmptyEn {
	_TranslationsSkedmakerSubjectsEmptyTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String title({required Object subject}) => '${subject} ay walang offerings';
}

// Path: skedmaker.filters.categories
class _TranslationsSkedmakerFiltersCategoriesTlQp extends TranslationsSkedmakerFiltersCategoriesEn {
	_TranslationsSkedmakerFiltersCategoriesTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsTlQp offerings = _TranslationsSkedmakerFiltersCategoriesOfferingsTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayTlQp day = _TranslationsSkedmakerFiltersCategoriesDayTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesLocationTlQp location = _TranslationsSkedmakerFiltersCategoriesLocationTlQp._(_root);
}

// Path: skedmaker.schedules.generate
class _TranslationsSkedmakerSchedulesGenerateTlQp extends TranslationsSkedmakerSchedulesGenerateEn {
	_TranslationsSkedmakerSchedulesGenerateTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mag-generate ng possible schedules';
	@override String get button => 'Generate';
	@override String get pending => 'No schedules found pa. Medyo matagal \'to.';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tl'))(n,
		one: '${n} schedule found',
		other: '${n} schedules found',
	);
	@override String progress({required Object percent}) => '${percent}% complete';
	@override String get none => 'No schedules found. Baká i-check ang mga filters mo tapós try ulit.';
}

// Path: skedmaker.schedules.commandbar
class _TranslationsSkedmakerSchedulesCommandbarTlQp extends TranslationsSkedmakerSchedulesCommandbarEn {
	_TranslationsSkedmakerSchedulesCommandbarTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerSchedulesCommandbarRenameTlQp rename = _TranslationsSkedmakerSchedulesCommandbarRenameTlQp._(_root);
	@override late final _TranslationsSkedmakerSchedulesCommandbarDeleteTlQp delete = _TranslationsSkedmakerSchedulesCommandbarDeleteTlQp._(_root);
	@override late final _TranslationsSkedmakerSchedulesCommandbarStarTlQp star = _TranslationsSkedmakerSchedulesCommandbarStarTlQp._(_root);
	@override late final _TranslationsSkedmakerSchedulesCommandbarSaveImageTlQp saveImage = _TranslationsSkedmakerSchedulesCommandbarSaveImageTlQp._(_root);
}

// Path: skedmaker.schedules.details
class _TranslationsSkedmakerSchedulesDetailsTlQp extends TranslationsSkedmakerSchedulesDetailsEn {
	_TranslationsSkedmakerSchedulesDetailsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Details';
	@override String get notes => 'Notes';
	@override String get subjects => 'Subjects';
}

// Path: skedmaker.schedules.info
class _TranslationsSkedmakerSchedulesInfoTlQp extends TranslationsSkedmakerSchedulesInfoEn {
	_TranslationsSkedmakerSchedulesInfoTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Info';
	@override String get title => 'Information';
	@override String get desc => 'Mag-select ng schedule sa left.\nI-view at i-compare multiple schedules by opening new tabs at the top.\n\nKeyboard shortcuts:\nUp/Down arrow key - pumunta sa next/previous schedule\nCtrl + T - gumawa ng new tab\nCtrl + W o Ctrl + F4 - i-close current tab\nCtrl + 1 hanggang 8 - pumunta sa first to eighth tab\nCtrl + 9 - pumunta sa last tab\n';
}

// Path: skedmaker.schedules.options
class _TranslationsSkedmakerSchedulesOptionsTlQp extends TranslationsSkedmakerSchedulesOptionsEn {
	_TranslationsSkedmakerSchedulesOptionsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get hoverEffects => 'I-enable ang hover effects';
}

// Path: skedmaker.scheduleDay.mondayFace
class _TranslationsSkedmakerScheduleDayMondayFaceTlQp extends TranslationsSkedmakerScheduleDayMondayFaceEn {
	_TranslationsSkedmakerScheduleDayMondayFaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday (face-to-face)';
	@override String get nameShort => 'M (f2f)';
}

// Path: skedmaker.scheduleDay.mondayOnline
class _TranslationsSkedmakerScheduleDayMondayOnlineTlQp extends TranslationsSkedmakerScheduleDayMondayOnlineEn {
	_TranslationsSkedmakerScheduleDayMondayOnlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday (online)';
	@override String get nameShort => 'M (online)';
}

// Path: skedmaker.scheduleDay.mondayHybrid
class _TranslationsSkedmakerScheduleDayMondayHybridTlQp extends TranslationsSkedmakerScheduleDayMondayHybridEn {
	_TranslationsSkedmakerScheduleDayMondayHybridTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday (hybrid)';
	@override String get nameShort => 'M (hybrid)';
}

// Path: skedmaker.scheduleDay.mondayUnknown
class _TranslationsSkedmakerScheduleDayMondayUnknownTlQp extends TranslationsSkedmakerScheduleDayMondayUnknownEn {
	_TranslationsSkedmakerScheduleDayMondayUnknownTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday';
	@override String get nameShort => 'M';
}

// Path: skedmaker.scheduleDay.tuesdayFace
class _TranslationsSkedmakerScheduleDayTuesdayFaceTlQp extends TranslationsSkedmakerScheduleDayTuesdayFaceEn {
	_TranslationsSkedmakerScheduleDayTuesdayFaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday (face-to-face)';
	@override String get nameShort => 'T (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayOnline
class _TranslationsSkedmakerScheduleDayTuesdayOnlineTlQp extends TranslationsSkedmakerScheduleDayTuesdayOnlineEn {
	_TranslationsSkedmakerScheduleDayTuesdayOnlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday (online)';
	@override String get nameShort => 'T (online)';
}

// Path: skedmaker.scheduleDay.tuesdayHybrid
class _TranslationsSkedmakerScheduleDayTuesdayHybridTlQp extends TranslationsSkedmakerScheduleDayTuesdayHybridEn {
	_TranslationsSkedmakerScheduleDayTuesdayHybridTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday (hybrid)';
	@override String get nameShort => 'T (hybrid)';
}

// Path: skedmaker.scheduleDay.tuesdayUnknown
class _TranslationsSkedmakerScheduleDayTuesdayUnknownTlQp extends TranslationsSkedmakerScheduleDayTuesdayUnknownEn {
	_TranslationsSkedmakerScheduleDayTuesdayUnknownTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday';
	@override String get nameShort => 'T';
}

// Path: skedmaker.scheduleDay.wednesdayFace
class _TranslationsSkedmakerScheduleDayWednesdayFaceTlQp extends TranslationsSkedmakerScheduleDayWednesdayFaceEn {
	_TranslationsSkedmakerScheduleDayWednesdayFaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday (face-to-face)';
	@override String get nameShort => 'W (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdayOnline
class _TranslationsSkedmakerScheduleDayWednesdayOnlineTlQp extends TranslationsSkedmakerScheduleDayWednesdayOnlineEn {
	_TranslationsSkedmakerScheduleDayWednesdayOnlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday (online)';
	@override String get nameShort => 'W (online)';
}

// Path: skedmaker.scheduleDay.wednesdayHybrid
class _TranslationsSkedmakerScheduleDayWednesdayHybridTlQp extends TranslationsSkedmakerScheduleDayWednesdayHybridEn {
	_TranslationsSkedmakerScheduleDayWednesdayHybridTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday (hybrid)';
	@override String get nameShort => 'W (hybrid)';
}

// Path: skedmaker.scheduleDay.wednesdayUnknown
class _TranslationsSkedmakerScheduleDayWednesdayUnknownTlQp extends TranslationsSkedmakerScheduleDayWednesdayUnknownEn {
	_TranslationsSkedmakerScheduleDayWednesdayUnknownTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday';
	@override String get nameShort => 'W';
}

// Path: skedmaker.scheduleDay.thursdayFace
class _TranslationsSkedmakerScheduleDayThursdayFaceTlQp extends TranslationsSkedmakerScheduleDayThursdayFaceEn {
	_TranslationsSkedmakerScheduleDayThursdayFaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Thursday (face-to-face)';
	@override String get nameShort => 'H (f2f)';
}

// Path: skedmaker.scheduleDay.thursdayOnline
class _TranslationsSkedmakerScheduleDayThursdayOnlineTlQp extends TranslationsSkedmakerScheduleDayThursdayOnlineEn {
	_TranslationsSkedmakerScheduleDayThursdayOnlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Thursday (online)';
	@override String get nameShort => 'H (online)';
}

// Path: skedmaker.scheduleDay.thursdayHybrid
class _TranslationsSkedmakerScheduleDayThursdayHybridTlQp extends TranslationsSkedmakerScheduleDayThursdayHybridEn {
	_TranslationsSkedmakerScheduleDayThursdayHybridTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Thursday (hybrid)';
	@override String get nameShort => 'H (hybrid)';
}

// Path: skedmaker.scheduleDay.thursdayUnknown
class _TranslationsSkedmakerScheduleDayThursdayUnknownTlQp extends TranslationsSkedmakerScheduleDayThursdayUnknownEn {
	_TranslationsSkedmakerScheduleDayThursdayUnknownTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Thursday';
	@override String get nameShort => 'H';
}

// Path: skedmaker.scheduleDay.fridayFace
class _TranslationsSkedmakerScheduleDayFridayFaceTlQp extends TranslationsSkedmakerScheduleDayFridayFaceEn {
	_TranslationsSkedmakerScheduleDayFridayFaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Friday (face-to-face)';
	@override String get nameShort => 'F (f2f)';
}

// Path: skedmaker.scheduleDay.fridayOnline
class _TranslationsSkedmakerScheduleDayFridayOnlineTlQp extends TranslationsSkedmakerScheduleDayFridayOnlineEn {
	_TranslationsSkedmakerScheduleDayFridayOnlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Friday (online)';
	@override String get nameShort => 'F (online)';
}

// Path: skedmaker.scheduleDay.fridayHybrid
class _TranslationsSkedmakerScheduleDayFridayHybridTlQp extends TranslationsSkedmakerScheduleDayFridayHybridEn {
	_TranslationsSkedmakerScheduleDayFridayHybridTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Friday (hybrid)';
	@override String get nameShort => 'F (hybrid)';
}

// Path: skedmaker.scheduleDay.fridayUnknown
class _TranslationsSkedmakerScheduleDayFridayUnknownTlQp extends TranslationsSkedmakerScheduleDayFridayUnknownEn {
	_TranslationsSkedmakerScheduleDayFridayUnknownTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Friday';
	@override String get nameShort => 'F';
}

// Path: skedmaker.scheduleDay.saturdayFace
class _TranslationsSkedmakerScheduleDaySaturdayFaceTlQp extends TranslationsSkedmakerScheduleDaySaturdayFaceEn {
	_TranslationsSkedmakerScheduleDaySaturdayFaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Saturday (face-to-face)';
	@override String get nameShort => 'S (f2f)';
}

// Path: skedmaker.scheduleDay.saturdayOnline
class _TranslationsSkedmakerScheduleDaySaturdayOnlineTlQp extends TranslationsSkedmakerScheduleDaySaturdayOnlineEn {
	_TranslationsSkedmakerScheduleDaySaturdayOnlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Saturday (online)';
	@override String get nameShort => 'S (online)';
}

// Path: skedmaker.scheduleDay.saturdayHybrid
class _TranslationsSkedmakerScheduleDaySaturdayHybridTlQp extends TranslationsSkedmakerScheduleDaySaturdayHybridEn {
	_TranslationsSkedmakerScheduleDaySaturdayHybridTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Saturday (hybrid)';
	@override String get nameShort => 'S (hybrid)';
}

// Path: skedmaker.scheduleDay.saturdayUnknown
class _TranslationsSkedmakerScheduleDaySaturdayUnknownTlQp extends TranslationsSkedmakerScheduleDaySaturdayUnknownEn {
	_TranslationsSkedmakerScheduleDaySaturdayUnknownTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Saturday';
	@override String get nameShort => 'S';
}

// Path: skedmaker.scheduleDay.mondaythursdayFace
class _TranslationsSkedmakerScheduleDayMondaythursdayFaceTlQp extends TranslationsSkedmakerScheduleDayMondaythursdayFaceEn {
	_TranslationsSkedmakerScheduleDayMondaythursdayFaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday at Thursday (both face-to-face)';
	@override String get nameShort => 'M & H (both f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnline
class _TranslationsSkedmakerScheduleDayMondaythursdayOnlineTlQp extends TranslationsSkedmakerScheduleDayMondaythursdayOnlineEn {
	_TranslationsSkedmakerScheduleDayMondaythursdayOnlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday at Thursday (both online)';
	@override String get nameShort => 'M & H (both online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnlineface
class _TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceTlQp extends TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceEn {
	_TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday (online) at Thursday (face-to-face)';
	@override String get nameShort => 'M (online) & H (f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayFaceonline
class _TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineTlQp extends TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineEn {
	_TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday (face-to-face) at Thursday (online)';
	@override String get nameShort => 'M (f2f) & H (online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayUnknown
class _TranslationsSkedmakerScheduleDayMondaythursdayUnknownTlQp extends TranslationsSkedmakerScheduleDayMondaythursdayUnknownEn {
	_TranslationsSkedmakerScheduleDayMondaythursdayUnknownTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday at Thursday';
	@override String get nameShort => 'M & H';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFace
class _TranslationsSkedmakerScheduleDayTuesdayfridayFaceTlQp extends TranslationsSkedmakerScheduleDayTuesdayfridayFaceEn {
	_TranslationsSkedmakerScheduleDayTuesdayfridayFaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday at Friday (both face-to-face)';
	@override String get nameShort => 'T & F (both f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnline
class _TranslationsSkedmakerScheduleDayTuesdayfridayOnlineTlQp extends TranslationsSkedmakerScheduleDayTuesdayfridayOnlineEn {
	_TranslationsSkedmakerScheduleDayTuesdayfridayOnlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday at Friday (both online)';
	@override String get nameShort => 'T & F (both online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnlineface
class _TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceTlQp extends TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn {
	_TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday (online) at Friday (face-to-face)';
	@override String get nameShort => 'T (online) & F (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFaceonline
class _TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineTlQp extends TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineEn {
	_TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday (face-to-face) at Friday (online)';
	@override String get nameShort => 'T (f2f) & F (online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayUnknown
class _TranslationsSkedmakerScheduleDayTuesdayfridayUnknownTlQp extends TranslationsSkedmakerScheduleDayTuesdayfridayUnknownEn {
	_TranslationsSkedmakerScheduleDayTuesdayfridayUnknownTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday at Friday';
	@override String get nameShort => 'T & F';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFace
class _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceTlQp extends TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceEn {
	_TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday at Saturday (both face-to-face)';
	@override String get nameShort => 'W & S (both f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnline
class _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineTlQp extends TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineEn {
	_TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday at Saturday (both online)';
	@override String get nameShort => 'W & S (both online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnlineface
class _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTlQp extends TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn {
	_TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday (online) at Saturday (face-to-face)';
	@override String get nameShort => 'W (online) & S (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFaceonline
class _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTlQp extends TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn {
	_TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday (face-to-face) at Saturday (online)';
	@override String get nameShort => 'W (f2f) & S (online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayUnknown
class _TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownTlQp extends TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownEn {
	_TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday at Saturday';
	@override String get nameShort => 'W & S';
}

// Path: skedmaker.scheduleDay.unknown
class _TranslationsSkedmakerScheduleDayUnknownTlQp extends TranslationsSkedmakerScheduleDayUnknownEn {
	_TranslationsSkedmakerScheduleDayUnknownTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Unknown';
	@override String get nameShort => 'Unknown';
}

// Path: skedmaker.subjects.add.buttonMls
class _TranslationsSkedmakerSubjectsAddButtonMlsTlQp extends TranslationsSkedmakerSubjectsAddButtonMlsEn {
	_TranslationsSkedmakerSubjectsAddButtonMlsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mag-add mula My.LaSalle';
	@override String get title => 'Mag-add ng subject';
	@override String get desc => 'I-enter ang ID number mo at ang subject code sa pop-up window. \'Pag naka-display na ang mga offerings, i-click ang "${_root.general.general.add}".';
	@override String get webviewTitle => 'WebView2 ay \'di installed';
	@override TextSpan webviewDesc({required InlineSpanBuilder webview, required InlineSpanBuilder learn}) => TextSpan(children: [
		const TextSpan(text: 'Need mong i-download at i-install ang '),
		webview('Microsoft Edge WebView2 Runtime'),
		const TextSpan(text: ' para ma-access ang My.LaSalle within AralTools SkedMaker. Included na \'to sa Windows 11, pero wala sa device mo.\n\n'),
		learn('Click here para matuto pa.'),
	]);
}

// Path: skedmaker.subjects.add.buttonManual
class _TranslationsSkedmakerSubjectsAddButtonManualTlQp extends TranslationsSkedmakerSubjectsAddButtonManualEn {
	_TranslationsSkedmakerSubjectsAddButtonManualTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mag-add manu-mano';
	@override String get title => 'Mag-create ng new subject';
	@override String get desc => 'Mag-enter ng 7-character na subject code:';
}

// Path: skedmaker.subjects.add.buttonCode
class _TranslationsSkedmakerSubjectsAddButtonCodeTlQp extends TranslationsSkedmakerSubjectsAddButtonCodeEn {
	_TranslationsSkedmakerSubjectsAddButtonCodeTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mag-add gamit code';
	@override String get title => 'Mag-add ng subjects gamit code';
	@override TextSpan desc({required InlineSpanBuilder mls}) => TextSpan(children: [
		const TextSpan(text: 'I-open ang '),
		mls(_root.skedmaker.mlsCourseOfferings),
		const TextSpan(text: ' sa browser at i-enter ang iyong ID number at subject code. Once na-display ang offerings, i-open ang Developer Console at i-enter \'tong command:\n'),
	]);
	@override String get field => 'I-copy ang output at i-paste dito:';
	@override String get hint => 'Ang command output';
	@override String get error => 'Invalid ang input';
}

// Path: skedmaker.subjects.add.errorParse
class _TranslationsSkedmakerSubjectsAddErrorParseTlQp extends TranslationsSkedmakerSubjectsAddErrorParseEn {
	_TranslationsSkedmakerSubjectsAddErrorParseTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Error habang nagpa-parse';
	@override String get messagebox => 'Hindi mai-parse \'tong mga offerings.';
	@override String get footer => 'Madi-discard \'tong mga offerings kapag magpro-proceed.';
}

// Path: skedmaker.subjects.subject.actions
class _TranslationsSkedmakerSubjectsSubjectActionsTlQp extends TranslationsSkedmakerSubjectsSubjectActionsEn {
	_TranslationsSkedmakerSubjectsSubjectActionsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerSubjectsSubjectActionsRecolorTlQp recolor = _TranslationsSkedmakerSubjectsSubjectActionsRecolorTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectActionsDeleteTlQp delete = _TranslationsSkedmakerSubjectsSubjectActionsDeleteTlQp._(_root);
	@override String get showhide => 'I-show/I-hide';
	@override String get offeringAdd => 'Mag-add ng offering';
	@override late final _TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteTlQp offeringDelete = _TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteTlQp._(_root);
	@override String get offeringCloseAll => 'I-close lahat ng offerings';
	@override String get offeringOpenAll => 'I-open lahat ng offerings';
}

// Path: skedmaker.subjects.subject.table
class _TranslationsSkedmakerSubjectsSubjectTableTlQp extends TranslationsSkedmakerSubjectsSubjectTableEn {
	_TranslationsSkedmakerSubjectsSubjectTableTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerSubjectsSubjectTableStatusTlQp status = _TranslationsSkedmakerSubjectsSubjectTableStatusTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableClassnoTlQp classno = _TranslationsSkedmakerSubjectsSubjectTableClassnoTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableSectionTlQp section = _TranslationsSkedmakerSubjectsSubjectTableSectionTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableRoomTlQp room = _TranslationsSkedmakerSubjectsSubjectTableRoomTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableDayTlQp day = _TranslationsSkedmakerSubjectsSubjectTableDayTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableTimeTlQp time = _TranslationsSkedmakerSubjectsSubjectTableTimeTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableTeacherTlQp teacher = _TranslationsSkedmakerSubjectsSubjectTableTeacherTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableSlotsTlQp slots = _TranslationsSkedmakerSubjectsSubjectTableSlotsTlQp._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableRemarksTlQp remarks = _TranslationsSkedmakerSubjectsSubjectTableRemarksTlQp._(_root);
}

// Path: skedmaker.subjects.subject.infobar
class _TranslationsSkedmakerSubjectsSubjectInfobarTlQp extends TranslationsSkedmakerSubjectsSubjectInfobarEn {
	_TranslationsSkedmakerSubjectsSubjectInfobarTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String noAvailableOffering({required Object subject}) => '${subject} ay walang available na offering.';
	@override String hidden({required Object subject}) => 'Naka-hide ang ${subject}. Hindi ito included kapag nag-gegenerate ng mga schedule.';
}

// Path: skedmaker.filters.categories.offerings
class _TranslationsSkedmakerFiltersCategoriesOfferingsTlQp extends TranslationsSkedmakerFiltersCategoriesOfferingsEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mga offering';
	@override String get desc => 'I-filter ang mga offerings na i-iinclude at i-eexclude';
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedTlQp includeClosed = _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTlQp includeFullSlots = _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTlQp includeUnknownModality = _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTlQp includeNoTeachers = _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTlQp excludeSectionLetter = _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterTlQp excludeRemarksLetter = _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTlQp includeFreshmanBlock = _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTlQp._(_root);
}

// Path: skedmaker.filters.categories.day
class _TranslationsSkedmakerFiltersCategoriesDayTlQp extends TranslationsSkedmakerFiltersCategoriesDayEn {
	_TranslationsSkedmakerFiltersCategoriesDayTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Specific sa day';
	@override String get desc => 'Mag-add ng specific filters kada araw ng linggo';
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTlQp commonMaxNumberOfSubjects = _TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalTlQp commonTimeInterval = _TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonModalityTlQp commonModality = _TranslationsSkedmakerFiltersCategoriesDayCommonModalityTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTlQp commonStartWithSubject = _TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTlQp commonEndWithSubject = _TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeTlQp commonBreaktime = _TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeTlQp._(_root);
	@override String get mondayName => 'Monday';
	@override String get tuesdayName => 'Tuesday';
	@override String get wednesdayName => 'Wednesday';
	@override String get thursdayName => 'Thursday';
	@override String get fridayName => 'Friday';
	@override String get saturdayName => 'Saturday';
}

// Path: skedmaker.filters.categories.location
class _TranslationsSkedmakerFiltersCategoriesLocationTlQp extends TranslationsSkedmakerFiltersCategoriesLocationEn {
	_TranslationsSkedmakerFiltersCategoriesLocationTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Location (experimental)';
	@override String get desc => 'I-filter ang schedules base sa location ng offering';
	@override late final _TranslationsSkedmakerFiltersCategoriesLocationEnabledTlQp enabled = _TranslationsSkedmakerFiltersCategoriesLocationEnabledTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTlQp checkingDistanceMinutes = _TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTlQp maxAllowedDistanceMeters = _TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTlQp._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesLocationCalculatorTlQp calculator = _TranslationsSkedmakerFiltersCategoriesLocationCalculatorTlQp._(_root);
}

// Path: skedmaker.schedules.commandbar.rename
class _TranslationsSkedmakerSchedulesCommandbarRenameTlQp extends TranslationsSkedmakerSchedulesCommandbarRenameEn {
	_TranslationsSkedmakerSchedulesCommandbarRenameTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-rename';
	@override String get edit => 'Mag-enter ng bagong name';
}

// Path: skedmaker.schedules.commandbar.delete
class _TranslationsSkedmakerSchedulesCommandbarDeleteTlQp extends TranslationsSkedmakerSchedulesCommandbarDeleteEn {
	_TranslationsSkedmakerSchedulesCommandbarDeleteTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-delete';
	@override String desc({required Object name}) => 'I-delete ang ${name}?\n\'Di mo \'to ma-uundelete..\nMadedelete lahat ng tabs with this schedule.\n';
}

// Path: skedmaker.schedules.commandbar.star
class _TranslationsSkedmakerSchedulesCommandbarStarTlQp extends TranslationsSkedmakerSchedulesCommandbarStarEn {
	_TranslationsSkedmakerSchedulesCommandbarStarTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get star => 'I-star';
	@override String get unstar => 'I-unstar';
}

// Path: skedmaker.schedules.commandbar.saveImage
class _TranslationsSkedmakerSchedulesCommandbarSaveImageTlQp extends TranslationsSkedmakerSchedulesCommandbarSaveImageEn {
	_TranslationsSkedmakerSchedulesCommandbarSaveImageTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-save as image';
	@override String get title => 'Save as image';
	@override String get desc => 'I-resize \'tong window para i-adjust ang formatting. \'Pag tapos, i-click ang "${_root.general.general.save}".';
	@override TextSpan credits({required InlineSpanBuilder name}) => TextSpan(children: [
		const TextSpan(text: 'na-generate ng '),
		name(_root.skedmaker.info.nameFull),
	]);
}

// Path: skedmaker.subjects.subject.actions.recolor
class _TranslationsSkedmakerSubjectsSubjectActionsRecolorTlQp extends TranslationsSkedmakerSubjectsSubjectActionsRecolorEn {
	_TranslationsSkedmakerSubjectsSubjectActionsRecolorTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-recolor';
	@override String get title => 'Mag-select ng color';
	@override String get primary => 'Primary';
	@override String get wheel => 'Wheel';
	@override String get shades => 'Shades';
}

// Path: skedmaker.subjects.subject.actions.delete
class _TranslationsSkedmakerSubjectsSubjectActionsDeleteTlQp extends TranslationsSkedmakerSubjectsSubjectActionsDeleteEn {
	_TranslationsSkedmakerSubjectsSubjectActionsDeleteTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-delete';
	@override String warning({required Object subject}) => 'I-delete ang ${subject}? \n\'Di mo \'to ma-uundelete.';
}

// Path: skedmaker.subjects.subject.actions.offeringDelete
class _TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteTlQp extends TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteEn {
	_TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mag-delete ng offering';
	@override String get warning => 'I-delete \'tong offering? \n\'Di mo \'to ma-uundelete.';
}

// Path: skedmaker.subjects.subject.table.status
class _TranslationsSkedmakerSubjectsSubjectTableStatusTlQp extends TranslationsSkedmakerSubjectsSubjectTableStatusEn {
	_TranslationsSkedmakerSubjectsSubjectTableStatusTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Status';
	@override String get open => 'Naka-open';
	@override String get closed => 'Naka-close';
}

// Path: skedmaker.subjects.subject.table.classno
class _TranslationsSkedmakerSubjectsSubjectTableClassnoTlQp extends TranslationsSkedmakerSubjectsSubjectTableClassnoEn {
	_TranslationsSkedmakerSubjectsSubjectTableClassnoTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Class \#';
	@override String get edit => 'I-edit ang class number:';
}

// Path: skedmaker.subjects.subject.table.section
class _TranslationsSkedmakerSubjectsSubjectTableSectionTlQp extends TranslationsSkedmakerSubjectsSubjectTableSectionEn {
	_TranslationsSkedmakerSubjectsSubjectTableSectionTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Section';
	@override String get edit => 'I-edit ang section:';
}

// Path: skedmaker.subjects.subject.table.room
class _TranslationsSkedmakerSubjectsSubjectTableRoomTlQp extends TranslationsSkedmakerSubjectsSubjectTableRoomEn {
	_TranslationsSkedmakerSubjectsSubjectTableRoomTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Room';
	@override String get edit => 'I-edit ang room (puwedeng empty):';
}

// Path: skedmaker.subjects.subject.table.day
class _TranslationsSkedmakerSubjectsSubjectTableDayTlQp extends TranslationsSkedmakerSubjectsSubjectTableDayEn {
	_TranslationsSkedmakerSubjectsSubjectTableDayTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Day';
	@override String get edit => 'I-edit ang day:';
}

// Path: skedmaker.subjects.subject.table.time
class _TranslationsSkedmakerSubjectsSubjectTableTimeTlQp extends TranslationsSkedmakerSubjectsSubjectTableTimeEn {
	_TranslationsSkedmakerSubjectsSubjectTableTimeTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Time';
	@override String data({required Object from, required Object to}) => '${from} - ${to}';
	@override String get edit => 'I-edit ang time:';
	@override String get to => ' to ';
	@override String get secondTimeInterval => 'Second time interval';
	@override String get errorStartTimeBeforeEndTime => 'Ang start time ay dapat before sa end time';
	@override String get errorSecondTimeInterval => 'Dapat mayroon itong second time interval';
	@override String get errorConflict => 'Ang dalawang time intervals ay \'di dapat mang-conflict kasi same day sila';
}

// Path: skedmaker.subjects.subject.table.teacher
class _TranslationsSkedmakerSubjectsSubjectTableTeacherTlQp extends TranslationsSkedmakerSubjectsSubjectTableTeacherEn {
	_TranslationsSkedmakerSubjectsSubjectTableTeacherTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Teacher';
	@override String get edit => 'I-edit ang teacher (puwedeng empty):';
}

// Path: skedmaker.subjects.subject.table.slots
class _TranslationsSkedmakerSubjectsSubjectTableSlotsTlQp extends TranslationsSkedmakerSubjectsSubjectTableSlotsEn {
	_TranslationsSkedmakerSubjectsSubjectTableSlotsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Slots';
	@override String data({required Object taken, required Object capacity}) => '${taken} / ${capacity}';
	@override String percent({required Object percent}) => '${percent}%';
	@override String get edit => 'I-edit ang slots:';
	@override String get outOf => ' out of ';
}

// Path: skedmaker.subjects.subject.table.remarks
class _TranslationsSkedmakerSubjectsSubjectTableRemarksTlQp extends TranslationsSkedmakerSubjectsSubjectTableRemarksEn {
	_TranslationsSkedmakerSubjectsSubjectTableRemarksTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Remarks';
	@override String get edit => 'I-edit ang remarks (puwedeng empty):';
}

// Path: skedmaker.filters.categories.offerings.includeClosed
class _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedTlQp extends TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-include ang mga closed na offerings';
	@override String get desc => 'I-enable para i-ignore ang status nito (regardless kung open o closed)';
}

// Path: skedmaker.filters.categories.offerings.includeFullSlots
class _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTlQp extends TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-include ang offerings na full ang slots';
	@override String get desc => 'I-enable para i-ignore ang slot capacity nito';
}

// Path: skedmaker.filters.categories.offerings.includeUnknownModality
class _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTlQp extends TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-include ang offerings na unknown ang modality';
}

// Path: skedmaker.filters.categories.offerings.includeNoTeachers
class _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTlQp extends TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-include ang offerings na walang teacher';
}

// Path: skedmaker.filters.categories.offerings.excludeSectionLetter
class _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTlQp extends TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-exclude ang sections na nag-cocontain ng gan\'to';
	@override String get desc => 'Gamitin \'to para mag-exclude ng offerings na ang section ay may gan\'tong letter(s)';
}

// Path: skedmaker.filters.categories.offerings.excludeRemarksLetter
class _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterTlQp extends TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-exclude ang remarks na nag-cocontain ng gan\'to';
	@override String get desc => 'Gamitin \'to para mag-exclude ng offerings na ang remark ay may gan\'tong letter(s)';
}

// Path: skedmaker.filters.categories.offerings.includeFreshmanBlock
class _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTlQp extends TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-include ang freshman block';
}

// Path: skedmaker.filters.categories.day.commonMaxNumberOfSubjects
class _TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTlQp extends TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Maximum na bilang ng subjects';
	@override String get desc => 'I-enter ang -1 \'pag walang limit; I-enter ang 0 \'pag wala talangang subjects';
}

// Path: skedmaker.filters.categories.day.commonTimeInterval
class _TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalTlQp extends TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Dapat may subjects lang sa gan\'tong time interval';
}

// Path: skedmaker.filters.categories.day.commonModality
class _TranslationsSkedmakerFiltersCategoriesDayCommonModalityTlQp extends TranslationsSkedmakerFiltersCategoriesDayCommonModalityEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonModalityTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Modality ng subjects';
	@override String get hybrid => 'Online o face-to-face';
	@override String get online => 'Online';
	@override String get face => 'Face-to-face';
	@override String get any => 'Kahit anong modality';
	@override String get unknown => 'Unknown na modality';
}

// Path: skedmaker.filters.categories.day.commonStartWithSubject
class _TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTlQp extends TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'First subject ng araw';
}

// Path: skedmaker.filters.categories.day.commonEndWithSubject
class _TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTlQp extends TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Last subject ng araw';
}

// Path: skedmaker.filters.categories.day.commonBreaktime
class _TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeTlQp extends TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Breaktime';
	@override String get desc => 'Oras na dapat walang subjects';
}

// Path: skedmaker.filters.categories.location.enabled
class _TranslationsSkedmakerFiltersCategoriesLocationEnabledTlQp extends TranslationsSkedmakerFiltersCategoriesLocationEnabledEn {
	_TranslationsSkedmakerFiltersCategoriesLocationEnabledTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-enable ang pag-filter gamit ang location at distance';
	@override String get desc => 'I-coconsider nito ang distance ng: Previous class → ground floor → \nground floor ng next class → next class. \'Pag both ay \nnasa same building, ang distance mula previous hanggang next lang.';
}

// Path: skedmaker.filters.categories.location.checkingDistanceMinutes
class _TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTlQp extends TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn {
	_TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Time gap between subjects para i-check ang distance (in minutes)';
}

// Path: skedmaker.filters.categories.location.maxAllowedDistanceMeters
class _TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTlQp extends TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn {
	_TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Maximum distance mula sa isang subject hanggang sa next (in meters)';
}

// Path: skedmaker.filters.categories.location.calculator
class _TranslationsSkedmakerFiltersCategoriesLocationCalculatorTlQp extends TranslationsSkedmakerFiltersCategoriesLocationCalculatorEn {
	_TranslationsSkedmakerFiltersCategoriesLocationCalculatorTlQp._(TranslationsTlQp root) : this._root = root, super.internal(root);

	final TranslationsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-open ang distance calculator';
	@override String get title => 'Distance calculator';
	@override String get desc => 'Note: Estimate lang ito.';
	@override String get from => 'From:';
	@override String get to => 'To:';
	@override String get hint => 'Room code (eg. A1105)';
	@override String get calculate => 'Calculate';
	@override String result({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tl'))(n,
		one: '~${n} meter',
		other: '~${n} meters',
	);
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsTlQp {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.app.name': return 'AralTools';
			case 'general.home.name': return 'Home';
			case 'general.home.welcome': return 'Welcome!';
			case 'general.home.more.title': return 'More pa coming soon!';
			case 'general.home.more.desc': return 'Maging updated! :)';
			case 'general.drawer.about.name': return 'About';
			case 'general.drawer.about.version': return ({required Object version, required Object build}) => 'Version ${version} build ${build}';
			case 'general.drawer.about.copyright': return 'Copyright (C) 2024 Yivan Padsoyan';
			case 'general.drawer.support.title': return 'Buy Me A Coffee';
			case 'general.drawer.support.desc': return 'I-support ako!';
			case 'general.drawer.github.title': return 'Tignan ang source code';
			case 'general.drawer.github.desc': return 'Mag-contribute sa AralTools!';
			case 'general.drawer.bugs.title': return 'Issue tracker';
			case 'general.drawer.bugs.desc': return 'Mag-report ng mga issue at bug dito!';
			case 'general.drawer.language.title': return ({required Object language}) => 'Language: ${language}';
			case 'general.drawer.language.tooltip': return 'Palitan ang language';
			case 'general.functions.backToHome.name': return 'Bumalik sa home';
			case 'general.functions.backToHome.title': return 'Bumalik sa home?';
			case 'general.functions.backToHome.desc': return 'Lahat ng unsaved data ay mawawala.';
			case 'general.functions.newProject.title': return 'Gumawa ng bagong project?';
			case 'general.functions.newProject.desc': return 'Lahat ng unsaved data ay mawawala.';
			case 'general.general.go': return 'Go';
			case 'general.general.ok': return 'OK';
			case 'general.general.open.regular': return 'I-open';
			case 'general.general.open.ellipsis': return 'I-open...';
			case 'general.general.delete': return 'I-delete';
			case 'general.general.add': return 'I-add';
			case 'general.general.select': return 'I-select';
			case 'general.general.save': return 'I-save';
			case 'general.general.saveDont': return '\'Wag i-save';
			case 'general.general.saveAs.regular': return 'I-save as';
			case 'general.general.saveAs.ellipsis': return 'I-save as...';
			case 'general.general.cancel': return 'I-cancel';
			case 'general.general.resume': return 'I-resume';
			case 'general.general.pause': return 'I-pause';
			case 'general.general.stop': return 'I-stop';
			case 'general.general.close': return 'I-close';
			case 'general.general.rename': return 'I-rename';
			case 'general.general.copy': return 'I-copy';
			case 'general.general.new_': return 'New';
			case 'general.general.moreInfo': return 'More info';
			case 'general.general.proceed': return 'Mag-proceed';
			case 'skedmaker.info.name': return 'SkedMaker';
			case 'skedmaker.info.nameFull': return '${_root.general.app.name} ${_root.skedmaker.info.name}';
			case 'skedmaker.info.desc': return 'Ang automatic na class schedule maker para sa DLSU students';
			case 'skedmaker.drawer.fileLocation.name': return 'File location';
			case 'skedmaker.drawer.fileLocation.empty': return '-';
			case 'skedmaker.drawer.fileLocation.open': return 'I-open ang file location';
			case 'skedmaker.subjects.name': return 'Subjects';
			case 'skedmaker.subjects.add.title': return 'Mag-add ng subject';
			case 'skedmaker.subjects.add.buttonMls.name': return 'Mag-add mula My.LaSalle';
			case 'skedmaker.subjects.add.buttonMls.title': return 'Mag-add ng subject';
			case 'skedmaker.subjects.add.buttonMls.desc': return 'I-enter ang ID number mo at ang subject code sa pop-up window. \'Pag naka-display na ang mga offerings, i-click ang "${_root.general.general.add}".';
			case 'skedmaker.subjects.add.buttonMls.webviewTitle': return 'WebView2 ay \'di installed';
			case 'skedmaker.subjects.add.buttonMls.webviewDesc': return ({required InlineSpanBuilder webview, required InlineSpanBuilder learn}) => TextSpan(children: [
				const TextSpan(text: 'Need mong i-download at i-install ang '),
				webview('Microsoft Edge WebView2 Runtime'),
				const TextSpan(text: ' para ma-access ang My.LaSalle within AralTools SkedMaker. Included na \'to sa Windows 11, pero wala sa device mo.\n\n'),
				learn('Click here para matuto pa.'),
			]);
			case 'skedmaker.subjects.add.buttonManual.name': return 'Mag-add manu-mano';
			case 'skedmaker.subjects.add.buttonManual.title': return 'Mag-create ng new subject';
			case 'skedmaker.subjects.add.buttonManual.desc': return 'Mag-enter ng 7-character na subject code:';
			case 'skedmaker.subjects.add.buttonCode.name': return 'Mag-add gamit code';
			case 'skedmaker.subjects.add.buttonCode.title': return 'Mag-add ng subjects gamit code';
			case 'skedmaker.subjects.add.buttonCode.desc': return ({required InlineSpanBuilder mls}) => TextSpan(children: [
				const TextSpan(text: 'I-open ang '),
				mls(_root.skedmaker.mlsCourseOfferings),
				const TextSpan(text: ' sa browser at i-enter ang iyong ID number at subject code. Once na-display ang offerings, i-open ang Developer Console at i-enter \'tong command:\n'),
			]);
			case 'skedmaker.subjects.add.buttonCode.field': return 'I-copy ang output at i-paste dito:';
			case 'skedmaker.subjects.add.buttonCode.hint': return 'Ang command output';
			case 'skedmaker.subjects.add.buttonCode.error': return 'Invalid ang input';
			case 'skedmaker.subjects.add.errorParse.title': return 'Error habang nagpa-parse';
			case 'skedmaker.subjects.add.errorParse.messagebox': return 'Hindi mai-parse \'tong mga offerings.';
			case 'skedmaker.subjects.add.errorParse.footer': return 'Madi-discard \'tong mga offerings kapag magpro-proceed.';
			case 'skedmaker.subjects.subject.title': return ({required Object subject, required Object offering, required Object available}) => '${subject} - ${offering} offerings (${available} available)';
			case 'skedmaker.subjects.subject.actions.recolor.name': return 'I-recolor';
			case 'skedmaker.subjects.subject.actions.recolor.title': return 'Mag-select ng color';
			case 'skedmaker.subjects.subject.actions.recolor.primary': return 'Primary';
			case 'skedmaker.subjects.subject.actions.recolor.wheel': return 'Wheel';
			case 'skedmaker.subjects.subject.actions.recolor.shades': return 'Shades';
			case 'skedmaker.subjects.subject.actions.delete.name': return 'I-delete';
			case 'skedmaker.subjects.subject.actions.delete.warning': return ({required Object subject}) => 'I-delete ang ${subject}? \n\'Di mo \'to ma-uundelete.';
			case 'skedmaker.subjects.subject.actions.showhide': return 'I-show/I-hide';
			case 'skedmaker.subjects.subject.actions.offeringAdd': return 'Mag-add ng offering';
			case 'skedmaker.subjects.subject.actions.offeringDelete.name': return 'Mag-delete ng offering';
			case 'skedmaker.subjects.subject.actions.offeringDelete.warning': return 'I-delete \'tong offering? \n\'Di mo \'to ma-uundelete.';
			case 'skedmaker.subjects.subject.actions.offeringCloseAll': return 'I-close lahat ng offerings';
			case 'skedmaker.subjects.subject.actions.offeringOpenAll': return 'I-open lahat ng offerings';
			case 'skedmaker.subjects.subject.table.status.name': return 'Status';
			case 'skedmaker.subjects.subject.table.status.open': return 'Naka-open';
			case 'skedmaker.subjects.subject.table.status.closed': return 'Naka-close';
			case 'skedmaker.subjects.subject.table.classno.name': return 'Class \#';
			case 'skedmaker.subjects.subject.table.classno.edit': return 'I-edit ang class number:';
			case 'skedmaker.subjects.subject.table.section.name': return 'Section';
			case 'skedmaker.subjects.subject.table.section.edit': return 'I-edit ang section:';
			case 'skedmaker.subjects.subject.table.room.name': return 'Room';
			case 'skedmaker.subjects.subject.table.room.edit': return 'I-edit ang room (puwedeng empty):';
			case 'skedmaker.subjects.subject.table.day.name': return 'Day';
			case 'skedmaker.subjects.subject.table.day.edit': return 'I-edit ang day:';
			case 'skedmaker.subjects.subject.table.time.name': return 'Time';
			case 'skedmaker.subjects.subject.table.time.data': return ({required Object from, required Object to}) => '${from} - ${to}';
			case 'skedmaker.subjects.subject.table.time.edit': return 'I-edit ang time:';
			case 'skedmaker.subjects.subject.table.time.to': return ' to ';
			case 'skedmaker.subjects.subject.table.time.secondTimeInterval': return 'Second time interval';
			case 'skedmaker.subjects.subject.table.time.errorStartTimeBeforeEndTime': return 'Ang start time ay dapat before sa end time';
			case 'skedmaker.subjects.subject.table.time.errorSecondTimeInterval': return 'Dapat mayroon itong second time interval';
			case 'skedmaker.subjects.subject.table.time.errorConflict': return 'Ang dalawang time intervals ay \'di dapat mang-conflict kasi same day sila';
			case 'skedmaker.subjects.subject.table.teacher.name': return 'Teacher';
			case 'skedmaker.subjects.subject.table.teacher.edit': return 'I-edit ang teacher (puwedeng empty):';
			case 'skedmaker.subjects.subject.table.slots.name': return 'Slots';
			case 'skedmaker.subjects.subject.table.slots.data': return ({required Object taken, required Object capacity}) => '${taken} / ${capacity}';
			case 'skedmaker.subjects.subject.table.slots.percent': return ({required Object percent}) => '${percent}%';
			case 'skedmaker.subjects.subject.table.slots.edit': return 'I-edit ang slots:';
			case 'skedmaker.subjects.subject.table.slots.outOf': return ' out of ';
			case 'skedmaker.subjects.subject.table.remarks.name': return 'Remarks';
			case 'skedmaker.subjects.subject.table.remarks.edit': return 'I-edit ang remarks (puwedeng empty):';
			case 'skedmaker.subjects.subject.infobar.noAvailableOffering': return ({required Object subject}) => '${subject} ay walang available na offering.';
			case 'skedmaker.subjects.subject.infobar.hidden': return ({required Object subject}) => 'Naka-hide ang ${subject}. Hindi ito included kapag nag-gegenerate ng mga schedule.';
			case 'skedmaker.subjects.empty.title': return ({required Object subject}) => '${subject} ay walang offerings';
			case 'skedmaker.filters.name': return 'Filters';
			case 'skedmaker.filters.categories.offerings.name': return 'Mga offering';
			case 'skedmaker.filters.categories.offerings.desc': return 'I-filter ang mga offerings na i-iinclude at i-eexclude';
			case 'skedmaker.filters.categories.offerings.includeClosed.name': return 'I-include ang mga closed na offerings';
			case 'skedmaker.filters.categories.offerings.includeClosed.desc': return 'I-enable para i-ignore ang status nito (regardless kung open o closed)';
			case 'skedmaker.filters.categories.offerings.includeFullSlots.name': return 'I-include ang offerings na full ang slots';
			case 'skedmaker.filters.categories.offerings.includeFullSlots.desc': return 'I-enable para i-ignore ang slot capacity nito';
			case 'skedmaker.filters.categories.offerings.includeUnknownModality.name': return 'I-include ang offerings na unknown ang modality';
			case 'skedmaker.filters.categories.offerings.includeNoTeachers.name': return 'I-include ang offerings na walang teacher';
			case 'skedmaker.filters.categories.offerings.excludeSectionLetter.name': return 'I-exclude ang sections na nag-cocontain ng gan\'to';
			case 'skedmaker.filters.categories.offerings.excludeSectionLetter.desc': return 'Gamitin \'to para mag-exclude ng offerings na ang section ay may gan\'tong letter(s)';
			case 'skedmaker.filters.categories.offerings.excludeRemarksLetter.name': return 'I-exclude ang remarks na nag-cocontain ng gan\'to';
			case 'skedmaker.filters.categories.offerings.excludeRemarksLetter.desc': return 'Gamitin \'to para mag-exclude ng offerings na ang remark ay may gan\'tong letter(s)';
			case 'skedmaker.filters.categories.offerings.includeFreshmanBlock.name': return 'I-include ang freshman block';
			case 'skedmaker.filters.categories.day.name': return 'Specific sa day';
			case 'skedmaker.filters.categories.day.desc': return 'Mag-add ng specific filters kada araw ng linggo';
			case 'skedmaker.filters.categories.day.commonMaxNumberOfSubjects.name': return 'Maximum na bilang ng subjects';
			case 'skedmaker.filters.categories.day.commonMaxNumberOfSubjects.desc': return 'I-enter ang -1 \'pag walang limit; I-enter ang 0 \'pag wala talangang subjects';
			case 'skedmaker.filters.categories.day.commonTimeInterval.name': return 'Dapat may subjects lang sa gan\'tong time interval';
			case 'skedmaker.filters.categories.day.commonModality.name': return 'Modality ng subjects';
			case 'skedmaker.filters.categories.day.commonModality.hybrid': return 'Online o face-to-face';
			case 'skedmaker.filters.categories.day.commonModality.online': return 'Online';
			case 'skedmaker.filters.categories.day.commonModality.face': return 'Face-to-face';
			case 'skedmaker.filters.categories.day.commonModality.any': return 'Kahit anong modality';
			case 'skedmaker.filters.categories.day.commonModality.unknown': return 'Unknown na modality';
			case 'skedmaker.filters.categories.day.commonStartWithSubject.name': return 'First subject ng araw';
			case 'skedmaker.filters.categories.day.commonEndWithSubject.name': return 'Last subject ng araw';
			case 'skedmaker.filters.categories.day.commonBreaktime.name': return 'Breaktime';
			case 'skedmaker.filters.categories.day.commonBreaktime.desc': return 'Oras na dapat walang subjects';
			case 'skedmaker.filters.categories.day.mondayName': return 'Monday';
			case 'skedmaker.filters.categories.day.tuesdayName': return 'Tuesday';
			case 'skedmaker.filters.categories.day.wednesdayName': return 'Wednesday';
			case 'skedmaker.filters.categories.day.thursdayName': return 'Thursday';
			case 'skedmaker.filters.categories.day.fridayName': return 'Friday';
			case 'skedmaker.filters.categories.day.saturdayName': return 'Saturday';
			case 'skedmaker.filters.categories.location.name': return 'Location (experimental)';
			case 'skedmaker.filters.categories.location.desc': return 'I-filter ang schedules base sa location ng offering';
			case 'skedmaker.filters.categories.location.enabled.name': return 'I-enable ang pag-filter gamit ang location at distance';
			case 'skedmaker.filters.categories.location.enabled.desc': return 'I-coconsider nito ang distance ng: Previous class → ground floor → \nground floor ng next class → next class. \'Pag both ay \nnasa same building, ang distance mula previous hanggang next lang.';
			case 'skedmaker.filters.categories.location.checkingDistanceMinutes.name': return 'Time gap between subjects para i-check ang distance (in minutes)';
			case 'skedmaker.filters.categories.location.maxAllowedDistanceMeters.name': return 'Maximum distance mula sa isang subject hanggang sa next (in meters)';
			case 'skedmaker.filters.categories.location.calculator.name': return 'I-open ang distance calculator';
			case 'skedmaker.filters.categories.location.calculator.title': return 'Distance calculator';
			case 'skedmaker.filters.categories.location.calculator.desc': return 'Note: Estimate lang ito.';
			case 'skedmaker.filters.categories.location.calculator.from': return 'From:';
			case 'skedmaker.filters.categories.location.calculator.to': return 'To:';
			case 'skedmaker.filters.categories.location.calculator.hint': return 'Room code (eg. A1105)';
			case 'skedmaker.filters.categories.location.calculator.calculate': return 'Calculate';
			case 'skedmaker.filters.categories.location.calculator.result': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tl'))(n,
				one: '~${n} meter',
				other: '~${n} meters',
			);
			case 'skedmaker.filters.any': return 'Any na subject';
			case 'skedmaker.filters.reset': return 'I-reset lahat';
			case 'skedmaker.schedules.name': return 'Schedules';
			case 'skedmaker.schedules.generate.title': return 'Mag-generate ng possible schedules';
			case 'skedmaker.schedules.generate.button': return 'Generate';
			case 'skedmaker.schedules.generate.pending': return 'No schedules found pa. Medyo matagal \'to.';
			case 'skedmaker.schedules.generate.found': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tl'))(n,
				one: '${n} schedule found',
				other: '${n} schedules found',
			);
			case 'skedmaker.schedules.generate.progress': return ({required Object percent}) => '${percent}% complete';
			case 'skedmaker.schedules.generate.none': return 'No schedules found. Baká i-check ang mga filters mo tapós try ulit.';
			case 'skedmaker.schedules.commandbar.rename.name': return 'I-rename';
			case 'skedmaker.schedules.commandbar.rename.edit': return 'Mag-enter ng bagong name';
			case 'skedmaker.schedules.commandbar.delete.name': return 'I-delete';
			case 'skedmaker.schedules.commandbar.delete.desc': return ({required Object name}) => 'I-delete ang ${name}?\n\'Di mo \'to ma-uundelete..\nMadedelete lahat ng tabs with this schedule.\n';
			case 'skedmaker.schedules.commandbar.star.star': return 'I-star';
			case 'skedmaker.schedules.commandbar.star.unstar': return 'I-unstar';
			case 'skedmaker.schedules.commandbar.saveImage.name': return 'I-save as image';
			case 'skedmaker.schedules.commandbar.saveImage.title': return 'Save as image';
			case 'skedmaker.schedules.commandbar.saveImage.desc': return 'I-resize \'tong window para i-adjust ang formatting. \'Pag tapos, i-click ang "${_root.general.general.save}".';
			case 'skedmaker.schedules.commandbar.saveImage.credits': return ({required InlineSpanBuilder name}) => TextSpan(children: [
				const TextSpan(text: 'na-generate ng '),
				name(_root.skedmaker.info.nameFull),
			]);
			case 'skedmaker.schedules.details.name': return 'Details';
			case 'skedmaker.schedules.details.notes': return 'Notes';
			case 'skedmaker.schedules.details.subjects': return 'Subjects';
			case 'skedmaker.schedules.info.name': return 'Info';
			case 'skedmaker.schedules.info.title': return 'Information';
			case 'skedmaker.schedules.info.desc': return 'Mag-select ng schedule sa left.\nI-view at i-compare multiple schedules by opening new tabs at the top.\n\nKeyboard shortcuts:\nUp/Down arrow key - pumunta sa next/previous schedule\nCtrl + T - gumawa ng new tab\nCtrl + W o Ctrl + F4 - i-close current tab\nCtrl + 1 hanggang 8 - pumunta sa first to eighth tab\nCtrl + 9 - pumunta sa last tab\n';
			case 'skedmaker.schedules.options.hoverEffects': return 'I-enable ang hover effects';
			case 'skedmaker.scheduleDay.mondayFace.name': return 'Monday (face-to-face)';
			case 'skedmaker.scheduleDay.mondayFace.nameShort': return 'M (f2f)';
			case 'skedmaker.scheduleDay.mondayOnline.name': return 'Monday (online)';
			case 'skedmaker.scheduleDay.mondayOnline.nameShort': return 'M (online)';
			case 'skedmaker.scheduleDay.mondayHybrid.name': return 'Monday (hybrid)';
			case 'skedmaker.scheduleDay.mondayHybrid.nameShort': return 'M (hybrid)';
			case 'skedmaker.scheduleDay.mondayUnknown.name': return 'Monday';
			case 'skedmaker.scheduleDay.mondayUnknown.nameShort': return 'M';
			case 'skedmaker.scheduleDay.tuesdayFace.name': return 'Tuesday (face-to-face)';
			case 'skedmaker.scheduleDay.tuesdayFace.nameShort': return 'T (f2f)';
			case 'skedmaker.scheduleDay.tuesdayOnline.name': return 'Tuesday (online)';
			case 'skedmaker.scheduleDay.tuesdayOnline.nameShort': return 'T (online)';
			case 'skedmaker.scheduleDay.tuesdayHybrid.name': return 'Tuesday (hybrid)';
			case 'skedmaker.scheduleDay.tuesdayHybrid.nameShort': return 'T (hybrid)';
			case 'skedmaker.scheduleDay.tuesdayUnknown.name': return 'Tuesday';
			case 'skedmaker.scheduleDay.tuesdayUnknown.nameShort': return 'T';
			case 'skedmaker.scheduleDay.wednesdayFace.name': return 'Wednesday (face-to-face)';
			case 'skedmaker.scheduleDay.wednesdayFace.nameShort': return 'W (f2f)';
			case 'skedmaker.scheduleDay.wednesdayOnline.name': return 'Wednesday (online)';
			case 'skedmaker.scheduleDay.wednesdayOnline.nameShort': return 'W (online)';
			case 'skedmaker.scheduleDay.wednesdayHybrid.name': return 'Wednesday (hybrid)';
			case 'skedmaker.scheduleDay.wednesdayHybrid.nameShort': return 'W (hybrid)';
			case 'skedmaker.scheduleDay.wednesdayUnknown.name': return 'Wednesday';
			case 'skedmaker.scheduleDay.wednesdayUnknown.nameShort': return 'W';
			case 'skedmaker.scheduleDay.thursdayFace.name': return 'Thursday (face-to-face)';
			case 'skedmaker.scheduleDay.thursdayFace.nameShort': return 'H (f2f)';
			case 'skedmaker.scheduleDay.thursdayOnline.name': return 'Thursday (online)';
			case 'skedmaker.scheduleDay.thursdayOnline.nameShort': return 'H (online)';
			case 'skedmaker.scheduleDay.thursdayHybrid.name': return 'Thursday (hybrid)';
			case 'skedmaker.scheduleDay.thursdayHybrid.nameShort': return 'H (hybrid)';
			case 'skedmaker.scheduleDay.thursdayUnknown.name': return 'Thursday';
			case 'skedmaker.scheduleDay.thursdayUnknown.nameShort': return 'H';
			case 'skedmaker.scheduleDay.fridayFace.name': return 'Friday (face-to-face)';
			case 'skedmaker.scheduleDay.fridayFace.nameShort': return 'F (f2f)';
			case 'skedmaker.scheduleDay.fridayOnline.name': return 'Friday (online)';
			case 'skedmaker.scheduleDay.fridayOnline.nameShort': return 'F (online)';
			case 'skedmaker.scheduleDay.fridayHybrid.name': return 'Friday (hybrid)';
			case 'skedmaker.scheduleDay.fridayHybrid.nameShort': return 'F (hybrid)';
			case 'skedmaker.scheduleDay.fridayUnknown.name': return 'Friday';
			case 'skedmaker.scheduleDay.fridayUnknown.nameShort': return 'F';
			case 'skedmaker.scheduleDay.saturdayFace.name': return 'Saturday (face-to-face)';
			case 'skedmaker.scheduleDay.saturdayFace.nameShort': return 'S (f2f)';
			case 'skedmaker.scheduleDay.saturdayOnline.name': return 'Saturday (online)';
			case 'skedmaker.scheduleDay.saturdayOnline.nameShort': return 'S (online)';
			case 'skedmaker.scheduleDay.saturdayHybrid.name': return 'Saturday (hybrid)';
			case 'skedmaker.scheduleDay.saturdayHybrid.nameShort': return 'S (hybrid)';
			case 'skedmaker.scheduleDay.saturdayUnknown.name': return 'Saturday';
			case 'skedmaker.scheduleDay.saturdayUnknown.nameShort': return 'S';
			case 'skedmaker.scheduleDay.mondaythursdayFace.name': return 'Monday at Thursday (both face-to-face)';
			case 'skedmaker.scheduleDay.mondaythursdayFace.nameShort': return 'M & H (both f2f)';
			case 'skedmaker.scheduleDay.mondaythursdayOnline.name': return 'Monday at Thursday (both online)';
			case 'skedmaker.scheduleDay.mondaythursdayOnline.nameShort': return 'M & H (both online)';
			case 'skedmaker.scheduleDay.mondaythursdayOnlineface.name': return 'Monday (online) at Thursday (face-to-face)';
			case 'skedmaker.scheduleDay.mondaythursdayOnlineface.nameShort': return 'M (online) & H (f2f)';
			case 'skedmaker.scheduleDay.mondaythursdayFaceonline.name': return 'Monday (face-to-face) at Thursday (online)';
			case 'skedmaker.scheduleDay.mondaythursdayFaceonline.nameShort': return 'M (f2f) & H (online)';
			case 'skedmaker.scheduleDay.mondaythursdayUnknown.name': return 'Monday at Thursday';
			case 'skedmaker.scheduleDay.mondaythursdayUnknown.nameShort': return 'M & H';
			case 'skedmaker.scheduleDay.tuesdayfridayFace.name': return 'Tuesday at Friday (both face-to-face)';
			case 'skedmaker.scheduleDay.tuesdayfridayFace.nameShort': return 'T & F (both f2f)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnline.name': return 'Tuesday at Friday (both online)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnline.nameShort': return 'T & F (both online)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnlineface.name': return 'Tuesday (online) at Friday (face-to-face)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnlineface.nameShort': return 'T (online) & F (f2f)';
			case 'skedmaker.scheduleDay.tuesdayfridayFaceonline.name': return 'Tuesday (face-to-face) at Friday (online)';
			case 'skedmaker.scheduleDay.tuesdayfridayFaceonline.nameShort': return 'T (f2f) & F (online)';
			case 'skedmaker.scheduleDay.tuesdayfridayUnknown.name': return 'Tuesday at Friday';
			case 'skedmaker.scheduleDay.tuesdayfridayUnknown.nameShort': return 'T & F';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFace.name': return 'Wednesday at Saturday (both face-to-face)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFace.nameShort': return 'W & S (both f2f)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnline.name': return 'Wednesday at Saturday (both online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnline.nameShort': return 'W & S (both online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnlineface.name': return 'Wednesday (online) at Saturday (face-to-face)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnlineface.nameShort': return 'W (online) & S (f2f)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFaceonline.name': return 'Wednesday (face-to-face) at Saturday (online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFaceonline.nameShort': return 'W (f2f) & S (online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayUnknown.name': return 'Wednesday at Saturday';
			case 'skedmaker.scheduleDay.wednesdaysaturdayUnknown.nameShort': return 'W & S';
			case 'skedmaker.scheduleDay.unknown.name': return 'Unknown';
			case 'skedmaker.scheduleDay.unknown.nameShort': return 'Unknown';
			case 'skedmaker.scheduleRoom.empty': return 'Walang room';
			case 'skedmaker.scheduleRoom.online': return 'Online';
			case 'skedmaker.scheduleRoom.hybrid': return ({required Object room}) => '${room} at online';
			case 'skedmaker.scheduleDefault.name': return ({required Object n}) => 'Schedule ${n}';
			case 'skedmaker.mlsCourseOfferings': return 'My.LaSalle\'s Course Offerings';
			case 'skedmaker.infobar.currentlyGeneratingSchedules': return 'Naggegenerate ng schedules ngayon. Hindi mag-aapply ang mga changes dito hanggang sa mag-generate ka ulit.';
			default: return null;
		}
	}
}


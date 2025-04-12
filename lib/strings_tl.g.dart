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
class TranslationsTl extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsTl _root = this; // ignore: unused_field

	@override 
	TranslationsTl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTl(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsGeneralTl general = _TranslationsGeneralTl._(_root);
	@override late final _TranslationsSkedmakerTl skedmaker = _TranslationsSkedmakerTl._(_root);
}

// Path: general
class _TranslationsGeneralTl extends TranslationsGeneralEn {
	_TranslationsGeneralTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsGeneralAppTl app = _TranslationsGeneralAppTl._(_root);
	@override late final _TranslationsGeneralHomeTl home = _TranslationsGeneralHomeTl._(_root);
	@override late final _TranslationsGeneralDrawerTl drawer = _TranslationsGeneralDrawerTl._(_root);
	@override late final _TranslationsGeneralFunctionsTl functions = _TranslationsGeneralFunctionsTl._(_root);
	@override late final _TranslationsGeneralGeneralTl general = _TranslationsGeneralGeneralTl._(_root);
}

// Path: skedmaker
class _TranslationsSkedmakerTl extends TranslationsSkedmakerEn {
	_TranslationsSkedmakerTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerInfoTl info = _TranslationsSkedmakerInfoTl._(_root);
	@override late final _TranslationsSkedmakerDrawerTl drawer = _TranslationsSkedmakerDrawerTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsTl subjects = _TranslationsSkedmakerSubjectsTl._(_root);
	@override late final _TranslationsSkedmakerFiltersTl filters = _TranslationsSkedmakerFiltersTl._(_root);
	@override late final _TranslationsSkedmakerSchedulesTl schedules = _TranslationsSkedmakerSchedulesTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTl scheduleDay = _TranslationsSkedmakerScheduleDayTl._(_root);
	@override late final _TranslationsSkedmakerScheduleRoomTl scheduleRoom = _TranslationsSkedmakerScheduleRoomTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDefaultTl scheduleDefault = _TranslationsSkedmakerScheduleDefaultTl._(_root);
	@override String get mlsCourseOfferings => 'Mga Alok ng Kurso sa My.LaSalle';
	@override late final _TranslationsSkedmakerInfobarTl infobar = _TranslationsSkedmakerInfobarTl._(_root);
}

// Path: general.app
class _TranslationsGeneralAppTl extends TranslationsGeneralAppEn {
	_TranslationsGeneralAppTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'AralTools';
}

// Path: general.home
class _TranslationsGeneralHomeTl extends TranslationsGeneralHomeEn {
	_TranslationsGeneralHomeTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tahanan';
	@override String get welcome => 'Maligayang pagdating!';
	@override late final _TranslationsGeneralHomeMoreTl more = _TranslationsGeneralHomeMoreTl._(_root);
}

// Path: general.drawer
class _TranslationsGeneralDrawerTl extends TranslationsGeneralDrawerEn {
	_TranslationsGeneralDrawerTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsGeneralDrawerAboutTl about = _TranslationsGeneralDrawerAboutTl._(_root);
	@override late final _TranslationsGeneralDrawerSupportTl support = _TranslationsGeneralDrawerSupportTl._(_root);
	@override late final _TranslationsGeneralDrawerGithubTl github = _TranslationsGeneralDrawerGithubTl._(_root);
	@override late final _TranslationsGeneralDrawerBugsTl bugs = _TranslationsGeneralDrawerBugsTl._(_root);
	@override late final _TranslationsGeneralDrawerLanguageTl language = _TranslationsGeneralDrawerLanguageTl._(_root);
}

// Path: general.functions
class _TranslationsGeneralFunctionsTl extends TranslationsGeneralFunctionsEn {
	_TranslationsGeneralFunctionsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsGeneralFunctionsBackToHomeTl backToHome = _TranslationsGeneralFunctionsBackToHomeTl._(_root);
	@override late final _TranslationsGeneralFunctionsNewProjectTl newProject = _TranslationsGeneralFunctionsNewProjectTl._(_root);
}

// Path: general.general
class _TranslationsGeneralGeneralTl extends TranslationsGeneralGeneralEn {
	_TranslationsGeneralGeneralTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get go => 'Pumunta';
	@override String get ok => 'Okay';
	@override late final _TranslationsGeneralGeneralOpenTl open = _TranslationsGeneralGeneralOpenTl._(_root);
	@override String get delete => 'Ibura';
	@override String get add => 'Idagdag';
	@override String get select => 'Piliin';
	@override String get save => 'Impukin';
	@override String get saveDont => '\'Wag impukin';
	@override late final _TranslationsGeneralGeneralSaveAsTl saveAs = _TranslationsGeneralGeneralSaveAsTl._(_root);
	@override String get cancel => 'Kansela';
	@override String get resume => 'Itulóy';
	@override String get pause => 'Ihinto';
	@override String get stop => 'Itigil';
	@override String get close => 'Isara';
	@override String get rename => 'Ipangalan';
	@override String get copy => 'Kopyahin';
	@override String get new_ => 'Bágo';
	@override String get moreInfo => 'Karagdagang impo';
	@override String get proceed => 'Magpatúloy';
}

// Path: skedmaker.info
class _TranslationsSkedmakerInfoTl extends TranslationsSkedmakerInfoEn {
	_TranslationsSkedmakerInfoTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'SkedMaker';
	@override String get nameFull => '${_root.general.app.name} ${_root.skedmaker.info.name}';
	@override String get desc => 'Ang awtomatikong paggawa ng iskedyul sa klase ng mga estudyante ng DLSU';
}

// Path: skedmaker.drawer
class _TranslationsSkedmakerDrawerTl extends TranslationsSkedmakerDrawerEn {
	_TranslationsSkedmakerDrawerTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerDrawerFileLocationTl fileLocation = _TranslationsSkedmakerDrawerFileLocationTl._(_root);
}

// Path: skedmaker.subjects
class _TranslationsSkedmakerSubjectsTl extends TranslationsSkedmakerSubjectsEn {
	_TranslationsSkedmakerSubjectsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Asignatura';
	@override late final _TranslationsSkedmakerSubjectsAddTl add = _TranslationsSkedmakerSubjectsAddTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTl subject = _TranslationsSkedmakerSubjectsSubjectTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsEmptyTl empty = _TranslationsSkedmakerSubjectsEmptyTl._(_root);
}

// Path: skedmaker.filters
class _TranslationsSkedmakerFiltersTl extends TranslationsSkedmakerFiltersEn {
	_TranslationsSkedmakerFiltersTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Panalà';
	@override late final _TranslationsSkedmakerFiltersCategoriesTl categories = _TranslationsSkedmakerFiltersCategoriesTl._(_root);
	@override String get any => 'Kahit anong asignatura';
	@override String get reset => 'Baguhin lahat muli';
}

// Path: skedmaker.schedules
class _TranslationsSkedmakerSchedulesTl extends TranslationsSkedmakerSchedulesEn {
	_TranslationsSkedmakerSchedulesTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Palátuntunan';
	@override late final _TranslationsSkedmakerSchedulesGenerateTl generate = _TranslationsSkedmakerSchedulesGenerateTl._(_root);
	@override late final _TranslationsSkedmakerSchedulesCommandbarTl commandbar = _TranslationsSkedmakerSchedulesCommandbarTl._(_root);
	@override late final _TranslationsSkedmakerSchedulesDetailsTl details = _TranslationsSkedmakerSchedulesDetailsTl._(_root);
	@override late final _TranslationsSkedmakerSchedulesInfoTl info = _TranslationsSkedmakerSchedulesInfoTl._(_root);
	@override late final _TranslationsSkedmakerSchedulesOptionsTl options = _TranslationsSkedmakerSchedulesOptionsTl._(_root);
}

// Path: skedmaker.scheduleDay
class _TranslationsSkedmakerScheduleDayTl extends TranslationsSkedmakerScheduleDayEn {
	_TranslationsSkedmakerScheduleDayTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerScheduleDayMondayFaceTl mondayFace = _TranslationsSkedmakerScheduleDayMondayFaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondayOnlineTl mondayOnline = _TranslationsSkedmakerScheduleDayMondayOnlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondayHybridTl mondayHybrid = _TranslationsSkedmakerScheduleDayMondayHybridTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondayUnknownTl mondayUnknown = _TranslationsSkedmakerScheduleDayMondayUnknownTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayFaceTl tuesdayFace = _TranslationsSkedmakerScheduleDayTuesdayFaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayOnlineTl tuesdayOnline = _TranslationsSkedmakerScheduleDayTuesdayOnlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayHybridTl tuesdayHybrid = _TranslationsSkedmakerScheduleDayTuesdayHybridTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayUnknownTl tuesdayUnknown = _TranslationsSkedmakerScheduleDayTuesdayUnknownTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdayFaceTl wednesdayFace = _TranslationsSkedmakerScheduleDayWednesdayFaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdayOnlineTl wednesdayOnline = _TranslationsSkedmakerScheduleDayWednesdayOnlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdayHybridTl wednesdayHybrid = _TranslationsSkedmakerScheduleDayWednesdayHybridTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdayUnknownTl wednesdayUnknown = _TranslationsSkedmakerScheduleDayWednesdayUnknownTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayThursdayFaceTl thursdayFace = _TranslationsSkedmakerScheduleDayThursdayFaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayThursdayOnlineTl thursdayOnline = _TranslationsSkedmakerScheduleDayThursdayOnlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayThursdayHybridTl thursdayHybrid = _TranslationsSkedmakerScheduleDayThursdayHybridTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayThursdayUnknownTl thursdayUnknown = _TranslationsSkedmakerScheduleDayThursdayUnknownTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayFridayFaceTl fridayFace = _TranslationsSkedmakerScheduleDayFridayFaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayFridayOnlineTl fridayOnline = _TranslationsSkedmakerScheduleDayFridayOnlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayFridayHybridTl fridayHybrid = _TranslationsSkedmakerScheduleDayFridayHybridTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayFridayUnknownTl fridayUnknown = _TranslationsSkedmakerScheduleDayFridayUnknownTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDaySaturdayFaceTl saturdayFace = _TranslationsSkedmakerScheduleDaySaturdayFaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDaySaturdayOnlineTl saturdayOnline = _TranslationsSkedmakerScheduleDaySaturdayOnlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDaySaturdayHybridTl saturdayHybrid = _TranslationsSkedmakerScheduleDaySaturdayHybridTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDaySaturdayUnknownTl saturdayUnknown = _TranslationsSkedmakerScheduleDaySaturdayUnknownTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondaythursdayFaceTl mondaythursdayFace = _TranslationsSkedmakerScheduleDayMondaythursdayFaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondaythursdayOnlineTl mondaythursdayOnline = _TranslationsSkedmakerScheduleDayMondaythursdayOnlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceTl mondaythursdayOnlineface = _TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineTl mondaythursdayFaceonline = _TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayMondaythursdayUnknownTl mondaythursdayUnknown = _TranslationsSkedmakerScheduleDayMondaythursdayUnknownTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayfridayFaceTl tuesdayfridayFace = _TranslationsSkedmakerScheduleDayTuesdayfridayFaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayfridayOnlineTl tuesdayfridayOnline = _TranslationsSkedmakerScheduleDayTuesdayfridayOnlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceTl tuesdayfridayOnlineface = _TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineTl tuesdayfridayFaceonline = _TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayTuesdayfridayUnknownTl tuesdayfridayUnknown = _TranslationsSkedmakerScheduleDayTuesdayfridayUnknownTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceTl wednesdaysaturdayFace = _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineTl wednesdaysaturdayOnline = _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTl wednesdaysaturdayOnlineface = _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTl wednesdaysaturdayFaceonline = _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownTl wednesdaysaturdayUnknown = _TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownTl._(_root);
	@override late final _TranslationsSkedmakerScheduleDayUnknownTl unknown = _TranslationsSkedmakerScheduleDayUnknownTl._(_root);
}

// Path: skedmaker.scheduleRoom
class _TranslationsSkedmakerScheduleRoomTl extends TranslationsSkedmakerScheduleRoomEn {
	_TranslationsSkedmakerScheduleRoomTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Walang silid';
	@override String get online => 'Online';
	@override String hybrid({required Object room}) => '${room} at online';
}

// Path: skedmaker.scheduleDefault
class _TranslationsSkedmakerScheduleDefaultTl extends TranslationsSkedmakerScheduleDefaultEn {
	_TranslationsSkedmakerScheduleDefaultTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String name({required Object n}) => 'Palátuntunan ${n}';
}

// Path: skedmaker.infobar
class _TranslationsSkedmakerInfobarTl extends TranslationsSkedmakerInfobarEn {
	_TranslationsSkedmakerInfobarTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get currentlyGeneratingSchedules => 'Kasalukuyang bumubuo ng mga palátuntunan. Walang epekto ang mga pagbabago rito hangga\'t bumuo ka muli.';
}

// Path: general.home.more
class _TranslationsGeneralHomeMoreTl extends TranslationsGeneralHomeMoreEn {
	_TranslationsGeneralHomeMoreTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Marami pang dadating!';
	@override String get desc => 'Abangan! :)';
}

// Path: general.drawer.about
class _TranslationsGeneralDrawerAboutTl extends TranslationsGeneralDrawerAboutEn {
	_TranslationsGeneralDrawerAboutTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Patungkol';
	@override String version({required Object version, required Object build}) => 'Bersyon ${version} build ${build}';
	@override String get copyright => 'Karapatang-sipi (C) 2024 Yivan Padsoyan';
}

// Path: general.drawer.support
class _TranslationsGeneralDrawerSupportTl extends TranslationsGeneralDrawerSupportEn {
	_TranslationsGeneralDrawerSupportTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buy Me A Coffee';
	@override String get desc => 'Suportahan ako!';
}

// Path: general.drawer.github
class _TranslationsGeneralDrawerGithubTl extends TranslationsGeneralDrawerGithubEn {
	_TranslationsGeneralDrawerGithubTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tignan ang source code';
	@override String get desc => 'Mag-ambag sa AralTools!';
}

// Path: general.drawer.bugs
class _TranslationsGeneralDrawerBugsTl extends TranslationsGeneralDrawerBugsEn {
	_TranslationsGeneralDrawerBugsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Subaybayánan ng isyu';
	@override String get desc => 'Umulat ng mga isyu dito!';
}

// Path: general.drawer.language
class _TranslationsGeneralDrawerLanguageTl extends TranslationsGeneralDrawerLanguageEn {
	_TranslationsGeneralDrawerLanguageTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String title({required Object language}) => 'Wika: ${language}';
	@override String get tooltip => 'Palitan ang wika';
}

// Path: general.functions.backToHome
class _TranslationsGeneralFunctionsBackToHomeTl extends TranslationsGeneralFunctionsBackToHomeEn {
	_TranslationsGeneralFunctionsBackToHomeTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Bumalik sa tahanan';
	@override String get title => 'Bumalik sa tahanan?';
	@override String get desc => 'Lahat ng \'di naimpok na data ay mawawala.';
}

// Path: general.functions.newProject
class _TranslationsGeneralFunctionsNewProjectTl extends TranslationsGeneralFunctionsNewProjectEn {
	_TranslationsGeneralFunctionsNewProjectTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gumawa ng bagong proyekto?';
	@override String get desc => 'Lahat ng \'di naimpok na data ay mawawala.';
}

// Path: general.general.open
class _TranslationsGeneralGeneralOpenTl extends TranslationsGeneralGeneralOpenEn {
	_TranslationsGeneralGeneralOpenTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get regular => 'Buksan';
	@override String get ellipsis => 'Buksan...';
}

// Path: general.general.saveAs
class _TranslationsGeneralGeneralSaveAsTl extends TranslationsGeneralGeneralSaveAsEn {
	_TranslationsGeneralGeneralSaveAsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get regular => 'Impukin bilang';
	@override String get ellipsis => 'Impukin bilang...';
}

// Path: skedmaker.drawer.fileLocation
class _TranslationsSkedmakerDrawerFileLocationTl extends TranslationsSkedmakerDrawerFileLocationEn {
	_TranslationsSkedmakerDrawerFileLocationTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lokasyon ng talaksán';
	@override String get empty => '-';
	@override String get open => 'Buksan ang lokasyon ng talaksán';
}

// Path: skedmaker.subjects.add
class _TranslationsSkedmakerSubjectsAddTl extends TranslationsSkedmakerSubjectsAddEn {
	_TranslationsSkedmakerSubjectsAddTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Magdagdag ng asignatura';
	@override late final _TranslationsSkedmakerSubjectsAddButtonMlsTl buttonMls = _TranslationsSkedmakerSubjectsAddButtonMlsTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsAddButtonManualTl buttonManual = _TranslationsSkedmakerSubjectsAddButtonManualTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsAddButtonCodeTl buttonCode = _TranslationsSkedmakerSubjectsAddButtonCodeTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsAddErrorParseTl errorParse = _TranslationsSkedmakerSubjectsAddErrorParseTl._(_root);
}

// Path: skedmaker.subjects.subject
class _TranslationsSkedmakerSubjectsSubjectTl extends TranslationsSkedmakerSubjectsSubjectEn {
	_TranslationsSkedmakerSubjectsSubjectTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String title({required Object subject, required Object offering, required Object available}) => '${subject} - ${offering} alok (${available} maaari)';
	@override late final _TranslationsSkedmakerSubjectsSubjectActionsTl actions = _TranslationsSkedmakerSubjectsSubjectActionsTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableTl table = _TranslationsSkedmakerSubjectsSubjectTableTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectInfobarTl infobar = _TranslationsSkedmakerSubjectsSubjectInfobarTl._(_root);
}

// Path: skedmaker.subjects.empty
class _TranslationsSkedmakerSubjectsEmptyTl extends TranslationsSkedmakerSubjectsEmptyEn {
	_TranslationsSkedmakerSubjectsEmptyTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String title({required Object subject}) => 'Ang ${subject} ay walang alok';
}

// Path: skedmaker.filters.categories
class _TranslationsSkedmakerFiltersCategoriesTl extends TranslationsSkedmakerFiltersCategoriesEn {
	_TranslationsSkedmakerFiltersCategoriesTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsTl offerings = _TranslationsSkedmakerFiltersCategoriesOfferingsTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayTl day = _TranslationsSkedmakerFiltersCategoriesDayTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesLocationTl location = _TranslationsSkedmakerFiltersCategoriesLocationTl._(_root);
}

// Path: skedmaker.schedules.generate
class _TranslationsSkedmakerSchedulesGenerateTl extends TranslationsSkedmakerSchedulesGenerateEn {
	_TranslationsSkedmakerSchedulesGenerateTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bumuo ng mga posibleng palátuntunan';
	@override String get button => 'Bumuo';
	@override String get pending => 'Wala pang nabuong talàan. Maaaring matagal ito.';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tl'))(n,
		one: '${n} nabuong palátuntunan',
		other: '${n} (na) nabuong palátuntunan',
	);
	@override String progress({required Object percent}) => '${percent}% tapos';
	@override String get none => 'Walang mahanap na palátuntunan. Marahil tignan ang iyong panalá at subukan muli.';
}

// Path: skedmaker.schedules.commandbar
class _TranslationsSkedmakerSchedulesCommandbarTl extends TranslationsSkedmakerSchedulesCommandbarEn {
	_TranslationsSkedmakerSchedulesCommandbarTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerSchedulesCommandbarRenameTl rename = _TranslationsSkedmakerSchedulesCommandbarRenameTl._(_root);
	@override late final _TranslationsSkedmakerSchedulesCommandbarDeleteTl delete = _TranslationsSkedmakerSchedulesCommandbarDeleteTl._(_root);
	@override late final _TranslationsSkedmakerSchedulesCommandbarStarTl star = _TranslationsSkedmakerSchedulesCommandbarStarTl._(_root);
	@override late final _TranslationsSkedmakerSchedulesCommandbarSaveImageTl saveImage = _TranslationsSkedmakerSchedulesCommandbarSaveImageTl._(_root);
}

// Path: skedmaker.schedules.details
class _TranslationsSkedmakerSchedulesDetailsTl extends TranslationsSkedmakerSchedulesDetailsEn {
	_TranslationsSkedmakerSchedulesDetailsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mga detalye';
	@override String get notes => 'Talâ';
	@override String get subjects => 'Mga asignatura';
}

// Path: skedmaker.schedules.info
class _TranslationsSkedmakerSchedulesInfoTl extends TranslationsSkedmakerSchedulesInfoEn {
	_TranslationsSkedmakerSchedulesInfoTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Impo';
	@override String get title => 'Impormasyon';
	@override String get desc => 'Pumili ng palátuntunan sa kaliwa.\nTignan at kumparahin ang mga palátuntunan gamit ang mga tab sa itaas.\n\nMga shortcut sa palapindutan:\nUp/Down arrow key - pumunta sa susunod/nakaraang palátuntunan\nCtrl + T - gumawa ng bagong tab\nCtrl + W o Ctrl + F4 - isara ang kasalukuyang tab\nCtrl + 1 hanggang 8 - pumunta sa una hanggang pang-walong tab\nCtrl + 9 - pumunta sa huling tab\n';
}

// Path: skedmaker.schedules.options
class _TranslationsSkedmakerSchedulesOptionsTl extends TranslationsSkedmakerSchedulesOptionsEn {
	_TranslationsSkedmakerSchedulesOptionsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get hoverEffects => 'Paganahin ang epektong hover';
}

// Path: skedmaker.scheduleDay.mondayFace
class _TranslationsSkedmakerScheduleDayMondayFaceTl extends TranslationsSkedmakerScheduleDayMondayFaceEn {
	_TranslationsSkedmakerScheduleDayMondayFaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes (face-to-face)';
	@override String get nameShort => 'Lun (f2f)';
}

// Path: skedmaker.scheduleDay.mondayOnline
class _TranslationsSkedmakerScheduleDayMondayOnlineTl extends TranslationsSkedmakerScheduleDayMondayOnlineEn {
	_TranslationsSkedmakerScheduleDayMondayOnlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes (online)';
	@override String get nameShort => 'Lun (online)';
}

// Path: skedmaker.scheduleDay.mondayHybrid
class _TranslationsSkedmakerScheduleDayMondayHybridTl extends TranslationsSkedmakerScheduleDayMondayHybridEn {
	_TranslationsSkedmakerScheduleDayMondayHybridTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes (hybrid)';
	@override String get nameShort => 'Lun (hybrid)';
}

// Path: skedmaker.scheduleDay.mondayUnknown
class _TranslationsSkedmakerScheduleDayMondayUnknownTl extends TranslationsSkedmakerScheduleDayMondayUnknownEn {
	_TranslationsSkedmakerScheduleDayMondayUnknownTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes';
	@override String get nameShort => 'Lun';
}

// Path: skedmaker.scheduleDay.tuesdayFace
class _TranslationsSkedmakerScheduleDayTuesdayFaceTl extends TranslationsSkedmakerScheduleDayTuesdayFaceEn {
	_TranslationsSkedmakerScheduleDayTuesdayFaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes (face-to-face)';
	@override String get nameShort => 'Mar (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayOnline
class _TranslationsSkedmakerScheduleDayTuesdayOnlineTl extends TranslationsSkedmakerScheduleDayTuesdayOnlineEn {
	_TranslationsSkedmakerScheduleDayTuesdayOnlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes (online)';
	@override String get nameShort => 'Mar (online)';
}

// Path: skedmaker.scheduleDay.tuesdayHybrid
class _TranslationsSkedmakerScheduleDayTuesdayHybridTl extends TranslationsSkedmakerScheduleDayTuesdayHybridEn {
	_TranslationsSkedmakerScheduleDayTuesdayHybridTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes (hybrid)';
	@override String get nameShort => 'Mar (hybrid)';
}

// Path: skedmaker.scheduleDay.tuesdayUnknown
class _TranslationsSkedmakerScheduleDayTuesdayUnknownTl extends TranslationsSkedmakerScheduleDayTuesdayUnknownEn {
	_TranslationsSkedmakerScheduleDayTuesdayUnknownTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes';
	@override String get nameShort => 'Mar';
}

// Path: skedmaker.scheduleDay.wednesdayFace
class _TranslationsSkedmakerScheduleDayWednesdayFaceTl extends TranslationsSkedmakerScheduleDayWednesdayFaceEn {
	_TranslationsSkedmakerScheduleDayWednesdayFaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules (face-to-face)';
	@override String get nameShort => 'Miy (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdayOnline
class _TranslationsSkedmakerScheduleDayWednesdayOnlineTl extends TranslationsSkedmakerScheduleDayWednesdayOnlineEn {
	_TranslationsSkedmakerScheduleDayWednesdayOnlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules (online)';
	@override String get nameShort => 'Miy (online)';
}

// Path: skedmaker.scheduleDay.wednesdayHybrid
class _TranslationsSkedmakerScheduleDayWednesdayHybridTl extends TranslationsSkedmakerScheduleDayWednesdayHybridEn {
	_TranslationsSkedmakerScheduleDayWednesdayHybridTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules (hybrid)';
	@override String get nameShort => 'Miy (hybrid)';
}

// Path: skedmaker.scheduleDay.wednesdayUnknown
class _TranslationsSkedmakerScheduleDayWednesdayUnknownTl extends TranslationsSkedmakerScheduleDayWednesdayUnknownEn {
	_TranslationsSkedmakerScheduleDayWednesdayUnknownTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules';
	@override String get nameShort => 'Miy';
}

// Path: skedmaker.scheduleDay.thursdayFace
class _TranslationsSkedmakerScheduleDayThursdayFaceTl extends TranslationsSkedmakerScheduleDayThursdayFaceEn {
	_TranslationsSkedmakerScheduleDayThursdayFaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Huwebes (face-to-face)';
	@override String get nameShort => 'Huw (f2f)';
}

// Path: skedmaker.scheduleDay.thursdayOnline
class _TranslationsSkedmakerScheduleDayThursdayOnlineTl extends TranslationsSkedmakerScheduleDayThursdayOnlineEn {
	_TranslationsSkedmakerScheduleDayThursdayOnlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Huwebes (online)';
	@override String get nameShort => 'Huw (online)';
}

// Path: skedmaker.scheduleDay.thursdayHybrid
class _TranslationsSkedmakerScheduleDayThursdayHybridTl extends TranslationsSkedmakerScheduleDayThursdayHybridEn {
	_TranslationsSkedmakerScheduleDayThursdayHybridTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Huwebes (hybrid)';
	@override String get nameShort => 'Huw (hybrid)';
}

// Path: skedmaker.scheduleDay.thursdayUnknown
class _TranslationsSkedmakerScheduleDayThursdayUnknownTl extends TranslationsSkedmakerScheduleDayThursdayUnknownEn {
	_TranslationsSkedmakerScheduleDayThursdayUnknownTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Huwebes';
	@override String get nameShort => 'Huw';
}

// Path: skedmaker.scheduleDay.fridayFace
class _TranslationsSkedmakerScheduleDayFridayFaceTl extends TranslationsSkedmakerScheduleDayFridayFaceEn {
	_TranslationsSkedmakerScheduleDayFridayFaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Biyernes (face-to-face)';
	@override String get nameShort => 'Biy (f2f)';
}

// Path: skedmaker.scheduleDay.fridayOnline
class _TranslationsSkedmakerScheduleDayFridayOnlineTl extends TranslationsSkedmakerScheduleDayFridayOnlineEn {
	_TranslationsSkedmakerScheduleDayFridayOnlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Biyernes (online)';
	@override String get nameShort => 'Biy (online)';
}

// Path: skedmaker.scheduleDay.fridayHybrid
class _TranslationsSkedmakerScheduleDayFridayHybridTl extends TranslationsSkedmakerScheduleDayFridayHybridEn {
	_TranslationsSkedmakerScheduleDayFridayHybridTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Biyernes (hybrid)';
	@override String get nameShort => 'Biy (hybrid)';
}

// Path: skedmaker.scheduleDay.fridayUnknown
class _TranslationsSkedmakerScheduleDayFridayUnknownTl extends TranslationsSkedmakerScheduleDayFridayUnknownEn {
	_TranslationsSkedmakerScheduleDayFridayUnknownTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Biyernes';
	@override String get nameShort => 'Biy';
}

// Path: skedmaker.scheduleDay.saturdayFace
class _TranslationsSkedmakerScheduleDaySaturdayFaceTl extends TranslationsSkedmakerScheduleDaySaturdayFaceEn {
	_TranslationsSkedmakerScheduleDaySaturdayFaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Sabado (face-to-face)';
	@override String get nameShort => 'Sab (f2f)';
}

// Path: skedmaker.scheduleDay.saturdayOnline
class _TranslationsSkedmakerScheduleDaySaturdayOnlineTl extends TranslationsSkedmakerScheduleDaySaturdayOnlineEn {
	_TranslationsSkedmakerScheduleDaySaturdayOnlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Sabado (online)';
	@override String get nameShort => 'Sab (online)';
}

// Path: skedmaker.scheduleDay.saturdayHybrid
class _TranslationsSkedmakerScheduleDaySaturdayHybridTl extends TranslationsSkedmakerScheduleDaySaturdayHybridEn {
	_TranslationsSkedmakerScheduleDaySaturdayHybridTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Sabado (hybrid)';
	@override String get nameShort => 'Sab (hybrid)';
}

// Path: skedmaker.scheduleDay.saturdayUnknown
class _TranslationsSkedmakerScheduleDaySaturdayUnknownTl extends TranslationsSkedmakerScheduleDaySaturdayUnknownEn {
	_TranslationsSkedmakerScheduleDaySaturdayUnknownTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Sabado';
	@override String get nameShort => 'Sab';
}

// Path: skedmaker.scheduleDay.mondaythursdayFace
class _TranslationsSkedmakerScheduleDayMondaythursdayFaceTl extends TranslationsSkedmakerScheduleDayMondaythursdayFaceEn {
	_TranslationsSkedmakerScheduleDayMondaythursdayFaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes at Huwebes (parehong face-to-face)';
	@override String get nameShort => 'Lun & Huw (parehong f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnline
class _TranslationsSkedmakerScheduleDayMondaythursdayOnlineTl extends TranslationsSkedmakerScheduleDayMondaythursdayOnlineEn {
	_TranslationsSkedmakerScheduleDayMondaythursdayOnlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes at Huwebes  (parehong online)';
	@override String get nameShort => 'Lun & Huw (parehong online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnlineface
class _TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceTl extends TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceEn {
	_TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes (online) at Huwebes (face-to-face)';
	@override String get nameShort => 'Lun (online) & Huw (f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayFaceonline
class _TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineTl extends TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineEn {
	_TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes (face-to-face) at Huwebes (online)';
	@override String get nameShort => 'Lun (f2f) & Huw (online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayUnknown
class _TranslationsSkedmakerScheduleDayMondaythursdayUnknownTl extends TranslationsSkedmakerScheduleDayMondaythursdayUnknownEn {
	_TranslationsSkedmakerScheduleDayMondaythursdayUnknownTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes';
	@override String get nameShort => 'Lun & Huw';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFace
class _TranslationsSkedmakerScheduleDayTuesdayfridayFaceTl extends TranslationsSkedmakerScheduleDayTuesdayfridayFaceEn {
	_TranslationsSkedmakerScheduleDayTuesdayfridayFaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes at Biyernes (parehong face-to-face)';
	@override String get nameShort => 'Mar & Biy (parehong f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnline
class _TranslationsSkedmakerScheduleDayTuesdayfridayOnlineTl extends TranslationsSkedmakerScheduleDayTuesdayfridayOnlineEn {
	_TranslationsSkedmakerScheduleDayTuesdayfridayOnlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes at Biyernes (both online)';
	@override String get nameShort => 'Mar & Biy (both online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnlineface
class _TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceTl extends TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn {
	_TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes (online) at Biyernes (face-to-face)';
	@override String get nameShort => 'Mar (online) & Biy (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFaceonline
class _TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineTl extends TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineEn {
	_TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes (face-to-face) at Biyernes (online)';
	@override String get nameShort => 'Mar (f2f) & Biy (online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayUnknown
class _TranslationsSkedmakerScheduleDayTuesdayfridayUnknownTl extends TranslationsSkedmakerScheduleDayTuesdayfridayUnknownEn {
	_TranslationsSkedmakerScheduleDayTuesdayfridayUnknownTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes at Biyernes';
	@override String get nameShort => 'Mar & Biy';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFace
class _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceTl extends TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceEn {
	_TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules at Sabado (parehong face-to-face)';
	@override String get nameShort => 'Miy & Sab (parehong f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnline
class _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineTl extends TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineEn {
	_TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules at Sabado (both online)';
	@override String get nameShort => 'Miy & Sab (both online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnlineface
class _TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTl extends TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn {
	_TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules (online) at Sabado (face-to-face)';
	@override String get nameShort => 'Miy (online) & Sab (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFaceonline
class _TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTl extends TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn {
	_TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules (face-to-face) at Sabado (online)';
	@override String get nameShort => 'Miy (f2f) & Sab (online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayUnknown
class _TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownTl extends TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownEn {
	_TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules at Sabado';
	@override String get nameShort => 'Miy & Sab';
}

// Path: skedmaker.scheduleDay.unknown
class _TranslationsSkedmakerScheduleDayUnknownTl extends TranslationsSkedmakerScheduleDayUnknownEn {
	_TranslationsSkedmakerScheduleDayUnknownTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Hindi alam';
	@override String get nameShort => '\'Di alam';
}

// Path: skedmaker.subjects.add.buttonMls
class _TranslationsSkedmakerSubjectsAddButtonMlsTl extends TranslationsSkedmakerSubjectsAddButtonMlsEn {
	_TranslationsSkedmakerSubjectsAddButtonMlsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Magdagdag mula My.LaSalle';
	@override String get title => 'Magdagdag ng asignatura';
	@override String get desc => 'Ilagay ang iyong numero ng ID at ang code ng asignatura sa bagong durungawan. Nang nakalista na ang mga alok, pindutin ang "${_root.general.general.add}".';
	@override String get webviewTitle => 'Hindi naka-install ang WebView2';
	@override TextSpan webviewDesc({required InlineSpanBuilder webview, required InlineSpanBuilder learn}) => TextSpan(children: [
		const TextSpan(text: 'Kailangan mong i-download at i-install ang '),
		webview('Microsoft Edge WebView2 Runtime'),
		const TextSpan(text: ' para magamit ang My.LaSalle sa loob ng AralTools SkedMaker. Ito\'y kasama na sa Windows 11, ngunit wala sa device mo.\n\n'),
		learn('Pindutin ito upang matuto pa.'),
	]);
}

// Path: skedmaker.subjects.add.buttonManual
class _TranslationsSkedmakerSubjectsAddButtonManualTl extends TranslationsSkedmakerSubjectsAddButtonManualEn {
	_TranslationsSkedmakerSubjectsAddButtonManualTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Magdagdag nang manu-mano';
	@override String get title => 'Gumawa ng bagong asignatura';
	@override String get desc => 'Maglagay ng 7 karakter na code ng asignatura:';
}

// Path: skedmaker.subjects.add.buttonCode
class _TranslationsSkedmakerSubjectsAddButtonCodeTl extends TranslationsSkedmakerSubjectsAddButtonCodeEn {
	_TranslationsSkedmakerSubjectsAddButtonCodeTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Magdagdag gamit code';
	@override String get title => 'Magdagdag ng asignatura gamit code';
	@override TextSpan desc({required InlineSpanBuilder mls}) => TextSpan(children: [
		const TextSpan(text: 'Buksan ang '),
		mls(_root.skedmaker.mlsCourseOfferings),
		const TextSpan(text: ' sa browser at ilagay ang iyong ID number at ang code ng asignatura. Nang natalá na ang mga alok, buksan ang Developer Console at ilagay ang command na ito:\n'),
	]);
	@override String get field => 'Kopyahin ang kinalalabasan at ilagay dito:';
	@override String get hint => 'Kinalalabasan ng command';
	@override String get error => 'Mali ang nàilagay';
}

// Path: skedmaker.subjects.add.errorParse
class _TranslationsSkedmakerSubjectsAddErrorParseTl extends TranslationsSkedmakerSubjectsAddErrorParseEn {
	_TranslationsSkedmakerSubjectsAddErrorParseTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kamalian habang binabása';
	@override String get messagebox => 'Ang mga alok na ito ay hindi maibása.';
	@override String get footer => 'Kapag magtutuloy ay mabubura ang mga alok na ito.';
}

// Path: skedmaker.subjects.subject.actions
class _TranslationsSkedmakerSubjectsSubjectActionsTl extends TranslationsSkedmakerSubjectsSubjectActionsEn {
	_TranslationsSkedmakerSubjectsSubjectActionsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerSubjectsSubjectActionsRecolorTl recolor = _TranslationsSkedmakerSubjectsSubjectActionsRecolorTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectActionsDeleteTl delete = _TranslationsSkedmakerSubjectsSubjectActionsDeleteTl._(_root);
	@override String get showhide => 'Ipakita/Itago';
	@override String get offeringAdd => 'Magdagdag ng alok';
	@override late final _TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteTl offeringDelete = _TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteTl._(_root);
	@override String get offeringCloseAll => 'Isara lahat ng alok';
	@override String get offeringOpenAll => 'Ibukás lahat ng alok';
}

// Path: skedmaker.subjects.subject.table
class _TranslationsSkedmakerSubjectsSubjectTableTl extends TranslationsSkedmakerSubjectsSubjectTableEn {
	_TranslationsSkedmakerSubjectsSubjectTableTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSkedmakerSubjectsSubjectTableStatusTl status = _TranslationsSkedmakerSubjectsSubjectTableStatusTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableClassnoTl classno = _TranslationsSkedmakerSubjectsSubjectTableClassnoTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableSectionTl section = _TranslationsSkedmakerSubjectsSubjectTableSectionTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableRoomTl room = _TranslationsSkedmakerSubjectsSubjectTableRoomTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableDayTl day = _TranslationsSkedmakerSubjectsSubjectTableDayTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableTimeTl time = _TranslationsSkedmakerSubjectsSubjectTableTimeTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableTeacherTl teacher = _TranslationsSkedmakerSubjectsSubjectTableTeacherTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableSlotsTl slots = _TranslationsSkedmakerSubjectsSubjectTableSlotsTl._(_root);
	@override late final _TranslationsSkedmakerSubjectsSubjectTableRemarksTl remarks = _TranslationsSkedmakerSubjectsSubjectTableRemarksTl._(_root);
}

// Path: skedmaker.subjects.subject.infobar
class _TranslationsSkedmakerSubjectsSubjectInfobarTl extends TranslationsSkedmakerSubjectsSubjectInfobarEn {
	_TranslationsSkedmakerSubjectsSubjectInfobarTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String noAvailableOffering({required Object subject}) => 'Walang maaaring alok ang ${subject}.';
	@override String hidden({required Object subject}) => 'Nakatago ang ${subject}. Hindi ito maisasama kapag bumubuo ng palátuntunan.';
}

// Path: skedmaker.filters.categories.offerings
class _TranslationsSkedmakerFiltersCategoriesOfferingsTl extends TranslationsSkedmakerFiltersCategoriesOfferingsEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Alok';
	@override String get desc => 'Ipanalà ang mga alok kung ano ang isasama';
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedTl includeClosed = _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTl includeFullSlots = _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTl includeUnknownModality = _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTl includeNoTeachers = _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTl excludeSectionLetter = _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterTl excludeRemarksLetter = _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTl includeFreshmanBlock = _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTl._(_root);
}

// Path: skedmaker.filters.categories.day
class _TranslationsSkedmakerFiltersCategoriesDayTl extends TranslationsSkedmakerFiltersCategoriesDayEn {
	_TranslationsSkedmakerFiltersCategoriesDayTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tiyak na araw';
	@override String get desc => 'Mga panalà sa kada araw ng linggo';
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTl commonMaxNumberOfSubjects = _TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalTl commonTimeInterval = _TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonModalityTl commonModality = _TranslationsSkedmakerFiltersCategoriesDayCommonModalityTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTl commonStartWithSubject = _TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTl commonEndWithSubject = _TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeTl commonBreaktime = _TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeTl._(_root);
	@override String get mondayName => 'Lunes';
	@override String get tuesdayName => 'Martes';
	@override String get wednesdayName => 'Miyerkules';
	@override String get thursdayName => 'Huwebes';
	@override String get fridayName => 'Biyernes';
	@override String get saturdayName => 'Sabado';
}

// Path: skedmaker.filters.categories.location
class _TranslationsSkedmakerFiltersCategoriesLocationTl extends TranslationsSkedmakerFiltersCategoriesLocationEn {
	_TranslationsSkedmakerFiltersCategoriesLocationTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lokasyon (tílawin)';
	@override String get desc => 'Ipanalà ang mga alok base sa kanilang lokasyon';
	@override late final _TranslationsSkedmakerFiltersCategoriesLocationEnabledTl enabled = _TranslationsSkedmakerFiltersCategoriesLocationEnabledTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTl checkingDistanceMinutes = _TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTl maxAllowedDistanceMeters = _TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTl._(_root);
	@override late final _TranslationsSkedmakerFiltersCategoriesLocationCalculatorTl calculator = _TranslationsSkedmakerFiltersCategoriesLocationCalculatorTl._(_root);
}

// Path: skedmaker.schedules.commandbar.rename
class _TranslationsSkedmakerSchedulesCommandbarRenameTl extends TranslationsSkedmakerSchedulesCommandbarRenameEn {
	_TranslationsSkedmakerSchedulesCommandbarRenameTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pangalánin';
	@override String get edit => 'Maglagay ng bagong pangalan';
}

// Path: skedmaker.schedules.commandbar.delete
class _TranslationsSkedmakerSchedulesCommandbarDeleteTl extends TranslationsSkedmakerSchedulesCommandbarDeleteEn {
	_TranslationsSkedmakerSchedulesCommandbarDeleteTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Burahin';
	@override String desc({required Object name}) => 'Burahin ang ${name}?\nHindi mo ito maibabalik.\nMabubura rin ang lahat ng tab na may ganitong talàan.\n';
}

// Path: skedmaker.schedules.commandbar.star
class _TranslationsSkedmakerSchedulesCommandbarStarTl extends TranslationsSkedmakerSchedulesCommandbarStarEn {
	_TranslationsSkedmakerSchedulesCommandbarStarTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get star => 'Ibituin';
	@override String get unstar => '\'Wag ibituin';
}

// Path: skedmaker.schedules.commandbar.saveImage
class _TranslationsSkedmakerSchedulesCommandbarSaveImageTl extends TranslationsSkedmakerSchedulesCommandbarSaveImageEn {
	_TranslationsSkedmakerSchedulesCommandbarSaveImageTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Iimpok bilang larawan';
	@override String get title => 'Iimpok bilang larawan';
	@override String get desc => 'Palitan ang laki ng durungawan para maayos ang larawan. Pagkatapos, pindutin ang "${_root.general.general.save}".';
	@override TextSpan credits({required InlineSpanBuilder name}) => TextSpan(children: [
		const TextSpan(text: 'binuo ng '),
		name(_root.skedmaker.info.nameFull),
	]);
}

// Path: skedmaker.subjects.subject.actions.recolor
class _TranslationsSkedmakerSubjectsSubjectActionsRecolorTl extends TranslationsSkedmakerSubjectsSubjectActionsRecolorEn {
	_TranslationsSkedmakerSubjectsSubjectActionsRecolorTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Kulayin';
	@override String get title => 'Pumili ng kulay';
	@override String get primary => 'Pangunahin';
	@override String get wheel => 'Gulong';
	@override String get shades => 'Shades';
}

// Path: skedmaker.subjects.subject.actions.delete
class _TranslationsSkedmakerSubjectsSubjectActionsDeleteTl extends TranslationsSkedmakerSubjectsSubjectActionsDeleteEn {
	_TranslationsSkedmakerSubjectsSubjectActionsDeleteTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Burahin';
	@override String warning({required Object subject}) => 'Burahin ang ${subject}? \nHindi mo \'to maibabalik.';
}

// Path: skedmaker.subjects.subject.actions.offeringDelete
class _TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteTl extends TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteEn {
	_TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Magbura ng alok';
	@override String get warning => 'Burahin itong alok? \nHindi mo \'to maibabalik.';
}

// Path: skedmaker.subjects.subject.table.status
class _TranslationsSkedmakerSubjectsSubjectTableStatusTl extends TranslationsSkedmakerSubjectsSubjectTableStatusEn {
	_TranslationsSkedmakerSubjectsSubjectTableStatusTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Kalagayan';
	@override String get open => 'Bukás';
	@override String get closed => 'Sarado';
}

// Path: skedmaker.subjects.subject.table.classno
class _TranslationsSkedmakerSubjectsSubjectTableClassnoTl extends TranslationsSkedmakerSubjectsSubjectTableClassnoEn {
	_TranslationsSkedmakerSubjectsSubjectTableClassnoTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => '\# ng Klase';
	@override String get edit => 'Palitan ang bilang ng klase:';
}

// Path: skedmaker.subjects.subject.table.section
class _TranslationsSkedmakerSubjectsSubjectTableSectionTl extends TranslationsSkedmakerSubjectsSubjectTableSectionEn {
	_TranslationsSkedmakerSubjectsSubjectTableSectionTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pangkat';
	@override String get edit => 'Palitan ang pangkat:';
}

// Path: skedmaker.subjects.subject.table.room
class _TranslationsSkedmakerSubjectsSubjectTableRoomTl extends TranslationsSkedmakerSubjectsSubjectTableRoomEn {
	_TranslationsSkedmakerSubjectsSubjectTableRoomTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Silid';
	@override String get edit => 'Palitan ang silid (maaaring wala):';
}

// Path: skedmaker.subjects.subject.table.day
class _TranslationsSkedmakerSubjectsSubjectTableDayTl extends TranslationsSkedmakerSubjectsSubjectTableDayEn {
	_TranslationsSkedmakerSubjectsSubjectTableDayTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Araw';
	@override String get edit => 'Palitan ang araw:';
}

// Path: skedmaker.subjects.subject.table.time
class _TranslationsSkedmakerSubjectsSubjectTableTimeTl extends TranslationsSkedmakerSubjectsSubjectTableTimeEn {
	_TranslationsSkedmakerSubjectsSubjectTableTimeTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Oras';
	@override String data({required Object from, required Object to}) => '${from} - ${to}';
	@override String get edit => 'Palitan ang oras:';
	@override String get to => ' hanggang ';
	@override String get secondTimeInterval => 'Pangalawang pagitan';
	@override String get errorStartTimeBeforeEndTime => 'Ang pansimulang oras ay dapat bágo sa hulihang oras';
	@override String get errorSecondTimeInterval => 'Dapat mayroon itong pangalawang pagitan';
	@override String get errorConflict => 'Ang magkadalawang pagitan ay dapat hindi magsagabal dahil sila\'y nasa parehong araw';
}

// Path: skedmaker.subjects.subject.table.teacher
class _TranslationsSkedmakerSubjectsSubjectTableTeacherTl extends TranslationsSkedmakerSubjectsSubjectTableTeacherEn {
	_TranslationsSkedmakerSubjectsSubjectTableTeacherTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Guro';
	@override String get edit => 'Palitan ang guro (maaaring wala):';
}

// Path: skedmaker.subjects.subject.table.slots
class _TranslationsSkedmakerSubjectsSubjectTableSlotsTl extends TranslationsSkedmakerSubjectsSubjectTableSlotsEn {
	_TranslationsSkedmakerSubjectsSubjectTableSlotsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Slot';
	@override String data({required Object taken, required Object capacity}) => '${taken} / ${capacity}';
	@override String percent({required Object percent}) => '${percent}%';
	@override String get edit => 'Palitan ang mga slot:';
	@override String get outOf => ' mula sa ';
}

// Path: skedmaker.subjects.subject.table.remarks
class _TranslationsSkedmakerSubjectsSubjectTableRemarksTl extends TranslationsSkedmakerSubjectsSubjectTableRemarksEn {
	_TranslationsSkedmakerSubjectsSubjectTableRemarksTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Puna';
	@override String get edit => 'Palitan ang mga puna (maaaring wala):';
}

// Path: skedmaker.filters.categories.offerings.includeClosed
class _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedTl extends TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Isáma ang nakasarang alok';
	@override String get desc => 'Paganahin \'to para \'wag pansinin kung bukas o sarado';
}

// Path: skedmaker.filters.categories.offerings.includeFullSlots
class _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTl extends TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Isáma ang punóng alok';
	@override String get desc => 'Paganahin \'to para \'wag pansinin ang kapasidad';
}

// Path: skedmaker.filters.categories.offerings.includeUnknownModality
class _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTl extends TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Isáma ang mga alok na \'di alam ang modalidad';
}

// Path: skedmaker.filters.categories.offerings.includeNoTeachers
class _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTl extends TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Isáma ang mga alok na walang guro';
}

// Path: skedmaker.filters.categories.offerings.excludeSectionLetter
class _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTl extends TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Ibukod ang mga pangkat na naglalaman ng mga ito';
	@override String get desc => 'Gamitin \'to para ibukod ang mga alok na ang pangkat ay naglalaman ng (mga) titik';
}

// Path: skedmaker.filters.categories.offerings.excludeRemarksLetter
class _TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterTl extends TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Ibukod ang mga puna na naglalaman ng mga ito';
	@override String get desc => 'Gamitin \'to para ibukod ang mga alok na ang puna ay naglalaman ng (mga) titik';
}

// Path: skedmaker.filters.categories.offerings.includeFreshmanBlock
class _TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTl extends TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn {
	_TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Isáma ang block ng mga presman';
}

// Path: skedmaker.filters.categories.day.commonMaxNumberOfSubjects
class _TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTl extends TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pinakamaraming bilang ng asignatura';
	@override String get desc => 'Ilagay ang -1 \'pag walang hanggan; ilagay ang 0 \'pag wala talaga';
}

// Path: skedmaker.filters.categories.day.commonTimeInterval
class _TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalTl extends TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Dapat sa gantong oras lang may asignatura';
}

// Path: skedmaker.filters.categories.day.commonModality
class _TranslationsSkedmakerFiltersCategoriesDayCommonModalityTl extends TranslationsSkedmakerFiltersCategoriesDayCommonModalityEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonModalityTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Modalidad ng mga asignatura';
	@override String get hybrid => 'Online o harap-harapan';
	@override String get online => 'Online';
	@override String get face => 'Harap-harapan';
	@override String get any => 'Kahit anong modalidad';
	@override String get unknown => '\'Di alam ang modalidad';
}

// Path: skedmaker.filters.categories.day.commonStartWithSubject
class _TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTl extends TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Unang asignatura ng araw';
}

// Path: skedmaker.filters.categories.day.commonEndWithSubject
class _TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTl extends TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Huling asignatura ng araw';
}

// Path: skedmaker.filters.categories.day.commonBreaktime
class _TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeTl extends TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeEn {
	_TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Oras-pahinga';
	@override String get desc => 'Oras na dapat walang asignatura';
}

// Path: skedmaker.filters.categories.location.enabled
class _TranslationsSkedmakerFiltersCategoriesLocationEnabledTl extends TranslationsSkedmakerFiltersCategoriesLocationEnabledEn {
	_TranslationsSkedmakerFiltersCategoriesLocationEnabledTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Paganahin ang pagpapanalà gamit ang lokasyon at layo';
	@override String get desc => 'Kinokonsidera nito ang layo ng: Nakaraang klase → ang unang palapag → \nang unang palapag ng susunod na klase → ang susunod na klase. Kapag parehas sila ng\ngusali, ito lamang ang layo mula sa nakaraan hanggang sa susunod.';
}

// Path: skedmaker.filters.categories.location.checkingDistanceMinutes
class _TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTl extends TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn {
	_TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pagitan ng mga asignatura upang tignan ang layo (minuto)';
}

// Path: skedmaker.filters.categories.location.maxAllowedDistanceMeters
class _TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTl extends TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn {
	_TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pinakamataas na layo mula sa isang asignatura patungo sa susunod (metro)';
}

// Path: skedmaker.filters.categories.location.calculator
class _TranslationsSkedmakerFiltersCategoriesLocationCalculatorTl extends TranslationsSkedmakerFiltersCategoriesLocationCalculatorEn {
	_TranslationsSkedmakerFiltersCategoriesLocationCalculatorTl._(TranslationsTl root) : this._root = root, super.internal(root);

	final TranslationsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Buksan ang kalkulator ng distansya';
	@override String get title => 'Kalkulator ng distansya';
	@override String get desc => 'Tandaan: Tantya-tantyahin lamang ito.';
	@override String get from => 'Mula:';
	@override String get to => 'Patungo:';
	@override String get hint => 'Code ng silid (eg. A1105)';
	@override String get calculate => 'Kalkulahin';
	@override String result({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tl'))(n,
		one: '~${n} metro',
		other: '~${n} (na) metro',
	);
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsTl {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.app.name': return 'AralTools';
			case 'general.home.name': return 'Tahanan';
			case 'general.home.welcome': return 'Maligayang pagdating!';
			case 'general.home.more.title': return 'Marami pang dadating!';
			case 'general.home.more.desc': return 'Abangan! :)';
			case 'general.drawer.about.name': return 'Patungkol';
			case 'general.drawer.about.version': return ({required Object version, required Object build}) => 'Bersyon ${version} build ${build}';
			case 'general.drawer.about.copyright': return 'Karapatang-sipi (C) 2024 Yivan Padsoyan';
			case 'general.drawer.support.title': return 'Buy Me A Coffee';
			case 'general.drawer.support.desc': return 'Suportahan ako!';
			case 'general.drawer.github.title': return 'Tignan ang source code';
			case 'general.drawer.github.desc': return 'Mag-ambag sa AralTools!';
			case 'general.drawer.bugs.title': return 'Subaybayánan ng isyu';
			case 'general.drawer.bugs.desc': return 'Umulat ng mga isyu dito!';
			case 'general.drawer.language.title': return ({required Object language}) => 'Wika: ${language}';
			case 'general.drawer.language.tooltip': return 'Palitan ang wika';
			case 'general.functions.backToHome.name': return 'Bumalik sa tahanan';
			case 'general.functions.backToHome.title': return 'Bumalik sa tahanan?';
			case 'general.functions.backToHome.desc': return 'Lahat ng \'di naimpok na data ay mawawala.';
			case 'general.functions.newProject.title': return 'Gumawa ng bagong proyekto?';
			case 'general.functions.newProject.desc': return 'Lahat ng \'di naimpok na data ay mawawala.';
			case 'general.general.go': return 'Pumunta';
			case 'general.general.ok': return 'Okay';
			case 'general.general.open.regular': return 'Buksan';
			case 'general.general.open.ellipsis': return 'Buksan...';
			case 'general.general.delete': return 'Ibura';
			case 'general.general.add': return 'Idagdag';
			case 'general.general.select': return 'Piliin';
			case 'general.general.save': return 'Impukin';
			case 'general.general.saveDont': return '\'Wag impukin';
			case 'general.general.saveAs.regular': return 'Impukin bilang';
			case 'general.general.saveAs.ellipsis': return 'Impukin bilang...';
			case 'general.general.cancel': return 'Kansela';
			case 'general.general.resume': return 'Itulóy';
			case 'general.general.pause': return 'Ihinto';
			case 'general.general.stop': return 'Itigil';
			case 'general.general.close': return 'Isara';
			case 'general.general.rename': return 'Ipangalan';
			case 'general.general.copy': return 'Kopyahin';
			case 'general.general.new_': return 'Bágo';
			case 'general.general.moreInfo': return 'Karagdagang impo';
			case 'general.general.proceed': return 'Magpatúloy';
			case 'skedmaker.info.name': return 'SkedMaker';
			case 'skedmaker.info.nameFull': return '${_root.general.app.name} ${_root.skedmaker.info.name}';
			case 'skedmaker.info.desc': return 'Ang awtomatikong paggawa ng iskedyul sa klase ng mga estudyante ng DLSU';
			case 'skedmaker.drawer.fileLocation.name': return 'Lokasyon ng talaksán';
			case 'skedmaker.drawer.fileLocation.empty': return '-';
			case 'skedmaker.drawer.fileLocation.open': return 'Buksan ang lokasyon ng talaksán';
			case 'skedmaker.subjects.name': return 'Asignatura';
			case 'skedmaker.subjects.add.title': return 'Magdagdag ng asignatura';
			case 'skedmaker.subjects.add.buttonMls.name': return 'Magdagdag mula My.LaSalle';
			case 'skedmaker.subjects.add.buttonMls.title': return 'Magdagdag ng asignatura';
			case 'skedmaker.subjects.add.buttonMls.desc': return 'Ilagay ang iyong numero ng ID at ang code ng asignatura sa bagong durungawan. Nang nakalista na ang mga alok, pindutin ang "${_root.general.general.add}".';
			case 'skedmaker.subjects.add.buttonMls.webviewTitle': return 'Hindi naka-install ang WebView2';
			case 'skedmaker.subjects.add.buttonMls.webviewDesc': return ({required InlineSpanBuilder webview, required InlineSpanBuilder learn}) => TextSpan(children: [
				const TextSpan(text: 'Kailangan mong i-download at i-install ang '),
				webview('Microsoft Edge WebView2 Runtime'),
				const TextSpan(text: ' para magamit ang My.LaSalle sa loob ng AralTools SkedMaker. Ito\'y kasama na sa Windows 11, ngunit wala sa device mo.\n\n'),
				learn('Pindutin ito upang matuto pa.'),
			]);
			case 'skedmaker.subjects.add.buttonManual.name': return 'Magdagdag nang manu-mano';
			case 'skedmaker.subjects.add.buttonManual.title': return 'Gumawa ng bagong asignatura';
			case 'skedmaker.subjects.add.buttonManual.desc': return 'Maglagay ng 7 karakter na code ng asignatura:';
			case 'skedmaker.subjects.add.buttonCode.name': return 'Magdagdag gamit code';
			case 'skedmaker.subjects.add.buttonCode.title': return 'Magdagdag ng asignatura gamit code';
			case 'skedmaker.subjects.add.buttonCode.desc': return ({required InlineSpanBuilder mls}) => TextSpan(children: [
				const TextSpan(text: 'Buksan ang '),
				mls(_root.skedmaker.mlsCourseOfferings),
				const TextSpan(text: ' sa browser at ilagay ang iyong ID number at ang code ng asignatura. Nang natalá na ang mga alok, buksan ang Developer Console at ilagay ang command na ito:\n'),
			]);
			case 'skedmaker.subjects.add.buttonCode.field': return 'Kopyahin ang kinalalabasan at ilagay dito:';
			case 'skedmaker.subjects.add.buttonCode.hint': return 'Kinalalabasan ng command';
			case 'skedmaker.subjects.add.buttonCode.error': return 'Mali ang nàilagay';
			case 'skedmaker.subjects.add.errorParse.title': return 'Kamalian habang binabása';
			case 'skedmaker.subjects.add.errorParse.messagebox': return 'Ang mga alok na ito ay hindi maibása.';
			case 'skedmaker.subjects.add.errorParse.footer': return 'Kapag magtutuloy ay mabubura ang mga alok na ito.';
			case 'skedmaker.subjects.subject.title': return ({required Object subject, required Object offering, required Object available}) => '${subject} - ${offering} alok (${available} maaari)';
			case 'skedmaker.subjects.subject.actions.recolor.name': return 'Kulayin';
			case 'skedmaker.subjects.subject.actions.recolor.title': return 'Pumili ng kulay';
			case 'skedmaker.subjects.subject.actions.recolor.primary': return 'Pangunahin';
			case 'skedmaker.subjects.subject.actions.recolor.wheel': return 'Gulong';
			case 'skedmaker.subjects.subject.actions.recolor.shades': return 'Shades';
			case 'skedmaker.subjects.subject.actions.delete.name': return 'Burahin';
			case 'skedmaker.subjects.subject.actions.delete.warning': return ({required Object subject}) => 'Burahin ang ${subject}? \nHindi mo \'to maibabalik.';
			case 'skedmaker.subjects.subject.actions.showhide': return 'Ipakita/Itago';
			case 'skedmaker.subjects.subject.actions.offeringAdd': return 'Magdagdag ng alok';
			case 'skedmaker.subjects.subject.actions.offeringDelete.name': return 'Magbura ng alok';
			case 'skedmaker.subjects.subject.actions.offeringDelete.warning': return 'Burahin itong alok? \nHindi mo \'to maibabalik.';
			case 'skedmaker.subjects.subject.actions.offeringCloseAll': return 'Isara lahat ng alok';
			case 'skedmaker.subjects.subject.actions.offeringOpenAll': return 'Ibukás lahat ng alok';
			case 'skedmaker.subjects.subject.table.status.name': return 'Kalagayan';
			case 'skedmaker.subjects.subject.table.status.open': return 'Bukás';
			case 'skedmaker.subjects.subject.table.status.closed': return 'Sarado';
			case 'skedmaker.subjects.subject.table.classno.name': return '\# ng Klase';
			case 'skedmaker.subjects.subject.table.classno.edit': return 'Palitan ang bilang ng klase:';
			case 'skedmaker.subjects.subject.table.section.name': return 'Pangkat';
			case 'skedmaker.subjects.subject.table.section.edit': return 'Palitan ang pangkat:';
			case 'skedmaker.subjects.subject.table.room.name': return 'Silid';
			case 'skedmaker.subjects.subject.table.room.edit': return 'Palitan ang silid (maaaring wala):';
			case 'skedmaker.subjects.subject.table.day.name': return 'Araw';
			case 'skedmaker.subjects.subject.table.day.edit': return 'Palitan ang araw:';
			case 'skedmaker.subjects.subject.table.time.name': return 'Oras';
			case 'skedmaker.subjects.subject.table.time.data': return ({required Object from, required Object to}) => '${from} - ${to}';
			case 'skedmaker.subjects.subject.table.time.edit': return 'Palitan ang oras:';
			case 'skedmaker.subjects.subject.table.time.to': return ' hanggang ';
			case 'skedmaker.subjects.subject.table.time.secondTimeInterval': return 'Pangalawang pagitan';
			case 'skedmaker.subjects.subject.table.time.errorStartTimeBeforeEndTime': return 'Ang pansimulang oras ay dapat bágo sa hulihang oras';
			case 'skedmaker.subjects.subject.table.time.errorSecondTimeInterval': return 'Dapat mayroon itong pangalawang pagitan';
			case 'skedmaker.subjects.subject.table.time.errorConflict': return 'Ang magkadalawang pagitan ay dapat hindi magsagabal dahil sila\'y nasa parehong araw';
			case 'skedmaker.subjects.subject.table.teacher.name': return 'Guro';
			case 'skedmaker.subjects.subject.table.teacher.edit': return 'Palitan ang guro (maaaring wala):';
			case 'skedmaker.subjects.subject.table.slots.name': return 'Slot';
			case 'skedmaker.subjects.subject.table.slots.data': return ({required Object taken, required Object capacity}) => '${taken} / ${capacity}';
			case 'skedmaker.subjects.subject.table.slots.percent': return ({required Object percent}) => '${percent}%';
			case 'skedmaker.subjects.subject.table.slots.edit': return 'Palitan ang mga slot:';
			case 'skedmaker.subjects.subject.table.slots.outOf': return ' mula sa ';
			case 'skedmaker.subjects.subject.table.remarks.name': return 'Puna';
			case 'skedmaker.subjects.subject.table.remarks.edit': return 'Palitan ang mga puna (maaaring wala):';
			case 'skedmaker.subjects.subject.infobar.noAvailableOffering': return ({required Object subject}) => 'Walang maaaring alok ang ${subject}.';
			case 'skedmaker.subjects.subject.infobar.hidden': return ({required Object subject}) => 'Nakatago ang ${subject}. Hindi ito maisasama kapag bumubuo ng palátuntunan.';
			case 'skedmaker.subjects.empty.title': return ({required Object subject}) => 'Ang ${subject} ay walang alok';
			case 'skedmaker.filters.name': return 'Panalà';
			case 'skedmaker.filters.categories.offerings.name': return 'Alok';
			case 'skedmaker.filters.categories.offerings.desc': return 'Ipanalà ang mga alok kung ano ang isasama';
			case 'skedmaker.filters.categories.offerings.includeClosed.name': return 'Isáma ang nakasarang alok';
			case 'skedmaker.filters.categories.offerings.includeClosed.desc': return 'Paganahin \'to para \'wag pansinin kung bukas o sarado';
			case 'skedmaker.filters.categories.offerings.includeFullSlots.name': return 'Isáma ang punóng alok';
			case 'skedmaker.filters.categories.offerings.includeFullSlots.desc': return 'Paganahin \'to para \'wag pansinin ang kapasidad';
			case 'skedmaker.filters.categories.offerings.includeUnknownModality.name': return 'Isáma ang mga alok na \'di alam ang modalidad';
			case 'skedmaker.filters.categories.offerings.includeNoTeachers.name': return 'Isáma ang mga alok na walang guro';
			case 'skedmaker.filters.categories.offerings.excludeSectionLetter.name': return 'Ibukod ang mga pangkat na naglalaman ng mga ito';
			case 'skedmaker.filters.categories.offerings.excludeSectionLetter.desc': return 'Gamitin \'to para ibukod ang mga alok na ang pangkat ay naglalaman ng (mga) titik';
			case 'skedmaker.filters.categories.offerings.excludeRemarksLetter.name': return 'Ibukod ang mga puna na naglalaman ng mga ito';
			case 'skedmaker.filters.categories.offerings.excludeRemarksLetter.desc': return 'Gamitin \'to para ibukod ang mga alok na ang puna ay naglalaman ng (mga) titik';
			case 'skedmaker.filters.categories.offerings.includeFreshmanBlock.name': return 'Isáma ang block ng mga presman';
			case 'skedmaker.filters.categories.day.name': return 'Tiyak na araw';
			case 'skedmaker.filters.categories.day.desc': return 'Mga panalà sa kada araw ng linggo';
			case 'skedmaker.filters.categories.day.commonMaxNumberOfSubjects.name': return 'Pinakamaraming bilang ng asignatura';
			case 'skedmaker.filters.categories.day.commonMaxNumberOfSubjects.desc': return 'Ilagay ang -1 \'pag walang hanggan; ilagay ang 0 \'pag wala talaga';
			case 'skedmaker.filters.categories.day.commonTimeInterval.name': return 'Dapat sa gantong oras lang may asignatura';
			case 'skedmaker.filters.categories.day.commonModality.name': return 'Modalidad ng mga asignatura';
			case 'skedmaker.filters.categories.day.commonModality.hybrid': return 'Online o harap-harapan';
			case 'skedmaker.filters.categories.day.commonModality.online': return 'Online';
			case 'skedmaker.filters.categories.day.commonModality.face': return 'Harap-harapan';
			case 'skedmaker.filters.categories.day.commonModality.any': return 'Kahit anong modalidad';
			case 'skedmaker.filters.categories.day.commonModality.unknown': return '\'Di alam ang modalidad';
			case 'skedmaker.filters.categories.day.commonStartWithSubject.name': return 'Unang asignatura ng araw';
			case 'skedmaker.filters.categories.day.commonEndWithSubject.name': return 'Huling asignatura ng araw';
			case 'skedmaker.filters.categories.day.commonBreaktime.name': return 'Oras-pahinga';
			case 'skedmaker.filters.categories.day.commonBreaktime.desc': return 'Oras na dapat walang asignatura';
			case 'skedmaker.filters.categories.day.mondayName': return 'Lunes';
			case 'skedmaker.filters.categories.day.tuesdayName': return 'Martes';
			case 'skedmaker.filters.categories.day.wednesdayName': return 'Miyerkules';
			case 'skedmaker.filters.categories.day.thursdayName': return 'Huwebes';
			case 'skedmaker.filters.categories.day.fridayName': return 'Biyernes';
			case 'skedmaker.filters.categories.day.saturdayName': return 'Sabado';
			case 'skedmaker.filters.categories.location.name': return 'Lokasyon (tílawin)';
			case 'skedmaker.filters.categories.location.desc': return 'Ipanalà ang mga alok base sa kanilang lokasyon';
			case 'skedmaker.filters.categories.location.enabled.name': return 'Paganahin ang pagpapanalà gamit ang lokasyon at layo';
			case 'skedmaker.filters.categories.location.enabled.desc': return 'Kinokonsidera nito ang layo ng: Nakaraang klase → ang unang palapag → \nang unang palapag ng susunod na klase → ang susunod na klase. Kapag parehas sila ng\ngusali, ito lamang ang layo mula sa nakaraan hanggang sa susunod.';
			case 'skedmaker.filters.categories.location.checkingDistanceMinutes.name': return 'Pagitan ng mga asignatura upang tignan ang layo (minuto)';
			case 'skedmaker.filters.categories.location.maxAllowedDistanceMeters.name': return 'Pinakamataas na layo mula sa isang asignatura patungo sa susunod (metro)';
			case 'skedmaker.filters.categories.location.calculator.name': return 'Buksan ang kalkulator ng distansya';
			case 'skedmaker.filters.categories.location.calculator.title': return 'Kalkulator ng distansya';
			case 'skedmaker.filters.categories.location.calculator.desc': return 'Tandaan: Tantya-tantyahin lamang ito.';
			case 'skedmaker.filters.categories.location.calculator.from': return 'Mula:';
			case 'skedmaker.filters.categories.location.calculator.to': return 'Patungo:';
			case 'skedmaker.filters.categories.location.calculator.hint': return 'Code ng silid (eg. A1105)';
			case 'skedmaker.filters.categories.location.calculator.calculate': return 'Kalkulahin';
			case 'skedmaker.filters.categories.location.calculator.result': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tl'))(n,
				one: '~${n} metro',
				other: '~${n} (na) metro',
			);
			case 'skedmaker.filters.any': return 'Kahit anong asignatura';
			case 'skedmaker.filters.reset': return 'Baguhin lahat muli';
			case 'skedmaker.schedules.name': return 'Palátuntunan';
			case 'skedmaker.schedules.generate.title': return 'Bumuo ng mga posibleng palátuntunan';
			case 'skedmaker.schedules.generate.button': return 'Bumuo';
			case 'skedmaker.schedules.generate.pending': return 'Wala pang nabuong talàan. Maaaring matagal ito.';
			case 'skedmaker.schedules.generate.found': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tl'))(n,
				one: '${n} nabuong palátuntunan',
				other: '${n} (na) nabuong palátuntunan',
			);
			case 'skedmaker.schedules.generate.progress': return ({required Object percent}) => '${percent}% tapos';
			case 'skedmaker.schedules.generate.none': return 'Walang mahanap na palátuntunan. Marahil tignan ang iyong panalá at subukan muli.';
			case 'skedmaker.schedules.commandbar.rename.name': return 'Pangalánin';
			case 'skedmaker.schedules.commandbar.rename.edit': return 'Maglagay ng bagong pangalan';
			case 'skedmaker.schedules.commandbar.delete.name': return 'Burahin';
			case 'skedmaker.schedules.commandbar.delete.desc': return ({required Object name}) => 'Burahin ang ${name}?\nHindi mo ito maibabalik.\nMabubura rin ang lahat ng tab na may ganitong talàan.\n';
			case 'skedmaker.schedules.commandbar.star.star': return 'Ibituin';
			case 'skedmaker.schedules.commandbar.star.unstar': return '\'Wag ibituin';
			case 'skedmaker.schedules.commandbar.saveImage.name': return 'Iimpok bilang larawan';
			case 'skedmaker.schedules.commandbar.saveImage.title': return 'Iimpok bilang larawan';
			case 'skedmaker.schedules.commandbar.saveImage.desc': return 'Palitan ang laki ng durungawan para maayos ang larawan. Pagkatapos, pindutin ang "${_root.general.general.save}".';
			case 'skedmaker.schedules.commandbar.saveImage.credits': return ({required InlineSpanBuilder name}) => TextSpan(children: [
				const TextSpan(text: 'binuo ng '),
				name(_root.skedmaker.info.nameFull),
			]);
			case 'skedmaker.schedules.details.name': return 'Mga detalye';
			case 'skedmaker.schedules.details.notes': return 'Talâ';
			case 'skedmaker.schedules.details.subjects': return 'Mga asignatura';
			case 'skedmaker.schedules.info.name': return 'Impo';
			case 'skedmaker.schedules.info.title': return 'Impormasyon';
			case 'skedmaker.schedules.info.desc': return 'Pumili ng palátuntunan sa kaliwa.\nTignan at kumparahin ang mga palátuntunan gamit ang mga tab sa itaas.\n\nMga shortcut sa palapindutan:\nUp/Down arrow key - pumunta sa susunod/nakaraang palátuntunan\nCtrl + T - gumawa ng bagong tab\nCtrl + W o Ctrl + F4 - isara ang kasalukuyang tab\nCtrl + 1 hanggang 8 - pumunta sa una hanggang pang-walong tab\nCtrl + 9 - pumunta sa huling tab\n';
			case 'skedmaker.schedules.options.hoverEffects': return 'Paganahin ang epektong hover';
			case 'skedmaker.scheduleDay.mondayFace.name': return 'Lunes (face-to-face)';
			case 'skedmaker.scheduleDay.mondayFace.nameShort': return 'Lun (f2f)';
			case 'skedmaker.scheduleDay.mondayOnline.name': return 'Lunes (online)';
			case 'skedmaker.scheduleDay.mondayOnline.nameShort': return 'Lun (online)';
			case 'skedmaker.scheduleDay.mondayHybrid.name': return 'Lunes (hybrid)';
			case 'skedmaker.scheduleDay.mondayHybrid.nameShort': return 'Lun (hybrid)';
			case 'skedmaker.scheduleDay.mondayUnknown.name': return 'Lunes';
			case 'skedmaker.scheduleDay.mondayUnknown.nameShort': return 'Lun';
			case 'skedmaker.scheduleDay.tuesdayFace.name': return 'Martes (face-to-face)';
			case 'skedmaker.scheduleDay.tuesdayFace.nameShort': return 'Mar (f2f)';
			case 'skedmaker.scheduleDay.tuesdayOnline.name': return 'Martes (online)';
			case 'skedmaker.scheduleDay.tuesdayOnline.nameShort': return 'Mar (online)';
			case 'skedmaker.scheduleDay.tuesdayHybrid.name': return 'Martes (hybrid)';
			case 'skedmaker.scheduleDay.tuesdayHybrid.nameShort': return 'Mar (hybrid)';
			case 'skedmaker.scheduleDay.tuesdayUnknown.name': return 'Martes';
			case 'skedmaker.scheduleDay.tuesdayUnknown.nameShort': return 'Mar';
			case 'skedmaker.scheduleDay.wednesdayFace.name': return 'Miyerkules (face-to-face)';
			case 'skedmaker.scheduleDay.wednesdayFace.nameShort': return 'Miy (f2f)';
			case 'skedmaker.scheduleDay.wednesdayOnline.name': return 'Miyerkules (online)';
			case 'skedmaker.scheduleDay.wednesdayOnline.nameShort': return 'Miy (online)';
			case 'skedmaker.scheduleDay.wednesdayHybrid.name': return 'Miyerkules (hybrid)';
			case 'skedmaker.scheduleDay.wednesdayHybrid.nameShort': return 'Miy (hybrid)';
			case 'skedmaker.scheduleDay.wednesdayUnknown.name': return 'Miyerkules';
			case 'skedmaker.scheduleDay.wednesdayUnknown.nameShort': return 'Miy';
			case 'skedmaker.scheduleDay.thursdayFace.name': return 'Huwebes (face-to-face)';
			case 'skedmaker.scheduleDay.thursdayFace.nameShort': return 'Huw (f2f)';
			case 'skedmaker.scheduleDay.thursdayOnline.name': return 'Huwebes (online)';
			case 'skedmaker.scheduleDay.thursdayOnline.nameShort': return 'Huw (online)';
			case 'skedmaker.scheduleDay.thursdayHybrid.name': return 'Huwebes (hybrid)';
			case 'skedmaker.scheduleDay.thursdayHybrid.nameShort': return 'Huw (hybrid)';
			case 'skedmaker.scheduleDay.thursdayUnknown.name': return 'Huwebes';
			case 'skedmaker.scheduleDay.thursdayUnknown.nameShort': return 'Huw';
			case 'skedmaker.scheduleDay.fridayFace.name': return 'Biyernes (face-to-face)';
			case 'skedmaker.scheduleDay.fridayFace.nameShort': return 'Biy (f2f)';
			case 'skedmaker.scheduleDay.fridayOnline.name': return 'Biyernes (online)';
			case 'skedmaker.scheduleDay.fridayOnline.nameShort': return 'Biy (online)';
			case 'skedmaker.scheduleDay.fridayHybrid.name': return 'Biyernes (hybrid)';
			case 'skedmaker.scheduleDay.fridayHybrid.nameShort': return 'Biy (hybrid)';
			case 'skedmaker.scheduleDay.fridayUnknown.name': return 'Biyernes';
			case 'skedmaker.scheduleDay.fridayUnknown.nameShort': return 'Biy';
			case 'skedmaker.scheduleDay.saturdayFace.name': return 'Sabado (face-to-face)';
			case 'skedmaker.scheduleDay.saturdayFace.nameShort': return 'Sab (f2f)';
			case 'skedmaker.scheduleDay.saturdayOnline.name': return 'Sabado (online)';
			case 'skedmaker.scheduleDay.saturdayOnline.nameShort': return 'Sab (online)';
			case 'skedmaker.scheduleDay.saturdayHybrid.name': return 'Sabado (hybrid)';
			case 'skedmaker.scheduleDay.saturdayHybrid.nameShort': return 'Sab (hybrid)';
			case 'skedmaker.scheduleDay.saturdayUnknown.name': return 'Sabado';
			case 'skedmaker.scheduleDay.saturdayUnknown.nameShort': return 'Sab';
			case 'skedmaker.scheduleDay.mondaythursdayFace.name': return 'Lunes at Huwebes (parehong face-to-face)';
			case 'skedmaker.scheduleDay.mondaythursdayFace.nameShort': return 'Lun & Huw (parehong f2f)';
			case 'skedmaker.scheduleDay.mondaythursdayOnline.name': return 'Lunes at Huwebes  (parehong online)';
			case 'skedmaker.scheduleDay.mondaythursdayOnline.nameShort': return 'Lun & Huw (parehong online)';
			case 'skedmaker.scheduleDay.mondaythursdayOnlineface.name': return 'Lunes (online) at Huwebes (face-to-face)';
			case 'skedmaker.scheduleDay.mondaythursdayOnlineface.nameShort': return 'Lun (online) & Huw (f2f)';
			case 'skedmaker.scheduleDay.mondaythursdayFaceonline.name': return 'Lunes (face-to-face) at Huwebes (online)';
			case 'skedmaker.scheduleDay.mondaythursdayFaceonline.nameShort': return 'Lun (f2f) & Huw (online)';
			case 'skedmaker.scheduleDay.mondaythursdayUnknown.name': return 'Lunes';
			case 'skedmaker.scheduleDay.mondaythursdayUnknown.nameShort': return 'Lun & Huw';
			case 'skedmaker.scheduleDay.tuesdayfridayFace.name': return 'Martes at Biyernes (parehong face-to-face)';
			case 'skedmaker.scheduleDay.tuesdayfridayFace.nameShort': return 'Mar & Biy (parehong f2f)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnline.name': return 'Martes at Biyernes (both online)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnline.nameShort': return 'Mar & Biy (both online)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnlineface.name': return 'Martes (online) at Biyernes (face-to-face)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnlineface.nameShort': return 'Mar (online) & Biy (f2f)';
			case 'skedmaker.scheduleDay.tuesdayfridayFaceonline.name': return 'Martes (face-to-face) at Biyernes (online)';
			case 'skedmaker.scheduleDay.tuesdayfridayFaceonline.nameShort': return 'Mar (f2f) & Biy (online)';
			case 'skedmaker.scheduleDay.tuesdayfridayUnknown.name': return 'Martes at Biyernes';
			case 'skedmaker.scheduleDay.tuesdayfridayUnknown.nameShort': return 'Mar & Biy';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFace.name': return 'Miyerkules at Sabado (parehong face-to-face)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFace.nameShort': return 'Miy & Sab (parehong f2f)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnline.name': return 'Miyerkules at Sabado (both online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnline.nameShort': return 'Miy & Sab (both online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnlineface.name': return 'Miyerkules (online) at Sabado (face-to-face)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnlineface.nameShort': return 'Miy (online) & Sab (f2f)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFaceonline.name': return 'Miyerkules (face-to-face) at Sabado (online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFaceonline.nameShort': return 'Miy (f2f) & Sab (online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayUnknown.name': return 'Miyerkules at Sabado';
			case 'skedmaker.scheduleDay.wednesdaysaturdayUnknown.nameShort': return 'Miy & Sab';
			case 'skedmaker.scheduleDay.unknown.name': return 'Hindi alam';
			case 'skedmaker.scheduleDay.unknown.nameShort': return '\'Di alam';
			case 'skedmaker.scheduleRoom.empty': return 'Walang silid';
			case 'skedmaker.scheduleRoom.online': return 'Online';
			case 'skedmaker.scheduleRoom.hybrid': return ({required Object room}) => '${room} at online';
			case 'skedmaker.scheduleDefault.name': return ({required Object n}) => 'Palátuntunan ${n}';
			case 'skedmaker.mlsCourseOfferings': return 'Mga Alok ng Kurso sa My.LaSalle';
			case 'skedmaker.infobar.currentlyGeneratingSchedules': return 'Kasalukuyang bumubuo ng mga palátuntunan. Walang epekto ang mga pagbabago rito hangga\'t bumuo ka muli.';
			default: return null;
		}
	}
}


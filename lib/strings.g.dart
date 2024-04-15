/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 942 (314 per locale)
///
/// Built on 2024-04-15 at 10:18 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	tl(languageCode: 'tl', build: _StringsTl.build),
	tlQp(languageCode: 'tl', countryCode: 'QP', build: _StringsTlQp.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of strings).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = strings.someKey.anotherKey;
/// String b = strings['someKey.anotherKey']; // Only for edge cases!
Translations get strings => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final strings = Translations.of(context); // Get strings variable.
/// String a = strings.someKey.anotherKey; // Use strings variable.
/// String b = strings['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.strings.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get strings => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final strings = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsGeneralEn general = _StringsGeneralEn._(_root);
	late final _StringsSkedmakerEn skedmaker = _StringsSkedmakerEn._(_root);
}

// Path: general
class _StringsGeneralEn {
	_StringsGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsGeneralAppEn app = _StringsGeneralAppEn._(_root);
	late final _StringsGeneralHomeEn home = _StringsGeneralHomeEn._(_root);
	late final _StringsGeneralDrawerEn drawer = _StringsGeneralDrawerEn._(_root);
	late final _StringsGeneralFunctionsEn functions = _StringsGeneralFunctionsEn._(_root);
	late final _StringsGeneralGeneralEn general = _StringsGeneralGeneralEn._(_root);
}

// Path: skedmaker
class _StringsSkedmakerEn {
	_StringsSkedmakerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerInfoEn info = _StringsSkedmakerInfoEn._(_root);
	late final _StringsSkedmakerDrawerEn drawer = _StringsSkedmakerDrawerEn._(_root);
	late final _StringsSkedmakerSubjectsEn subjects = _StringsSkedmakerSubjectsEn._(_root);
	late final _StringsSkedmakerFiltersEn filters = _StringsSkedmakerFiltersEn._(_root);
	late final _StringsSkedmakerSchedulesEn schedules = _StringsSkedmakerSchedulesEn._(_root);
	late final _StringsSkedmakerScheduleDayEn scheduleDay = _StringsSkedmakerScheduleDayEn._(_root);
	late final _StringsSkedmakerScheduleRoomEn scheduleRoom = _StringsSkedmakerScheduleRoomEn._(_root);
	late final _StringsSkedmakerScheduleDefaultEn scheduleDefault = _StringsSkedmakerScheduleDefaultEn._(_root);
	String get mlsCourseOfferings => 'My.LaSalle\'s Course Offerings';
	late final _StringsSkedmakerInfobarEn infobar = _StringsSkedmakerInfobarEn._(_root);
}

// Path: general.app
class _StringsGeneralAppEn {
	_StringsGeneralAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'AralTools';
}

// Path: general.home
class _StringsGeneralHomeEn {
	_StringsGeneralHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Home';
	String get welcome => 'Welcome!';
	late final _StringsGeneralHomeMoreEn more = _StringsGeneralHomeMoreEn._(_root);
}

// Path: general.drawer
class _StringsGeneralDrawerEn {
	_StringsGeneralDrawerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsGeneralDrawerAboutEn about = _StringsGeneralDrawerAboutEn._(_root);
	late final _StringsGeneralDrawerSupportEn support = _StringsGeneralDrawerSupportEn._(_root);
	late final _StringsGeneralDrawerGithubEn github = _StringsGeneralDrawerGithubEn._(_root);
	late final _StringsGeneralDrawerBugsEn bugs = _StringsGeneralDrawerBugsEn._(_root);
	late final _StringsGeneralDrawerLanguageEn language = _StringsGeneralDrawerLanguageEn._(_root);
}

// Path: general.functions
class _StringsGeneralFunctionsEn {
	_StringsGeneralFunctionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsGeneralFunctionsBackToHomeEn backToHome = _StringsGeneralFunctionsBackToHomeEn._(_root);
	late final _StringsGeneralFunctionsNewProjectEn newProject = _StringsGeneralFunctionsNewProjectEn._(_root);
}

// Path: general.general
class _StringsGeneralGeneralEn {
	_StringsGeneralGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get go => 'Go';
	String get ok => 'OK';
	late final _StringsGeneralGeneralOpenEn open = _StringsGeneralGeneralOpenEn._(_root);
	String get delete => 'Delete';
	String get add => 'Add';
	String get select => 'Select';
	String get save => 'Save';
	String get saveDont => 'Don\'t save';
	late final _StringsGeneralGeneralSaveAsEn saveAs = _StringsGeneralGeneralSaveAsEn._(_root);
	String get cancel => 'Cancel';
	String get resume => 'Resume';
	String get pause => 'Pause';
	String get stop => 'Stop';
	String get close => 'Close';
	String get rename => 'Rename';
	String get copy => 'Copy';
	String get new_ => 'New';
	late final _StringsGeneralGeneralDateEn date = _StringsGeneralGeneralDateEn._(_root);
}

// Path: skedmaker.info
class _StringsSkedmakerInfoEn {
	_StringsSkedmakerInfoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'SkedMaker';
	String get nameFull => '${_root.general.app.name} ${_root.skedmaker.info.name}';
	String get desc => 'The automatic class schedule maker for DLSU students';
}

// Path: skedmaker.drawer
class _StringsSkedmakerDrawerEn {
	_StringsSkedmakerDrawerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerDrawerFileLocationEn fileLocation = _StringsSkedmakerDrawerFileLocationEn._(_root);
}

// Path: skedmaker.subjects
class _StringsSkedmakerSubjectsEn {
	_StringsSkedmakerSubjectsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Subjects';
	late final _StringsSkedmakerSubjectsAddEn add = _StringsSkedmakerSubjectsAddEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectEn subject = _StringsSkedmakerSubjectsSubjectEn._(_root);
	late final _StringsSkedmakerSubjectsEmptyEn empty = _StringsSkedmakerSubjectsEmptyEn._(_root);
}

// Path: skedmaker.filters
class _StringsSkedmakerFiltersEn {
	_StringsSkedmakerFiltersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Filters';
	late final _StringsSkedmakerFiltersCategoriesEn categories = _StringsSkedmakerFiltersCategoriesEn._(_root);
	String get any => 'Any subject';
	String get reset => 'Reset all';
}

// Path: skedmaker.schedules
class _StringsSkedmakerSchedulesEn {
	_StringsSkedmakerSchedulesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Schedules';
	late final _StringsSkedmakerSchedulesGenerateEn generate = _StringsSkedmakerSchedulesGenerateEn._(_root);
	late final _StringsSkedmakerSchedulesCommandbarEn commandbar = _StringsSkedmakerSchedulesCommandbarEn._(_root);
	late final _StringsSkedmakerSchedulesDetailsEn details = _StringsSkedmakerSchedulesDetailsEn._(_root);
	late final _StringsSkedmakerSchedulesInfoEn info = _StringsSkedmakerSchedulesInfoEn._(_root);
	late final _StringsSkedmakerSchedulesOptionsEn options = _StringsSkedmakerSchedulesOptionsEn._(_root);
}

// Path: skedmaker.scheduleDay
class _StringsSkedmakerScheduleDayEn {
	_StringsSkedmakerScheduleDayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerScheduleDayMondayFaceEn mondayFace = _StringsSkedmakerScheduleDayMondayFaceEn._(_root);
	late final _StringsSkedmakerScheduleDayMondayOnlineEn mondayOnline = _StringsSkedmakerScheduleDayMondayOnlineEn._(_root);
	late final _StringsSkedmakerScheduleDayMondayHybridEn mondayHybrid = _StringsSkedmakerScheduleDayMondayHybridEn._(_root);
	late final _StringsSkedmakerScheduleDayMondayUnknownEn mondayUnknown = _StringsSkedmakerScheduleDayMondayUnknownEn._(_root);
	late final _StringsSkedmakerScheduleDayTuesdayFaceEn tuesdayFace = _StringsSkedmakerScheduleDayTuesdayFaceEn._(_root);
	late final _StringsSkedmakerScheduleDayTuesdayOnlineEn tuesdayOnline = _StringsSkedmakerScheduleDayTuesdayOnlineEn._(_root);
	late final _StringsSkedmakerScheduleDayTuesdayHybridEn tuesdayHybrid = _StringsSkedmakerScheduleDayTuesdayHybridEn._(_root);
	late final _StringsSkedmakerScheduleDayTuesdayUnknownEn tuesdayUnknown = _StringsSkedmakerScheduleDayTuesdayUnknownEn._(_root);
	late final _StringsSkedmakerScheduleDayWednesdayFaceEn wednesdayFace = _StringsSkedmakerScheduleDayWednesdayFaceEn._(_root);
	late final _StringsSkedmakerScheduleDayWednesdayOnlineEn wednesdayOnline = _StringsSkedmakerScheduleDayWednesdayOnlineEn._(_root);
	late final _StringsSkedmakerScheduleDayWednesdayHybridEn wednesdayHybrid = _StringsSkedmakerScheduleDayWednesdayHybridEn._(_root);
	late final _StringsSkedmakerScheduleDayWednesdayUnknownEn wednesdayUnknown = _StringsSkedmakerScheduleDayWednesdayUnknownEn._(_root);
	late final _StringsSkedmakerScheduleDayThursdayFaceEn thursdayFace = _StringsSkedmakerScheduleDayThursdayFaceEn._(_root);
	late final _StringsSkedmakerScheduleDayThursdayOnlineEn thursdayOnline = _StringsSkedmakerScheduleDayThursdayOnlineEn._(_root);
	late final _StringsSkedmakerScheduleDayThursdayHybridEn thursdayHybrid = _StringsSkedmakerScheduleDayThursdayHybridEn._(_root);
	late final _StringsSkedmakerScheduleDayThursdayUnknownEn thursdayUnknown = _StringsSkedmakerScheduleDayThursdayUnknownEn._(_root);
	late final _StringsSkedmakerScheduleDayFridayFaceEn fridayFace = _StringsSkedmakerScheduleDayFridayFaceEn._(_root);
	late final _StringsSkedmakerScheduleDayFridayOnlineEn fridayOnline = _StringsSkedmakerScheduleDayFridayOnlineEn._(_root);
	late final _StringsSkedmakerScheduleDayFridayHybridEn fridayHybrid = _StringsSkedmakerScheduleDayFridayHybridEn._(_root);
	late final _StringsSkedmakerScheduleDayFridayUnknownEn fridayUnknown = _StringsSkedmakerScheduleDayFridayUnknownEn._(_root);
	late final _StringsSkedmakerScheduleDaySaturdayFaceEn saturdayFace = _StringsSkedmakerScheduleDaySaturdayFaceEn._(_root);
	late final _StringsSkedmakerScheduleDaySaturdayOnlineEn saturdayOnline = _StringsSkedmakerScheduleDaySaturdayOnlineEn._(_root);
	late final _StringsSkedmakerScheduleDaySaturdayHybridEn saturdayHybrid = _StringsSkedmakerScheduleDaySaturdayHybridEn._(_root);
	late final _StringsSkedmakerScheduleDaySaturdayUnknownEn saturdayUnknown = _StringsSkedmakerScheduleDaySaturdayUnknownEn._(_root);
	late final _StringsSkedmakerScheduleDayMondaythursdayFaceEn mondaythursdayFace = _StringsSkedmakerScheduleDayMondaythursdayFaceEn._(_root);
	late final _StringsSkedmakerScheduleDayMondaythursdayOnlineEn mondaythursdayOnline = _StringsSkedmakerScheduleDayMondaythursdayOnlineEn._(_root);
	late final _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceEn mondaythursdayOnlineface = _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceEn._(_root);
	late final _StringsSkedmakerScheduleDayMondaythursdayFaceonlineEn mondaythursdayFaceonline = _StringsSkedmakerScheduleDayMondaythursdayFaceonlineEn._(_root);
	late final _StringsSkedmakerScheduleDayMondaythursdayUnknownEn mondaythursdayUnknown = _StringsSkedmakerScheduleDayMondaythursdayUnknownEn._(_root);
	late final _StringsSkedmakerScheduleDayTuesdayfridayFaceEn tuesdayfridayFace = _StringsSkedmakerScheduleDayTuesdayfridayFaceEn._(_root);
	late final _StringsSkedmakerScheduleDayTuesdayfridayOnlineEn tuesdayfridayOnline = _StringsSkedmakerScheduleDayTuesdayfridayOnlineEn._(_root);
	late final _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn tuesdayfridayOnlineface = _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn._(_root);
	late final _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineEn tuesdayfridayFaceonline = _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineEn._(_root);
	late final _StringsSkedmakerScheduleDayTuesdayfridayUnknownEn tuesdayfridayUnknown = _StringsSkedmakerScheduleDayTuesdayfridayUnknownEn._(_root);
	late final _StringsSkedmakerScheduleDayWednesdaysaturdayFaceEn wednesdaysaturdayFace = _StringsSkedmakerScheduleDayWednesdaysaturdayFaceEn._(_root);
	late final _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineEn wednesdaysaturdayOnline = _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineEn._(_root);
	late final _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn wednesdaysaturdayOnlineface = _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn._(_root);
	late final _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn wednesdaysaturdayFaceonline = _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn._(_root);
	late final _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownEn wednesdaysaturdayUnknown = _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownEn._(_root);
	late final _StringsSkedmakerScheduleDayUnknownEn unknown = _StringsSkedmakerScheduleDayUnknownEn._(_root);
}

// Path: skedmaker.scheduleRoom
class _StringsSkedmakerScheduleRoomEn {
	_StringsSkedmakerScheduleRoomEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'No room';
	String get online => 'Online';
	String hybrid({required Object room}) => '${room} and online';
}

// Path: skedmaker.scheduleDefault
class _StringsSkedmakerScheduleDefaultEn {
	_StringsSkedmakerScheduleDefaultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String name({required Object n}) => 'Schedule ${n}';
}

// Path: skedmaker.infobar
class _StringsSkedmakerInfobarEn {
	_StringsSkedmakerInfobarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get currentlyGeneratingSchedules => 'Currently generating schedules. Changes here will not apply until you generate again.';
}

// Path: general.home.more
class _StringsGeneralHomeMoreEn {
	_StringsGeneralHomeMoreEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'More coming soon!';
	String get desc => 'Stay updated! :)';
}

// Path: general.drawer.about
class _StringsGeneralDrawerAboutEn {
	_StringsGeneralDrawerAboutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'About';
	String version({required Object version, required Object build}) => 'Version ${version} build ${build}';
	String get copyright => 'Copyright (C) 2024 Yivan Andrei Padsoyan';
}

// Path: general.drawer.support
class _StringsGeneralDrawerSupportEn {
	_StringsGeneralDrawerSupportEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Buy Me A Coffee';
	String get desc => 'Support me!';
}

// Path: general.drawer.github
class _StringsGeneralDrawerGithubEn {
	_StringsGeneralDrawerGithubEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'View source code';
	String get desc => 'Contribute to AralTools!';
}

// Path: general.drawer.bugs
class _StringsGeneralDrawerBugsEn {
	_StringsGeneralDrawerBugsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Issue tracker';
	String get desc => 'Report issues & bugs here!';
}

// Path: general.drawer.language
class _StringsGeneralDrawerLanguageEn {
	_StringsGeneralDrawerLanguageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String title({required Object language}) => 'Language: ${language}';
	String get tooltip => 'Change language';
}

// Path: general.functions.backToHome
class _StringsGeneralFunctionsBackToHomeEn {
	_StringsGeneralFunctionsBackToHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Back to home';
	String get title => 'Go back to home?';
	String get desc => 'All unsaved data will be lost.';
}

// Path: general.functions.newProject
class _StringsGeneralFunctionsNewProjectEn {
	_StringsGeneralFunctionsNewProjectEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Create new project?';
	String get desc => 'All unsaved data will be lost.';
}

// Path: general.general.open
class _StringsGeneralGeneralOpenEn {
	_StringsGeneralGeneralOpenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get regular => 'Open';
	String get ellipsis => 'Open...';
}

// Path: general.general.saveAs
class _StringsGeneralGeneralSaveAsEn {
	_StringsGeneralGeneralSaveAsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get regular => 'Save as';
	String get ellipsis => 'Save as...';
}

// Path: general.general.date
class _StringsGeneralGeneralDateEn {
	_StringsGeneralGeneralDateEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<String> get eras => [
		'BC',
		'AD',
	];
	List<String> get eraNames => [
		'Before Christ',
		'Anno Domini',
	];
	List<String> get narrowMonths => [
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
		'D',
	];
	List<String> get standaloneNarrowMonths => [
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
		'D',
	];
	List<String> get months => [
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
		'December',
	];
	List<String> get standaloneMonths => [
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
		'December',
	];
	List<String> get shortMonths => [
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
		'Dec',
	];
	List<String> get standaloneShortMonths => [
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
		'Dec',
	];
	List<String> get weekdays => [
		'Sunday',
		'Monday',
		'Tuesday',
		'Wednesday',
		'Thursday',
		'Friday',
		'Saturday',
	];
	List<String> get standaloneWeekdays => [
		'Sunday',
		'Monday',
		'Tuesday',
		'Wednesday',
		'Thursday',
		'Friday',
		'Saturday',
	];
	List<String> get shortWeekdays => [
		'Sun',
		'Mon',
		'Tue',
		'Wed',
		'Thu',
		'Fri',
		'Sat',
	];
	List<String> get standaloneShortWeekdays => [
		'Sun',
		'Mon',
		'Tue',
		'Wed',
		'Thu',
		'Fri',
		'Sat',
	];
	List<String> get narrowWeekdays => [
		'S',
		'M',
		'T',
		'W',
		'T',
		'F',
		'S',
	];
	List<String> get standaloneNarrowWeekdays => [
		'S',
		'M',
		'T',
		'W',
		'T',
		'F',
		'S',
	];
	List<String> get shortQuarters => [
		'Q1',
		'Q2',
		'Q3',
		'Q4',
	];
	List<String> get quarters => [
		'1st quarter',
		'2nd quarter',
		'3rd quarter',
		'4th quarter',
	];
	List<String> get ampms => [
		'AM',
		'PM',
	];
	List<String> get dateFormats => [
		'EEEE, MMMM d, y',
		'MMMM d, y',
		'MMM d, y',
		'M/d/yy',
	];
	List<String> get timeFormats => [
		'h:mm:ss a zzzz',
		'h:mm:ss a z',
		'h:mm:ss a',
		'h:mm a',
	];
	String get firstDayOfWeek => '6';
	List<String> get weekendRange => [
		'5',
		'6',
	];
	String get firstWeekCutoffDay => '5';
	List<String> get dateTimeFormats => [
		'{1}, {0}',
		'{1}, {0}',
		'{1}, {0}',
		'{1}, {0}',
	];
}

// Path: skedmaker.drawer.fileLocation
class _StringsSkedmakerDrawerFileLocationEn {
	_StringsSkedmakerDrawerFileLocationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'File location';
	String get empty => '-';
	String get open => 'Open file location';
}

// Path: skedmaker.subjects.add
class _StringsSkedmakerSubjectsAddEn {
	_StringsSkedmakerSubjectsAddEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Add subject';
	late final _StringsSkedmakerSubjectsAddButtonMlsEn buttonMls = _StringsSkedmakerSubjectsAddButtonMlsEn._(_root);
	late final _StringsSkedmakerSubjectsAddButtonManualEn buttonManual = _StringsSkedmakerSubjectsAddButtonManualEn._(_root);
	late final _StringsSkedmakerSubjectsAddButtonCodeEn buttonCode = _StringsSkedmakerSubjectsAddButtonCodeEn._(_root);
}

// Path: skedmaker.subjects.subject
class _StringsSkedmakerSubjectsSubjectEn {
	_StringsSkedmakerSubjectsSubjectEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String title({required Object subject, required Object offering, required Object available}) => '${subject} - ${offering} offerings (${available} available)';
	late final _StringsSkedmakerSubjectsSubjectActionsEn actions = _StringsSkedmakerSubjectsSubjectActionsEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectTableEn table = _StringsSkedmakerSubjectsSubjectTableEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectInfobarEn infobar = _StringsSkedmakerSubjectsSubjectInfobarEn._(_root);
}

// Path: skedmaker.subjects.empty
class _StringsSkedmakerSubjectsEmptyEn {
	_StringsSkedmakerSubjectsEmptyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String title({required Object subject}) => '${subject} has no offerings';
}

// Path: skedmaker.filters.categories
class _StringsSkedmakerFiltersCategoriesEn {
	_StringsSkedmakerFiltersCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerFiltersCategoriesOfferingsEn offerings = _StringsSkedmakerFiltersCategoriesOfferingsEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesDayEn day = _StringsSkedmakerFiltersCategoriesDayEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesLocationEn location = _StringsSkedmakerFiltersCategoriesLocationEn._(_root);
}

// Path: skedmaker.schedules.generate
class _StringsSkedmakerSchedulesGenerateEn {
	_StringsSkedmakerSchedulesGenerateEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Generate possible schedules';
	String get button => 'Generate';
	String get pending => 'No schedules found yet. This will take some time.';
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${n} schedule found',
		other: '${n} schedules found',
	);
	String progress({required Object percent}) => '${percent}% complete';
	String get none => 'No schedules found. Maybe check your filters and try again.';
}

// Path: skedmaker.schedules.commandbar
class _StringsSkedmakerSchedulesCommandbarEn {
	_StringsSkedmakerSchedulesCommandbarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerSchedulesCommandbarRenameEn rename = _StringsSkedmakerSchedulesCommandbarRenameEn._(_root);
	late final _StringsSkedmakerSchedulesCommandbarDeleteEn delete = _StringsSkedmakerSchedulesCommandbarDeleteEn._(_root);
	late final _StringsSkedmakerSchedulesCommandbarStarEn star = _StringsSkedmakerSchedulesCommandbarStarEn._(_root);
	late final _StringsSkedmakerSchedulesCommandbarSaveImageEn saveImage = _StringsSkedmakerSchedulesCommandbarSaveImageEn._(_root);
}

// Path: skedmaker.schedules.details
class _StringsSkedmakerSchedulesDetailsEn {
	_StringsSkedmakerSchedulesDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Details';
	String get notes => 'Notes';
	String get subjects => 'Subjects';
}

// Path: skedmaker.schedules.info
class _StringsSkedmakerSchedulesInfoEn {
	_StringsSkedmakerSchedulesInfoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Info';
	String get title => 'Information';
	String get desc => 'Select a schedule from the left.\nView and compare multiple schedules by opening new tabs at the top.\n\nKeyboard shortcuts:\nUp/Down arrow key - go to next/previous schedule\nCtrl + T - create new tab\nCtrl + W or Ctrl + F4 - close current tab\nCtrl + 1 to 8 - go to first to eighth tab\nCtrl + 9 - go to last tab';
}

// Path: skedmaker.schedules.options
class _StringsSkedmakerSchedulesOptionsEn {
	_StringsSkedmakerSchedulesOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hoverEffects => 'Enable hover effects';
}

// Path: skedmaker.scheduleDay.mondayFace
class _StringsSkedmakerScheduleDayMondayFaceEn {
	_StringsSkedmakerScheduleDayMondayFaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (face-to-face)';
	String get nameShort => 'M (f2f)';
}

// Path: skedmaker.scheduleDay.mondayOnline
class _StringsSkedmakerScheduleDayMondayOnlineEn {
	_StringsSkedmakerScheduleDayMondayOnlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (online)';
	String get nameShort => 'M (online)';
}

// Path: skedmaker.scheduleDay.mondayHybrid
class _StringsSkedmakerScheduleDayMondayHybridEn {
	_StringsSkedmakerScheduleDayMondayHybridEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (hybrid)';
	String get nameShort => 'M (hybrid)';
}

// Path: skedmaker.scheduleDay.mondayUnknown
class _StringsSkedmakerScheduleDayMondayUnknownEn {
	_StringsSkedmakerScheduleDayMondayUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday';
	String get nameShort => 'M';
}

// Path: skedmaker.scheduleDay.tuesdayFace
class _StringsSkedmakerScheduleDayTuesdayFaceEn {
	_StringsSkedmakerScheduleDayTuesdayFaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (face-to-face)';
	String get nameShort => 'T (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayOnline
class _StringsSkedmakerScheduleDayTuesdayOnlineEn {
	_StringsSkedmakerScheduleDayTuesdayOnlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (online)';
	String get nameShort => 'T (online)';
}

// Path: skedmaker.scheduleDay.tuesdayHybrid
class _StringsSkedmakerScheduleDayTuesdayHybridEn {
	_StringsSkedmakerScheduleDayTuesdayHybridEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (hybrid)';
	String get nameShort => 'T (hybrid)';
}

// Path: skedmaker.scheduleDay.tuesdayUnknown
class _StringsSkedmakerScheduleDayTuesdayUnknownEn {
	_StringsSkedmakerScheduleDayTuesdayUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday';
	String get nameShort => 'T';
}

// Path: skedmaker.scheduleDay.wednesdayFace
class _StringsSkedmakerScheduleDayWednesdayFaceEn {
	_StringsSkedmakerScheduleDayWednesdayFaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (face-to-face)';
	String get nameShort => 'W (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdayOnline
class _StringsSkedmakerScheduleDayWednesdayOnlineEn {
	_StringsSkedmakerScheduleDayWednesdayOnlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (online)';
	String get nameShort => 'W (online)';
}

// Path: skedmaker.scheduleDay.wednesdayHybrid
class _StringsSkedmakerScheduleDayWednesdayHybridEn {
	_StringsSkedmakerScheduleDayWednesdayHybridEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (hybrid)';
	String get nameShort => 'W (hybrid)';
}

// Path: skedmaker.scheduleDay.wednesdayUnknown
class _StringsSkedmakerScheduleDayWednesdayUnknownEn {
	_StringsSkedmakerScheduleDayWednesdayUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday';
	String get nameShort => 'W';
}

// Path: skedmaker.scheduleDay.thursdayFace
class _StringsSkedmakerScheduleDayThursdayFaceEn {
	_StringsSkedmakerScheduleDayThursdayFaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (face-to-face)';
	String get nameShort => 'H (f2f)';
}

// Path: skedmaker.scheduleDay.thursdayOnline
class _StringsSkedmakerScheduleDayThursdayOnlineEn {
	_StringsSkedmakerScheduleDayThursdayOnlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (online)';
	String get nameShort => 'H (online)';
}

// Path: skedmaker.scheduleDay.thursdayHybrid
class _StringsSkedmakerScheduleDayThursdayHybridEn {
	_StringsSkedmakerScheduleDayThursdayHybridEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (hybrid)';
	String get nameShort => 'H (hybrid)';
}

// Path: skedmaker.scheduleDay.thursdayUnknown
class _StringsSkedmakerScheduleDayThursdayUnknownEn {
	_StringsSkedmakerScheduleDayThursdayUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday';
	String get nameShort => 'H';
}

// Path: skedmaker.scheduleDay.fridayFace
class _StringsSkedmakerScheduleDayFridayFaceEn {
	_StringsSkedmakerScheduleDayFridayFaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Friday (face-to-face)';
	String get nameShort => 'F (f2f)';
}

// Path: skedmaker.scheduleDay.fridayOnline
class _StringsSkedmakerScheduleDayFridayOnlineEn {
	_StringsSkedmakerScheduleDayFridayOnlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Friday (online)';
	String get nameShort => 'F (online)';
}

// Path: skedmaker.scheduleDay.fridayHybrid
class _StringsSkedmakerScheduleDayFridayHybridEn {
	_StringsSkedmakerScheduleDayFridayHybridEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Friday (hybrid)';
	String get nameShort => 'F (hybrid)';
}

// Path: skedmaker.scheduleDay.fridayUnknown
class _StringsSkedmakerScheduleDayFridayUnknownEn {
	_StringsSkedmakerScheduleDayFridayUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Friday';
	String get nameShort => 'F';
}

// Path: skedmaker.scheduleDay.saturdayFace
class _StringsSkedmakerScheduleDaySaturdayFaceEn {
	_StringsSkedmakerScheduleDaySaturdayFaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday (face-to-face)';
	String get nameShort => 'S (f2f)';
}

// Path: skedmaker.scheduleDay.saturdayOnline
class _StringsSkedmakerScheduleDaySaturdayOnlineEn {
	_StringsSkedmakerScheduleDaySaturdayOnlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday (online)';
	String get nameShort => 'S (online)';
}

// Path: skedmaker.scheduleDay.saturdayHybrid
class _StringsSkedmakerScheduleDaySaturdayHybridEn {
	_StringsSkedmakerScheduleDaySaturdayHybridEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday (hybrid)';
	String get nameShort => 'S (hybrid)';
}

// Path: skedmaker.scheduleDay.saturdayUnknown
class _StringsSkedmakerScheduleDaySaturdayUnknownEn {
	_StringsSkedmakerScheduleDaySaturdayUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday';
	String get nameShort => 'S';
}

// Path: skedmaker.scheduleDay.mondaythursdayFace
class _StringsSkedmakerScheduleDayMondaythursdayFaceEn {
	_StringsSkedmakerScheduleDayMondaythursdayFaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday and Thursday (both face-to-face)';
	String get nameShort => 'M & H (both f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnline
class _StringsSkedmakerScheduleDayMondaythursdayOnlineEn {
	_StringsSkedmakerScheduleDayMondaythursdayOnlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday and Thursday (both online)';
	String get nameShort => 'M & H (both online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnlineface
class _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceEn {
	_StringsSkedmakerScheduleDayMondaythursdayOnlinefaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (online) and Thursday (face-to-face)';
	String get nameShort => 'M (online) & H (f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayFaceonline
class _StringsSkedmakerScheduleDayMondaythursdayFaceonlineEn {
	_StringsSkedmakerScheduleDayMondaythursdayFaceonlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (face-to-face) and Thursday (online)';
	String get nameShort => 'M (f2f) & H (online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayUnknown
class _StringsSkedmakerScheduleDayMondaythursdayUnknownEn {
	_StringsSkedmakerScheduleDayMondaythursdayUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday and Thursday';
	String get nameShort => 'M & H';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFace
class _StringsSkedmakerScheduleDayTuesdayfridayFaceEn {
	_StringsSkedmakerScheduleDayTuesdayfridayFaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday and Friday (both face-to-face)';
	String get nameShort => 'T & F (both f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnline
class _StringsSkedmakerScheduleDayTuesdayfridayOnlineEn {
	_StringsSkedmakerScheduleDayTuesdayfridayOnlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday and Friday (both online)';
	String get nameShort => 'T & F (both online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnlineface
class _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn {
	_StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (online) and Friday (face-to-face)';
	String get nameShort => 'T (online) & F (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFaceonline
class _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineEn {
	_StringsSkedmakerScheduleDayTuesdayfridayFaceonlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (face-to-face) and Friday (online)';
	String get nameShort => 'T (f2f) & F (online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayUnknown
class _StringsSkedmakerScheduleDayTuesdayfridayUnknownEn {
	_StringsSkedmakerScheduleDayTuesdayfridayUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday and Friday';
	String get nameShort => 'T & F';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFace
class _StringsSkedmakerScheduleDayWednesdaysaturdayFaceEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayFaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday and Saturday (both face-to-face)';
	String get nameShort => 'W & S (both f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnline
class _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayOnlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday and Saturday (both online)';
	String get nameShort => 'W & S (both online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnlineface
class _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (online) and Saturday (face-to-face)';
	String get nameShort => 'W (online) & S (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFaceonline
class _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (face-to-face) and Saturday (online)';
	String get nameShort => 'W (f2f) & S (online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayUnknown
class _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday and Saturday';
	String get nameShort => 'W & S';
}

// Path: skedmaker.scheduleDay.unknown
class _StringsSkedmakerScheduleDayUnknownEn {
	_StringsSkedmakerScheduleDayUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Unknown';
	String get nameShort => 'Unknown';
}

// Path: skedmaker.subjects.add.buttonMls
class _StringsSkedmakerSubjectsAddButtonMlsEn {
	_StringsSkedmakerSubjectsAddButtonMlsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Add from My.LaSalle';
	String get title => 'Add subject';
	String get desc => 'Enter your ID number and the subject code on the pop-up window. Once the offerings are displayed, click "Add".';
	String get webviewTitle => 'WebView2 is not installed';
	TextSpan webviewDesc({required InlineSpanBuilder webview, required InlineSpanBuilder learn}) => TextSpan(children: [
		const TextSpan(text: 'You need to download and install the '),
		webview('Microsoft Edge WebView2 Runtime'),
		const TextSpan(text: ' to access My.LaSalle within AralTools SkedMaker. This program is already included with Windows 11, but your device doesn\'t.\n\n'),
		learn('Click here to learn more.'),
	]);
}

// Path: skedmaker.subjects.add.buttonManual
class _StringsSkedmakerSubjectsAddButtonManualEn {
	_StringsSkedmakerSubjectsAddButtonManualEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Add manually';
	String get title => 'Create new subject';
	String get desc => 'Enter a 7-character subject code:';
}

// Path: skedmaker.subjects.add.buttonCode
class _StringsSkedmakerSubjectsAddButtonCodeEn {
	_StringsSkedmakerSubjectsAddButtonCodeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Add via code';
	String get title => 'Add subjects via code';
	TextSpan desc({required InlineSpanBuilder mls}) => TextSpan(children: [
		const TextSpan(text: 'Open '),
		mls(_root.skedmaker.mlsCourseOfferings),
		const TextSpan(text: ' on a browser and enter your ID number and subject code as normal. Once the offerings are displayed, open the Developer Console and enter this command:'),
	]);
	String get field => 'Copy the output and paste it here:';
	String get hint => 'The command output';
	String get error => 'Invalid input';
}

// Path: skedmaker.subjects.subject.actions
class _StringsSkedmakerSubjectsSubjectActionsEn {
	_StringsSkedmakerSubjectsSubjectActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerSubjectsSubjectActionsRecolorEn recolor = _StringsSkedmakerSubjectsSubjectActionsRecolorEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectActionsDeleteEn delete = _StringsSkedmakerSubjectsSubjectActionsDeleteEn._(_root);
	String get showhide => 'Show/Hide';
	String get offeringAdd => 'Add offering';
	late final _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteEn offeringDelete = _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteEn._(_root);
}

// Path: skedmaker.subjects.subject.table
class _StringsSkedmakerSubjectsSubjectTableEn {
	_StringsSkedmakerSubjectsSubjectTableEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerSubjectsSubjectTableStatusEn status = _StringsSkedmakerSubjectsSubjectTableStatusEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectTableClassnoEn classno = _StringsSkedmakerSubjectsSubjectTableClassnoEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectTableSectionEn section = _StringsSkedmakerSubjectsSubjectTableSectionEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectTableRoomEn room = _StringsSkedmakerSubjectsSubjectTableRoomEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectTableDayEn day = _StringsSkedmakerSubjectsSubjectTableDayEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectTableTimeEn time = _StringsSkedmakerSubjectsSubjectTableTimeEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectTableTeacherEn teacher = _StringsSkedmakerSubjectsSubjectTableTeacherEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectTableSlotsEn slots = _StringsSkedmakerSubjectsSubjectTableSlotsEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectTableRemarksEn remarks = _StringsSkedmakerSubjectsSubjectTableRemarksEn._(_root);
}

// Path: skedmaker.subjects.subject.infobar
class _StringsSkedmakerSubjectsSubjectInfobarEn {
	_StringsSkedmakerSubjectsSubjectInfobarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String noAvailableOffering({required Object subject}) => '${subject} has no available offerings.';
	String hidden({required Object subject}) => '${subject} is hidden. It won\'t be included when generating schedules.';
}

// Path: skedmaker.filters.categories.offerings
class _StringsSkedmakerFiltersCategoriesOfferingsEn {
	_StringsSkedmakerFiltersCategoriesOfferingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Offerings';
	String get desc => 'Filter the offerings to include/exclude';
	late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn includeClosed = _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn includeFullSlots = _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn includeUnknownModality = _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn includeNoTeachers = _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn excludeSectionLetter = _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn includeFreshmanBlock = _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn._(_root);
}

// Path: skedmaker.filters.categories.day
class _StringsSkedmakerFiltersCategoriesDayEn {
	_StringsSkedmakerFiltersCategoriesDayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Day-specific';
	String get desc => 'Add specific filters for each day of the week';
	late final _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn commonMaxNumberOfSubjects = _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn commonTimeInterval = _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesDayCommonModalityEn commonModality = _StringsSkedmakerFiltersCategoriesDayCommonModalityEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn commonStartWithSubject = _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn commonEndWithSubject = _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeEn commonBreaktime = _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeEn._(_root);
	String get mondayName => 'Monday';
	String get tuesdayName => 'Tuesday';
	String get wednesdayName => 'Wednesday';
	String get thursdayName => 'Thursday';
	String get fridayName => 'Friday';
	String get saturdayName => 'Saturday';
}

// Path: skedmaker.filters.categories.location
class _StringsSkedmakerFiltersCategoriesLocationEn {
	_StringsSkedmakerFiltersCategoriesLocationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Location (experimental)';
	String get desc => 'Filter schedules based on each offering\'s location';
	late final _StringsSkedmakerFiltersCategoriesLocationEnabledEn enabled = _StringsSkedmakerFiltersCategoriesLocationEnabledEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn checkingDistanceMinutes = _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn maxAllowedDistanceMeters = _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesLocationCalculatorEn calculator = _StringsSkedmakerFiltersCategoriesLocationCalculatorEn._(_root);
}

// Path: skedmaker.schedules.commandbar.rename
class _StringsSkedmakerSchedulesCommandbarRenameEn {
	_StringsSkedmakerSchedulesCommandbarRenameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Rename';
	String get edit => 'Enter new name';
}

// Path: skedmaker.schedules.commandbar.delete
class _StringsSkedmakerSchedulesCommandbarDeleteEn {
	_StringsSkedmakerSchedulesCommandbarDeleteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Delete';
	String desc({required Object name}) => 'Delete ${name}?\nYou cannot un-delete this.\nAll tabs with this schedule will be removed.';
}

// Path: skedmaker.schedules.commandbar.star
class _StringsSkedmakerSchedulesCommandbarStarEn {
	_StringsSkedmakerSchedulesCommandbarStarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get star => 'Star';
	String get unstar => 'Unstar';
}

// Path: skedmaker.schedules.commandbar.saveImage
class _StringsSkedmakerSchedulesCommandbarSaveImageEn {
	_StringsSkedmakerSchedulesCommandbarSaveImageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Save as image';
	String get title => 'Save as image';
	String get desc => 'Resize the window to adjust the image formatting. When done, click "${_root.general.general.save}".';
	TextSpan credits({required InlineSpanBuilder name}) => TextSpan(children: [
		const TextSpan(text: 'generated by '),
		name(_root.skedmaker.info.nameFull),
	]);
}

// Path: skedmaker.subjects.subject.actions.recolor
class _StringsSkedmakerSubjectsSubjectActionsRecolorEn {
	_StringsSkedmakerSubjectsSubjectActionsRecolorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Recolor';
	String get title => 'Select color';
	String get primary => 'Primary';
	String get wheel => 'Wheel';
	String get shades => 'Shades';
}

// Path: skedmaker.subjects.subject.actions.delete
class _StringsSkedmakerSubjectsSubjectActionsDeleteEn {
	_StringsSkedmakerSubjectsSubjectActionsDeleteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Delete';
	String warning({required Object subject}) => 'Delete ${subject}? \nYou cannot un-delete this.';
}

// Path: skedmaker.subjects.subject.actions.offeringDelete
class _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteEn {
	_StringsSkedmakerSubjectsSubjectActionsOfferingDeleteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Delete offering';
	String get warning => 'Delete this offering? \nYou cannot un-delete this.';
}

// Path: skedmaker.subjects.subject.table.status
class _StringsSkedmakerSubjectsSubjectTableStatusEn {
	_StringsSkedmakerSubjectsSubjectTableStatusEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Status';
	String get open => 'Open';
	String get closed => 'Closed';
}

// Path: skedmaker.subjects.subject.table.classno
class _StringsSkedmakerSubjectsSubjectTableClassnoEn {
	_StringsSkedmakerSubjectsSubjectTableClassnoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Class \#';
	String get edit => 'Edit class number:';
}

// Path: skedmaker.subjects.subject.table.section
class _StringsSkedmakerSubjectsSubjectTableSectionEn {
	_StringsSkedmakerSubjectsSubjectTableSectionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Section';
	String get edit => 'Edit section:';
}

// Path: skedmaker.subjects.subject.table.room
class _StringsSkedmakerSubjectsSubjectTableRoomEn {
	_StringsSkedmakerSubjectsSubjectTableRoomEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Room';
	String get edit => 'Edit room (can be empty):';
}

// Path: skedmaker.subjects.subject.table.day
class _StringsSkedmakerSubjectsSubjectTableDayEn {
	_StringsSkedmakerSubjectsSubjectTableDayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Day';
	String get edit => 'Edit day:';
}

// Path: skedmaker.subjects.subject.table.time
class _StringsSkedmakerSubjectsSubjectTableTimeEn {
	_StringsSkedmakerSubjectsSubjectTableTimeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Time';
	String data({required Object from, required Object to}) => '${from} - ${to}';
	String get edit => 'Edit time:';
	String get to => ' to ';
	String get secondTimeInterval => 'Second time interval';
	String get errorStartTimeBeforeEndTime => 'Start time must be before end time';
	String get errorSecondTimeInterval => 'This must have a second time interval';
	String get errorConflict => 'The two time intervals must not conflict since it\'s on the same day';
}

// Path: skedmaker.subjects.subject.table.teacher
class _StringsSkedmakerSubjectsSubjectTableTeacherEn {
	_StringsSkedmakerSubjectsSubjectTableTeacherEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Teacher';
	String get edit => 'Edit teacher (can be empty):';
}

// Path: skedmaker.subjects.subject.table.slots
class _StringsSkedmakerSubjectsSubjectTableSlotsEn {
	_StringsSkedmakerSubjectsSubjectTableSlotsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Slots';
	String data({required Object taken, required Object capacity}) => '${taken} / ${capacity}';
	String percent({required Object percent}) => '${percent}%';
	String get edit => 'Edit slots:';
	String get outOf => ' out of ';
}

// Path: skedmaker.subjects.subject.table.remarks
class _StringsSkedmakerSubjectsSubjectTableRemarksEn {
	_StringsSkedmakerSubjectsSubjectTableRemarksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Remarks';
	String get edit => 'Edit remarks (can be empty):';
}

// Path: skedmaker.filters.categories.offerings.includeClosed
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include closed offerings';
	String get desc => 'Enable this to ignore its status (whether it is open or closed)';
}

// Path: skedmaker.filters.categories.offerings.includeFullSlots
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include offerings with full slots';
	String get desc => 'Enable this to ignore its slot capacity';
}

// Path: skedmaker.filters.categories.offerings.includeUnknownModality
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include offerings with unknown modality';
}

// Path: skedmaker.filters.categories.offerings.includeNoTeachers
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include offerings with no teachers';
}

// Path: skedmaker.filters.categories.offerings.excludeSectionLetter
class _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn {
	_StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Exclude sections that contains the following';
	String get desc => 'Use this to exclude offerings whose section contains certain letter(s)';
}

// Path: skedmaker.filters.categories.offerings.includeFreshmanBlock
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include freshman block';
}

// Path: skedmaker.filters.categories.day.commonMaxNumberOfSubjects
class _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn {
	_StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Maximum number of subjects';
	String get desc => 'Enter -1 if no limit; enter 0 if no subjects at all';
}

// Path: skedmaker.filters.categories.day.commonTimeInterval
class _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn {
	_StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Only have subjects at this time interval';
}

// Path: skedmaker.filters.categories.day.commonModality
class _StringsSkedmakerFiltersCategoriesDayCommonModalityEn {
	_StringsSkedmakerFiltersCategoriesDayCommonModalityEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Modality of subjects';
	String get hybrid => 'Online or face-to-face';
	String get online => 'Online';
	String get face => 'Face-to-face';
	String get any => 'Any modality';
	String get unknown => 'Unknown modality';
}

// Path: skedmaker.filters.categories.day.commonStartWithSubject
class _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn {
	_StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'First subject of the day';
}

// Path: skedmaker.filters.categories.day.commonEndWithSubject
class _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn {
	_StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Last subject of the day';
}

// Path: skedmaker.filters.categories.day.commonBreaktime
class _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeEn {
	_StringsSkedmakerFiltersCategoriesDayCommonBreaktimeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Breaktime';
	String get desc => 'Time where there should be no subjects';
}

// Path: skedmaker.filters.categories.location.enabled
class _StringsSkedmakerFiltersCategoriesLocationEnabledEn {
	_StringsSkedmakerFiltersCategoriesLocationEnabledEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Enable filtering using location & distances';
	String get desc => 'This will consider the distance of: The previous class → the ground floor → \nthe ground floor of the next class → the next class. If both are on \nthe same building, this is just the distance from the previous to the next.';
}

// Path: skedmaker.filters.categories.location.checkingDistanceMinutes
class _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn {
	_StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Time gap between subjects to check for distance (in minutes)';
}

// Path: skedmaker.filters.categories.location.maxAllowedDistanceMeters
class _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn {
	_StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Maximum distance from one subject to the next (in meters)';
}

// Path: skedmaker.filters.categories.location.calculator
class _StringsSkedmakerFiltersCategoriesLocationCalculatorEn {
	_StringsSkedmakerFiltersCategoriesLocationCalculatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Open distance calculator';
	String get title => 'Distance calculator';
	String get desc => 'Note: This is only an estimate.';
	String get from => 'From:';
	String get to => 'To:';
	String get hint => 'Room code (eg. A1105)';
	String get calculate => 'Calculate';
	String result({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '~${n} meter',
		other: '~${n} meters',
	);
}

// Path: <root>
class _StringsTl extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTl.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.tl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _StringsTl _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralTl general = _StringsGeneralTl._(_root);
	@override late final _StringsSkedmakerTl skedmaker = _StringsSkedmakerTl._(_root);
}

// Path: general
class _StringsGeneralTl extends _StringsGeneralEn {
	_StringsGeneralTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralAppTl app = _StringsGeneralAppTl._(_root);
	@override late final _StringsGeneralHomeTl home = _StringsGeneralHomeTl._(_root);
	@override late final _StringsGeneralDrawerTl drawer = _StringsGeneralDrawerTl._(_root);
	@override late final _StringsGeneralFunctionsTl functions = _StringsGeneralFunctionsTl._(_root);
	@override late final _StringsGeneralGeneralTl general = _StringsGeneralGeneralTl._(_root);
}

// Path: skedmaker
class _StringsSkedmakerTl extends _StringsSkedmakerEn {
	_StringsSkedmakerTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerInfoTl info = _StringsSkedmakerInfoTl._(_root);
	@override late final _StringsSkedmakerDrawerTl drawer = _StringsSkedmakerDrawerTl._(_root);
	@override late final _StringsSkedmakerSubjectsTl subjects = _StringsSkedmakerSubjectsTl._(_root);
	@override late final _StringsSkedmakerFiltersTl filters = _StringsSkedmakerFiltersTl._(_root);
	@override late final _StringsSkedmakerSchedulesTl schedules = _StringsSkedmakerSchedulesTl._(_root);
	@override late final _StringsSkedmakerScheduleDayTl scheduleDay = _StringsSkedmakerScheduleDayTl._(_root);
	@override late final _StringsSkedmakerScheduleRoomTl scheduleRoom = _StringsSkedmakerScheduleRoomTl._(_root);
	@override late final _StringsSkedmakerScheduleDefaultTl scheduleDefault = _StringsSkedmakerScheduleDefaultTl._(_root);
	@override String get mlsCourseOfferings => 'Mga Alok ng Kurso sa My.LaSalle';
	@override late final _StringsSkedmakerInfobarTl infobar = _StringsSkedmakerInfobarTl._(_root);
}

// Path: general.app
class _StringsGeneralAppTl extends _StringsGeneralAppEn {
	_StringsGeneralAppTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'AralTools';
}

// Path: general.home
class _StringsGeneralHomeTl extends _StringsGeneralHomeEn {
	_StringsGeneralHomeTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tahanan';
	@override String get welcome => 'Maligayang pagdating!';
	@override late final _StringsGeneralHomeMoreTl more = _StringsGeneralHomeMoreTl._(_root);
}

// Path: general.drawer
class _StringsGeneralDrawerTl extends _StringsGeneralDrawerEn {
	_StringsGeneralDrawerTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralDrawerAboutTl about = _StringsGeneralDrawerAboutTl._(_root);
	@override late final _StringsGeneralDrawerSupportTl support = _StringsGeneralDrawerSupportTl._(_root);
	@override late final _StringsGeneralDrawerGithubTl github = _StringsGeneralDrawerGithubTl._(_root);
	@override late final _StringsGeneralDrawerBugsTl bugs = _StringsGeneralDrawerBugsTl._(_root);
	@override late final _StringsGeneralDrawerLanguageTl language = _StringsGeneralDrawerLanguageTl._(_root);
}

// Path: general.functions
class _StringsGeneralFunctionsTl extends _StringsGeneralFunctionsEn {
	_StringsGeneralFunctionsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralFunctionsBackToHomeTl backToHome = _StringsGeneralFunctionsBackToHomeTl._(_root);
	@override late final _StringsGeneralFunctionsNewProjectTl newProject = _StringsGeneralFunctionsNewProjectTl._(_root);
}

// Path: general.general
class _StringsGeneralGeneralTl extends _StringsGeneralGeneralEn {
	_StringsGeneralGeneralTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get go => 'Pumunta';
	@override String get ok => 'Okay';
	@override late final _StringsGeneralGeneralOpenTl open = _StringsGeneralGeneralOpenTl._(_root);
	@override String get delete => 'Ibura';
	@override String get add => 'Idagdag';
	@override String get select => 'Piliin';
	@override String get save => 'Impukin';
	@override String get saveDont => '\'Wag impukin';
	@override late final _StringsGeneralGeneralSaveAsTl saveAs = _StringsGeneralGeneralSaveAsTl._(_root);
	@override String get cancel => 'Kansela';
	@override String get resume => 'Itulóy';
	@override String get pause => 'Ihinto';
	@override String get stop => 'Itigil';
	@override String get close => 'Isara';
	@override String get rename => 'Ipangalan';
	@override String get copy => 'Kopyahin';
	@override String get new_ => 'Bágo';
}

// Path: skedmaker.info
class _StringsSkedmakerInfoTl extends _StringsSkedmakerInfoEn {
	_StringsSkedmakerInfoTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'SkedMaker';
	@override String get nameFull => '${_root.general.app.name} ${_root.skedmaker.info.name}';
	@override String get desc => 'Ang awtomatikong paggawa ng iskedyul sa klase ng mga estudyante ng DLSU';
}

// Path: skedmaker.drawer
class _StringsSkedmakerDrawerTl extends _StringsSkedmakerDrawerEn {
	_StringsSkedmakerDrawerTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerDrawerFileLocationTl fileLocation = _StringsSkedmakerDrawerFileLocationTl._(_root);
}

// Path: skedmaker.subjects
class _StringsSkedmakerSubjectsTl extends _StringsSkedmakerSubjectsEn {
	_StringsSkedmakerSubjectsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Asignatura';
	@override late final _StringsSkedmakerSubjectsAddTl add = _StringsSkedmakerSubjectsAddTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTl subject = _StringsSkedmakerSubjectsSubjectTl._(_root);
	@override late final _StringsSkedmakerSubjectsEmptyTl empty = _StringsSkedmakerSubjectsEmptyTl._(_root);
}

// Path: skedmaker.filters
class _StringsSkedmakerFiltersTl extends _StringsSkedmakerFiltersEn {
	_StringsSkedmakerFiltersTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Panalà';
	@override late final _StringsSkedmakerFiltersCategoriesTl categories = _StringsSkedmakerFiltersCategoriesTl._(_root);
	@override String get any => 'Kahit anong asignatura';
	@override String get reset => 'Baguhin lahat muli';
}

// Path: skedmaker.schedules
class _StringsSkedmakerSchedulesTl extends _StringsSkedmakerSchedulesEn {
	_StringsSkedmakerSchedulesTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Palátuntunan';
	@override late final _StringsSkedmakerSchedulesGenerateTl generate = _StringsSkedmakerSchedulesGenerateTl._(_root);
	@override late final _StringsSkedmakerSchedulesCommandbarTl commandbar = _StringsSkedmakerSchedulesCommandbarTl._(_root);
	@override late final _StringsSkedmakerSchedulesDetailsTl details = _StringsSkedmakerSchedulesDetailsTl._(_root);
	@override late final _StringsSkedmakerSchedulesInfoTl info = _StringsSkedmakerSchedulesInfoTl._(_root);
	@override late final _StringsSkedmakerSchedulesOptionsTl options = _StringsSkedmakerSchedulesOptionsTl._(_root);
}

// Path: skedmaker.scheduleDay
class _StringsSkedmakerScheduleDayTl extends _StringsSkedmakerScheduleDayEn {
	_StringsSkedmakerScheduleDayTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerScheduleDayMondayFaceTl mondayFace = _StringsSkedmakerScheduleDayMondayFaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayMondayOnlineTl mondayOnline = _StringsSkedmakerScheduleDayMondayOnlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayMondayHybridTl mondayHybrid = _StringsSkedmakerScheduleDayMondayHybridTl._(_root);
	@override late final _StringsSkedmakerScheduleDayMondayUnknownTl mondayUnknown = _StringsSkedmakerScheduleDayMondayUnknownTl._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayFaceTl tuesdayFace = _StringsSkedmakerScheduleDayTuesdayFaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayOnlineTl tuesdayOnline = _StringsSkedmakerScheduleDayTuesdayOnlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayHybridTl tuesdayHybrid = _StringsSkedmakerScheduleDayTuesdayHybridTl._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayUnknownTl tuesdayUnknown = _StringsSkedmakerScheduleDayTuesdayUnknownTl._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdayFaceTl wednesdayFace = _StringsSkedmakerScheduleDayWednesdayFaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdayOnlineTl wednesdayOnline = _StringsSkedmakerScheduleDayWednesdayOnlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdayHybridTl wednesdayHybrid = _StringsSkedmakerScheduleDayWednesdayHybridTl._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdayUnknownTl wednesdayUnknown = _StringsSkedmakerScheduleDayWednesdayUnknownTl._(_root);
	@override late final _StringsSkedmakerScheduleDayThursdayFaceTl thursdayFace = _StringsSkedmakerScheduleDayThursdayFaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayThursdayOnlineTl thursdayOnline = _StringsSkedmakerScheduleDayThursdayOnlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayThursdayHybridTl thursdayHybrid = _StringsSkedmakerScheduleDayThursdayHybridTl._(_root);
	@override late final _StringsSkedmakerScheduleDayThursdayUnknownTl thursdayUnknown = _StringsSkedmakerScheduleDayThursdayUnknownTl._(_root);
	@override late final _StringsSkedmakerScheduleDayFridayFaceTl fridayFace = _StringsSkedmakerScheduleDayFridayFaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayFridayOnlineTl fridayOnline = _StringsSkedmakerScheduleDayFridayOnlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayFridayHybridTl fridayHybrid = _StringsSkedmakerScheduleDayFridayHybridTl._(_root);
	@override late final _StringsSkedmakerScheduleDayFridayUnknownTl fridayUnknown = _StringsSkedmakerScheduleDayFridayUnknownTl._(_root);
	@override late final _StringsSkedmakerScheduleDaySaturdayFaceTl saturdayFace = _StringsSkedmakerScheduleDaySaturdayFaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDaySaturdayOnlineTl saturdayOnline = _StringsSkedmakerScheduleDaySaturdayOnlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDaySaturdayHybridTl saturdayHybrid = _StringsSkedmakerScheduleDaySaturdayHybridTl._(_root);
	@override late final _StringsSkedmakerScheduleDaySaturdayUnknownTl saturdayUnknown = _StringsSkedmakerScheduleDaySaturdayUnknownTl._(_root);
	@override late final _StringsSkedmakerScheduleDayMondaythursdayFaceTl mondaythursdayFace = _StringsSkedmakerScheduleDayMondaythursdayFaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayMondaythursdayOnlineTl mondaythursdayOnline = _StringsSkedmakerScheduleDayMondaythursdayOnlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceTl mondaythursdayOnlineface = _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayMondaythursdayFaceonlineTl mondaythursdayFaceonline = _StringsSkedmakerScheduleDayMondaythursdayFaceonlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayMondaythursdayUnknownTl mondaythursdayUnknown = _StringsSkedmakerScheduleDayMondaythursdayUnknownTl._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayfridayFaceTl tuesdayfridayFace = _StringsSkedmakerScheduleDayTuesdayfridayFaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayfridayOnlineTl tuesdayfridayOnline = _StringsSkedmakerScheduleDayTuesdayfridayOnlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceTl tuesdayfridayOnlineface = _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineTl tuesdayfridayFaceonline = _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayfridayUnknownTl tuesdayfridayUnknown = _StringsSkedmakerScheduleDayTuesdayfridayUnknownTl._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdaysaturdayFaceTl wednesdaysaturdayFace = _StringsSkedmakerScheduleDayWednesdaysaturdayFaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineTl wednesdaysaturdayOnline = _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTl wednesdaysaturdayOnlineface = _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTl._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTl wednesdaysaturdayFaceonline = _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTl._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownTl wednesdaysaturdayUnknown = _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownTl._(_root);
	@override late final _StringsSkedmakerScheduleDayUnknownTl unknown = _StringsSkedmakerScheduleDayUnknownTl._(_root);
}

// Path: skedmaker.scheduleRoom
class _StringsSkedmakerScheduleRoomTl extends _StringsSkedmakerScheduleRoomEn {
	_StringsSkedmakerScheduleRoomTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Walang silid';
	@override String get online => 'Online';
	@override String hybrid({required Object room}) => '${room} at online';
}

// Path: skedmaker.scheduleDefault
class _StringsSkedmakerScheduleDefaultTl extends _StringsSkedmakerScheduleDefaultEn {
	_StringsSkedmakerScheduleDefaultTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String name({required Object n}) => 'Palátuntunan ${n}';
}

// Path: skedmaker.infobar
class _StringsSkedmakerInfobarTl extends _StringsSkedmakerInfobarEn {
	_StringsSkedmakerInfobarTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get currentlyGeneratingSchedules => 'Kasalukuyang bumubuo ng mga palátuntunan. Walang epekto ang mga pagbabago rito hangga\'t bumuo ka muli.';
}

// Path: general.home.more
class _StringsGeneralHomeMoreTl extends _StringsGeneralHomeMoreEn {
	_StringsGeneralHomeMoreTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Marami pang dadating!';
	@override String get desc => 'Abangan! :)';
}

// Path: general.drawer.about
class _StringsGeneralDrawerAboutTl extends _StringsGeneralDrawerAboutEn {
	_StringsGeneralDrawerAboutTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Patungkol';
	@override String version({required Object version, required Object build}) => 'Bersyon ${version} build ${build}';
	@override String get copyright => 'Karapatang-sipi (C) 2024 Yivan Andrei Padsoyan';
}

// Path: general.drawer.support
class _StringsGeneralDrawerSupportTl extends _StringsGeneralDrawerSupportEn {
	_StringsGeneralDrawerSupportTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buy Me A Coffee';
	@override String get desc => 'Suportahan ako!';
}

// Path: general.drawer.github
class _StringsGeneralDrawerGithubTl extends _StringsGeneralDrawerGithubEn {
	_StringsGeneralDrawerGithubTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tignan ang source code';
	@override String get desc => 'Mag-ambag sa AralTools!';
}

// Path: general.drawer.bugs
class _StringsGeneralDrawerBugsTl extends _StringsGeneralDrawerBugsEn {
	_StringsGeneralDrawerBugsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Subaybayánan ng isyu';
	@override String get desc => 'Umulat ng mga isyu dito!';
}

// Path: general.drawer.language
class _StringsGeneralDrawerLanguageTl extends _StringsGeneralDrawerLanguageEn {
	_StringsGeneralDrawerLanguageTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String title({required Object language}) => 'Wika: ${language}';
	@override String get tooltip => 'Palitan ang wika';
}

// Path: general.functions.backToHome
class _StringsGeneralFunctionsBackToHomeTl extends _StringsGeneralFunctionsBackToHomeEn {
	_StringsGeneralFunctionsBackToHomeTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Bumalik sa tahanan';
	@override String get title => 'Bumalik sa tahanan?';
	@override String get desc => 'Lahat ng \'di naimpok na data ay mawawala.';
}

// Path: general.functions.newProject
class _StringsGeneralFunctionsNewProjectTl extends _StringsGeneralFunctionsNewProjectEn {
	_StringsGeneralFunctionsNewProjectTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gumawa ng bagong proyekto?';
	@override String get desc => 'Lahat ng \'di naimpok na data ay mawawala.';
}

// Path: general.general.open
class _StringsGeneralGeneralOpenTl extends _StringsGeneralGeneralOpenEn {
	_StringsGeneralGeneralOpenTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get regular => 'Buksan';
	@override String get ellipsis => 'Buksan...';
}

// Path: general.general.saveAs
class _StringsGeneralGeneralSaveAsTl extends _StringsGeneralGeneralSaveAsEn {
	_StringsGeneralGeneralSaveAsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get regular => 'Impukin bilang';
	@override String get ellipsis => 'Impukin bilang...';
}

// Path: skedmaker.drawer.fileLocation
class _StringsSkedmakerDrawerFileLocationTl extends _StringsSkedmakerDrawerFileLocationEn {
	_StringsSkedmakerDrawerFileLocationTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lokasyon ng talaksán';
	@override String get empty => '-';
	@override String get open => 'Buksan ang lokasyon ng talaksán';
}

// Path: skedmaker.subjects.add
class _StringsSkedmakerSubjectsAddTl extends _StringsSkedmakerSubjectsAddEn {
	_StringsSkedmakerSubjectsAddTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Magdagdag ng asignatura';
	@override late final _StringsSkedmakerSubjectsAddButtonMlsTl buttonMls = _StringsSkedmakerSubjectsAddButtonMlsTl._(_root);
	@override late final _StringsSkedmakerSubjectsAddButtonManualTl buttonManual = _StringsSkedmakerSubjectsAddButtonManualTl._(_root);
	@override late final _StringsSkedmakerSubjectsAddButtonCodeTl buttonCode = _StringsSkedmakerSubjectsAddButtonCodeTl._(_root);
}

// Path: skedmaker.subjects.subject
class _StringsSkedmakerSubjectsSubjectTl extends _StringsSkedmakerSubjectsSubjectEn {
	_StringsSkedmakerSubjectsSubjectTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String title({required Object subject, required Object offering, required Object available}) => '${subject} - ${offering} alok (${available} maaari)';
	@override late final _StringsSkedmakerSubjectsSubjectActionsTl actions = _StringsSkedmakerSubjectsSubjectActionsTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableTl table = _StringsSkedmakerSubjectsSubjectTableTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectInfobarTl infobar = _StringsSkedmakerSubjectsSubjectInfobarTl._(_root);
}

// Path: skedmaker.subjects.empty
class _StringsSkedmakerSubjectsEmptyTl extends _StringsSkedmakerSubjectsEmptyEn {
	_StringsSkedmakerSubjectsEmptyTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String title({required Object subject}) => 'Ang ${subject} ay walang alok';
}

// Path: skedmaker.filters.categories
class _StringsSkedmakerFiltersCategoriesTl extends _StringsSkedmakerFiltersCategoriesEn {
	_StringsSkedmakerFiltersCategoriesTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsTl offerings = _StringsSkedmakerFiltersCategoriesOfferingsTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayTl day = _StringsSkedmakerFiltersCategoriesDayTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesLocationTl location = _StringsSkedmakerFiltersCategoriesLocationTl._(_root);
}

// Path: skedmaker.schedules.generate
class _StringsSkedmakerSchedulesGenerateTl extends _StringsSkedmakerSchedulesGenerateEn {
	_StringsSkedmakerSchedulesGenerateTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

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
class _StringsSkedmakerSchedulesCommandbarTl extends _StringsSkedmakerSchedulesCommandbarEn {
	_StringsSkedmakerSchedulesCommandbarTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerSchedulesCommandbarRenameTl rename = _StringsSkedmakerSchedulesCommandbarRenameTl._(_root);
	@override late final _StringsSkedmakerSchedulesCommandbarDeleteTl delete = _StringsSkedmakerSchedulesCommandbarDeleteTl._(_root);
	@override late final _StringsSkedmakerSchedulesCommandbarStarTl star = _StringsSkedmakerSchedulesCommandbarStarTl._(_root);
	@override late final _StringsSkedmakerSchedulesCommandbarSaveImageTl saveImage = _StringsSkedmakerSchedulesCommandbarSaveImageTl._(_root);
}

// Path: skedmaker.schedules.details
class _StringsSkedmakerSchedulesDetailsTl extends _StringsSkedmakerSchedulesDetailsEn {
	_StringsSkedmakerSchedulesDetailsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mga detalye';
	@override String get notes => 'Talâ';
	@override String get subjects => 'Mga asignatura';
}

// Path: skedmaker.schedules.info
class _StringsSkedmakerSchedulesInfoTl extends _StringsSkedmakerSchedulesInfoEn {
	_StringsSkedmakerSchedulesInfoTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Impo';
	@override String get title => 'Impormasyon';
	@override String get desc => 'Pumili ng palátuntunan sa kaliwa.\nTignan at kumparahin ang mga palátuntunan gamit ang mga tab sa itaas.\n\nMga shortcut sa palapindutan:\nUp/Down arrow key - pumunta sa susunod/nakaraang palátuntunan\nCtrl + T - gumawa ng bagong tab\nCtrl + W o Ctrl + F4 - isara ang kasalukuyang tab\nCtrl + 1 hanggang 8 - pumunta sa una hanggang pang-walong tab\nCtrl + 9 - pumunta sa huling tab\n';
}

// Path: skedmaker.schedules.options
class _StringsSkedmakerSchedulesOptionsTl extends _StringsSkedmakerSchedulesOptionsEn {
	_StringsSkedmakerSchedulesOptionsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get hoverEffects => 'Paganahin ang epektong hover';
}

// Path: skedmaker.scheduleDay.mondayFace
class _StringsSkedmakerScheduleDayMondayFaceTl extends _StringsSkedmakerScheduleDayMondayFaceEn {
	_StringsSkedmakerScheduleDayMondayFaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes (face-to-face)';
	@override String get nameShort => 'Lun (f2f)';
}

// Path: skedmaker.scheduleDay.mondayOnline
class _StringsSkedmakerScheduleDayMondayOnlineTl extends _StringsSkedmakerScheduleDayMondayOnlineEn {
	_StringsSkedmakerScheduleDayMondayOnlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes (online)';
	@override String get nameShort => 'Lun (online)';
}

// Path: skedmaker.scheduleDay.mondayHybrid
class _StringsSkedmakerScheduleDayMondayHybridTl extends _StringsSkedmakerScheduleDayMondayHybridEn {
	_StringsSkedmakerScheduleDayMondayHybridTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes (hybrid)';
	@override String get nameShort => 'Lun (hybrid)';
}

// Path: skedmaker.scheduleDay.mondayUnknown
class _StringsSkedmakerScheduleDayMondayUnknownTl extends _StringsSkedmakerScheduleDayMondayUnknownEn {
	_StringsSkedmakerScheduleDayMondayUnknownTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes';
	@override String get nameShort => 'Lun';
}

// Path: skedmaker.scheduleDay.tuesdayFace
class _StringsSkedmakerScheduleDayTuesdayFaceTl extends _StringsSkedmakerScheduleDayTuesdayFaceEn {
	_StringsSkedmakerScheduleDayTuesdayFaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes (face-to-face)';
	@override String get nameShort => 'Mar (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayOnline
class _StringsSkedmakerScheduleDayTuesdayOnlineTl extends _StringsSkedmakerScheduleDayTuesdayOnlineEn {
	_StringsSkedmakerScheduleDayTuesdayOnlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes (online)';
	@override String get nameShort => 'Mar (online)';
}

// Path: skedmaker.scheduleDay.tuesdayHybrid
class _StringsSkedmakerScheduleDayTuesdayHybridTl extends _StringsSkedmakerScheduleDayTuesdayHybridEn {
	_StringsSkedmakerScheduleDayTuesdayHybridTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes (hybrid)';
	@override String get nameShort => 'Mar (hybrid)';
}

// Path: skedmaker.scheduleDay.tuesdayUnknown
class _StringsSkedmakerScheduleDayTuesdayUnknownTl extends _StringsSkedmakerScheduleDayTuesdayUnknownEn {
	_StringsSkedmakerScheduleDayTuesdayUnknownTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes';
	@override String get nameShort => 'Mar';
}

// Path: skedmaker.scheduleDay.wednesdayFace
class _StringsSkedmakerScheduleDayWednesdayFaceTl extends _StringsSkedmakerScheduleDayWednesdayFaceEn {
	_StringsSkedmakerScheduleDayWednesdayFaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules (face-to-face)';
	@override String get nameShort => 'Miy (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdayOnline
class _StringsSkedmakerScheduleDayWednesdayOnlineTl extends _StringsSkedmakerScheduleDayWednesdayOnlineEn {
	_StringsSkedmakerScheduleDayWednesdayOnlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules (online)';
	@override String get nameShort => 'Miy (online)';
}

// Path: skedmaker.scheduleDay.wednesdayHybrid
class _StringsSkedmakerScheduleDayWednesdayHybridTl extends _StringsSkedmakerScheduleDayWednesdayHybridEn {
	_StringsSkedmakerScheduleDayWednesdayHybridTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules (hybrid)';
	@override String get nameShort => 'Miy (hybrid)';
}

// Path: skedmaker.scheduleDay.wednesdayUnknown
class _StringsSkedmakerScheduleDayWednesdayUnknownTl extends _StringsSkedmakerScheduleDayWednesdayUnknownEn {
	_StringsSkedmakerScheduleDayWednesdayUnknownTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules';
	@override String get nameShort => 'Miy';
}

// Path: skedmaker.scheduleDay.thursdayFace
class _StringsSkedmakerScheduleDayThursdayFaceTl extends _StringsSkedmakerScheduleDayThursdayFaceEn {
	_StringsSkedmakerScheduleDayThursdayFaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Huwebes (face-to-face)';
	@override String get nameShort => 'Huw (f2f)';
}

// Path: skedmaker.scheduleDay.thursdayOnline
class _StringsSkedmakerScheduleDayThursdayOnlineTl extends _StringsSkedmakerScheduleDayThursdayOnlineEn {
	_StringsSkedmakerScheduleDayThursdayOnlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Huwebes (online)';
	@override String get nameShort => 'Huw (online)';
}

// Path: skedmaker.scheduleDay.thursdayHybrid
class _StringsSkedmakerScheduleDayThursdayHybridTl extends _StringsSkedmakerScheduleDayThursdayHybridEn {
	_StringsSkedmakerScheduleDayThursdayHybridTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Huwebes (hybrid)';
	@override String get nameShort => 'Huw (hybrid)';
}

// Path: skedmaker.scheduleDay.thursdayUnknown
class _StringsSkedmakerScheduleDayThursdayUnknownTl extends _StringsSkedmakerScheduleDayThursdayUnknownEn {
	_StringsSkedmakerScheduleDayThursdayUnknownTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Huwebes';
	@override String get nameShort => 'Huw';
}

// Path: skedmaker.scheduleDay.fridayFace
class _StringsSkedmakerScheduleDayFridayFaceTl extends _StringsSkedmakerScheduleDayFridayFaceEn {
	_StringsSkedmakerScheduleDayFridayFaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Biyernes (face-to-face)';
	@override String get nameShort => 'Biy (f2f)';
}

// Path: skedmaker.scheduleDay.fridayOnline
class _StringsSkedmakerScheduleDayFridayOnlineTl extends _StringsSkedmakerScheduleDayFridayOnlineEn {
	_StringsSkedmakerScheduleDayFridayOnlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Biyernes (online)';
	@override String get nameShort => 'Biy (online)';
}

// Path: skedmaker.scheduleDay.fridayHybrid
class _StringsSkedmakerScheduleDayFridayHybridTl extends _StringsSkedmakerScheduleDayFridayHybridEn {
	_StringsSkedmakerScheduleDayFridayHybridTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Biyernes (hybrid)';
	@override String get nameShort => 'Biy (hybrid)';
}

// Path: skedmaker.scheduleDay.fridayUnknown
class _StringsSkedmakerScheduleDayFridayUnknownTl extends _StringsSkedmakerScheduleDayFridayUnknownEn {
	_StringsSkedmakerScheduleDayFridayUnknownTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Biyernes';
	@override String get nameShort => 'Biy';
}

// Path: skedmaker.scheduleDay.saturdayFace
class _StringsSkedmakerScheduleDaySaturdayFaceTl extends _StringsSkedmakerScheduleDaySaturdayFaceEn {
	_StringsSkedmakerScheduleDaySaturdayFaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Sabado (face-to-face)';
	@override String get nameShort => 'Sab (f2f)';
}

// Path: skedmaker.scheduleDay.saturdayOnline
class _StringsSkedmakerScheduleDaySaturdayOnlineTl extends _StringsSkedmakerScheduleDaySaturdayOnlineEn {
	_StringsSkedmakerScheduleDaySaturdayOnlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Sabado (online)';
	@override String get nameShort => 'Sab (online)';
}

// Path: skedmaker.scheduleDay.saturdayHybrid
class _StringsSkedmakerScheduleDaySaturdayHybridTl extends _StringsSkedmakerScheduleDaySaturdayHybridEn {
	_StringsSkedmakerScheduleDaySaturdayHybridTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Sabado (hybrid)';
	@override String get nameShort => 'Sab (hybrid)';
}

// Path: skedmaker.scheduleDay.saturdayUnknown
class _StringsSkedmakerScheduleDaySaturdayUnknownTl extends _StringsSkedmakerScheduleDaySaturdayUnknownEn {
	_StringsSkedmakerScheduleDaySaturdayUnknownTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Sabado';
	@override String get nameShort => 'Sab';
}

// Path: skedmaker.scheduleDay.mondaythursdayFace
class _StringsSkedmakerScheduleDayMondaythursdayFaceTl extends _StringsSkedmakerScheduleDayMondaythursdayFaceEn {
	_StringsSkedmakerScheduleDayMondaythursdayFaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes at Huwebes (parehong face-to-face)';
	@override String get nameShort => 'Lun & Huw (parehong f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnline
class _StringsSkedmakerScheduleDayMondaythursdayOnlineTl extends _StringsSkedmakerScheduleDayMondaythursdayOnlineEn {
	_StringsSkedmakerScheduleDayMondaythursdayOnlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes at Huwebes  (parehong online)';
	@override String get nameShort => 'Lun & Huw (parehong online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnlineface
class _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceTl extends _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceEn {
	_StringsSkedmakerScheduleDayMondaythursdayOnlinefaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes (online) at Huwebes (face-to-face)';
	@override String get nameShort => 'Lun (online) & Huw (f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayFaceonline
class _StringsSkedmakerScheduleDayMondaythursdayFaceonlineTl extends _StringsSkedmakerScheduleDayMondaythursdayFaceonlineEn {
	_StringsSkedmakerScheduleDayMondaythursdayFaceonlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes (face-to-face) at Huwebes (online)';
	@override String get nameShort => 'Lun (f2f) & Huw (online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayUnknown
class _StringsSkedmakerScheduleDayMondaythursdayUnknownTl extends _StringsSkedmakerScheduleDayMondaythursdayUnknownEn {
	_StringsSkedmakerScheduleDayMondaythursdayUnknownTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lunes';
	@override String get nameShort => 'Lun & Huw';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFace
class _StringsSkedmakerScheduleDayTuesdayfridayFaceTl extends _StringsSkedmakerScheduleDayTuesdayfridayFaceEn {
	_StringsSkedmakerScheduleDayTuesdayfridayFaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes at Biyernes (parehong face-to-face)';
	@override String get nameShort => 'Mar & Biy (parehong f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnline
class _StringsSkedmakerScheduleDayTuesdayfridayOnlineTl extends _StringsSkedmakerScheduleDayTuesdayfridayOnlineEn {
	_StringsSkedmakerScheduleDayTuesdayfridayOnlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes at Biyernes (both online)';
	@override String get nameShort => 'Mar & Biy (both online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnlineface
class _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceTl extends _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn {
	_StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes (online) at Biyernes (face-to-face)';
	@override String get nameShort => 'Mar (online) & Biy (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFaceonline
class _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineTl extends _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineEn {
	_StringsSkedmakerScheduleDayTuesdayfridayFaceonlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes (face-to-face) at Biyernes (online)';
	@override String get nameShort => 'Mar (f2f) & Biy (online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayUnknown
class _StringsSkedmakerScheduleDayTuesdayfridayUnknownTl extends _StringsSkedmakerScheduleDayTuesdayfridayUnknownEn {
	_StringsSkedmakerScheduleDayTuesdayfridayUnknownTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Martes at Biyernes';
	@override String get nameShort => 'Mar & Biy';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFace
class _StringsSkedmakerScheduleDayWednesdaysaturdayFaceTl extends _StringsSkedmakerScheduleDayWednesdaysaturdayFaceEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayFaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules at Sabado (parehong face-to-face)';
	@override String get nameShort => 'Miy & Sab (parehong f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnline
class _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineTl extends _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayOnlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules at Sabado (both online)';
	@override String get nameShort => 'Miy & Sab (both online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnlineface
class _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTl extends _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules (online) at Sabado (face-to-face)';
	@override String get nameShort => 'Miy (online) & Sab (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFaceonline
class _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTl extends _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules (face-to-face) at Sabado (online)';
	@override String get nameShort => 'Miy (f2f) & Sab (online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayUnknown
class _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownTl extends _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayUnknownTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Miyerkules at Sabado';
	@override String get nameShort => 'Miy & Sab';
}

// Path: skedmaker.scheduleDay.unknown
class _StringsSkedmakerScheduleDayUnknownTl extends _StringsSkedmakerScheduleDayUnknownEn {
	_StringsSkedmakerScheduleDayUnknownTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Hindi alam';
	@override String get nameShort => '\'Di alam';
}

// Path: skedmaker.subjects.add.buttonMls
class _StringsSkedmakerSubjectsAddButtonMlsTl extends _StringsSkedmakerSubjectsAddButtonMlsEn {
	_StringsSkedmakerSubjectsAddButtonMlsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

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
class _StringsSkedmakerSubjectsAddButtonManualTl extends _StringsSkedmakerSubjectsAddButtonManualEn {
	_StringsSkedmakerSubjectsAddButtonManualTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Magdagdag nang manu-mano';
	@override String get title => 'Gumawa ng bagong asignatura';
	@override String get desc => 'Maglagay ng 7 karakter na code ng asignatura:';
}

// Path: skedmaker.subjects.add.buttonCode
class _StringsSkedmakerSubjectsAddButtonCodeTl extends _StringsSkedmakerSubjectsAddButtonCodeEn {
	_StringsSkedmakerSubjectsAddButtonCodeTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

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

// Path: skedmaker.subjects.subject.actions
class _StringsSkedmakerSubjectsSubjectActionsTl extends _StringsSkedmakerSubjectsSubjectActionsEn {
	_StringsSkedmakerSubjectsSubjectActionsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerSubjectsSubjectActionsRecolorTl recolor = _StringsSkedmakerSubjectsSubjectActionsRecolorTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectActionsDeleteTl delete = _StringsSkedmakerSubjectsSubjectActionsDeleteTl._(_root);
	@override String get showhide => 'Ipakita/Itago';
	@override String get offeringAdd => 'Magdagdag ng alok';
	@override late final _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteTl offeringDelete = _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteTl._(_root);
}

// Path: skedmaker.subjects.subject.table
class _StringsSkedmakerSubjectsSubjectTableTl extends _StringsSkedmakerSubjectsSubjectTableEn {
	_StringsSkedmakerSubjectsSubjectTableTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerSubjectsSubjectTableStatusTl status = _StringsSkedmakerSubjectsSubjectTableStatusTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableClassnoTl classno = _StringsSkedmakerSubjectsSubjectTableClassnoTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableSectionTl section = _StringsSkedmakerSubjectsSubjectTableSectionTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableRoomTl room = _StringsSkedmakerSubjectsSubjectTableRoomTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableDayTl day = _StringsSkedmakerSubjectsSubjectTableDayTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableTimeTl time = _StringsSkedmakerSubjectsSubjectTableTimeTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableTeacherTl teacher = _StringsSkedmakerSubjectsSubjectTableTeacherTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableSlotsTl slots = _StringsSkedmakerSubjectsSubjectTableSlotsTl._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableRemarksTl remarks = _StringsSkedmakerSubjectsSubjectTableRemarksTl._(_root);
}

// Path: skedmaker.subjects.subject.infobar
class _StringsSkedmakerSubjectsSubjectInfobarTl extends _StringsSkedmakerSubjectsSubjectInfobarEn {
	_StringsSkedmakerSubjectsSubjectInfobarTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String noAvailableOffering({required Object subject}) => 'Walang maaaring alok ang ${subject}.';
	@override String hidden({required Object subject}) => 'Nakatago ang ${subject}. Hindi ito maisasama kapag bumubuo ng palátuntunan.';
}

// Path: skedmaker.filters.categories.offerings
class _StringsSkedmakerFiltersCategoriesOfferingsTl extends _StringsSkedmakerFiltersCategoriesOfferingsEn {
	_StringsSkedmakerFiltersCategoriesOfferingsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Alok';
	@override String get desc => 'Ipanalà ang mga alok kung ano ang isasama';
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedTl includeClosed = _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTl includeFullSlots = _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTl includeUnknownModality = _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTl includeNoTeachers = _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTl excludeSectionLetter = _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTl includeFreshmanBlock = _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTl._(_root);
}

// Path: skedmaker.filters.categories.day
class _StringsSkedmakerFiltersCategoriesDayTl extends _StringsSkedmakerFiltersCategoriesDayEn {
	_StringsSkedmakerFiltersCategoriesDayTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tiyak na araw';
	@override String get desc => 'Mga panalà sa kada araw ng linggo';
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTl commonMaxNumberOfSubjects = _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalTl commonTimeInterval = _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonModalityTl commonModality = _StringsSkedmakerFiltersCategoriesDayCommonModalityTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTl commonStartWithSubject = _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTl commonEndWithSubject = _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeTl commonBreaktime = _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeTl._(_root);
	@override String get mondayName => 'Lunes';
	@override String get tuesdayName => 'Martes';
	@override String get wednesdayName => 'Miyerkules';
	@override String get thursdayName => 'Huwebes';
	@override String get fridayName => 'Biyernes';
	@override String get saturdayName => 'Sabado';
}

// Path: skedmaker.filters.categories.location
class _StringsSkedmakerFiltersCategoriesLocationTl extends _StringsSkedmakerFiltersCategoriesLocationEn {
	_StringsSkedmakerFiltersCategoriesLocationTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lokasyon (tílawin)';
	@override String get desc => 'Ipanalà ang mga alok base sa kanilang lokasyon';
	@override late final _StringsSkedmakerFiltersCategoriesLocationEnabledTl enabled = _StringsSkedmakerFiltersCategoriesLocationEnabledTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTl checkingDistanceMinutes = _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTl maxAllowedDistanceMeters = _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTl._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesLocationCalculatorTl calculator = _StringsSkedmakerFiltersCategoriesLocationCalculatorTl._(_root);
}

// Path: skedmaker.schedules.commandbar.rename
class _StringsSkedmakerSchedulesCommandbarRenameTl extends _StringsSkedmakerSchedulesCommandbarRenameEn {
	_StringsSkedmakerSchedulesCommandbarRenameTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pangalánin';
	@override String get edit => 'Maglagay ng bagong pangalan';
}

// Path: skedmaker.schedules.commandbar.delete
class _StringsSkedmakerSchedulesCommandbarDeleteTl extends _StringsSkedmakerSchedulesCommandbarDeleteEn {
	_StringsSkedmakerSchedulesCommandbarDeleteTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Burahin';
	@override String desc({required Object name}) => 'Burahin ang ${name}?\nHindi mo ito maibabalik.\nMabubura rin ang lahat ng tab na may ganitong talàan.\n';
}

// Path: skedmaker.schedules.commandbar.star
class _StringsSkedmakerSchedulesCommandbarStarTl extends _StringsSkedmakerSchedulesCommandbarStarEn {
	_StringsSkedmakerSchedulesCommandbarStarTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get star => 'Ibituin';
	@override String get unstar => '\'Wag ibituin';
}

// Path: skedmaker.schedules.commandbar.saveImage
class _StringsSkedmakerSchedulesCommandbarSaveImageTl extends _StringsSkedmakerSchedulesCommandbarSaveImageEn {
	_StringsSkedmakerSchedulesCommandbarSaveImageTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

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
class _StringsSkedmakerSubjectsSubjectActionsRecolorTl extends _StringsSkedmakerSubjectsSubjectActionsRecolorEn {
	_StringsSkedmakerSubjectsSubjectActionsRecolorTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Kulayin';
	@override String get title => 'Pumili ng kulay';
	@override String get primary => 'Pangunahin';
	@override String get wheel => 'Gulong';
	@override String get shades => 'Shades';
}

// Path: skedmaker.subjects.subject.actions.delete
class _StringsSkedmakerSubjectsSubjectActionsDeleteTl extends _StringsSkedmakerSubjectsSubjectActionsDeleteEn {
	_StringsSkedmakerSubjectsSubjectActionsDeleteTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Burahin';
	@override String warning({required Object subject}) => 'Burahin ang ${subject}? \nHindi mo \'to maibabalik.';
}

// Path: skedmaker.subjects.subject.actions.offeringDelete
class _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteTl extends _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteEn {
	_StringsSkedmakerSubjectsSubjectActionsOfferingDeleteTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Magbura ng alok';
	@override String get warning => 'Burahin itong alok? \nHindi mo \'to maibabalik.';
}

// Path: skedmaker.subjects.subject.table.status
class _StringsSkedmakerSubjectsSubjectTableStatusTl extends _StringsSkedmakerSubjectsSubjectTableStatusEn {
	_StringsSkedmakerSubjectsSubjectTableStatusTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Kalagayan';
	@override String get open => 'Bukás';
	@override String get closed => 'Sarado';
}

// Path: skedmaker.subjects.subject.table.classno
class _StringsSkedmakerSubjectsSubjectTableClassnoTl extends _StringsSkedmakerSubjectsSubjectTableClassnoEn {
	_StringsSkedmakerSubjectsSubjectTableClassnoTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => '\# ng Klase';
	@override String get edit => 'Palitan ang bilang ng klase:';
}

// Path: skedmaker.subjects.subject.table.section
class _StringsSkedmakerSubjectsSubjectTableSectionTl extends _StringsSkedmakerSubjectsSubjectTableSectionEn {
	_StringsSkedmakerSubjectsSubjectTableSectionTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pangkat';
	@override String get edit => 'Palitan ang pangkat:';
}

// Path: skedmaker.subjects.subject.table.room
class _StringsSkedmakerSubjectsSubjectTableRoomTl extends _StringsSkedmakerSubjectsSubjectTableRoomEn {
	_StringsSkedmakerSubjectsSubjectTableRoomTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Silid';
	@override String get edit => 'Palitan ang silid (maaaring wala):';
}

// Path: skedmaker.subjects.subject.table.day
class _StringsSkedmakerSubjectsSubjectTableDayTl extends _StringsSkedmakerSubjectsSubjectTableDayEn {
	_StringsSkedmakerSubjectsSubjectTableDayTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Araw';
	@override String get edit => 'Palitan ang araw:';
}

// Path: skedmaker.subjects.subject.table.time
class _StringsSkedmakerSubjectsSubjectTableTimeTl extends _StringsSkedmakerSubjectsSubjectTableTimeEn {
	_StringsSkedmakerSubjectsSubjectTableTimeTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

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
class _StringsSkedmakerSubjectsSubjectTableTeacherTl extends _StringsSkedmakerSubjectsSubjectTableTeacherEn {
	_StringsSkedmakerSubjectsSubjectTableTeacherTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Guro';
	@override String get edit => 'Palitan ang guro (maaaring wala):';
}

// Path: skedmaker.subjects.subject.table.slots
class _StringsSkedmakerSubjectsSubjectTableSlotsTl extends _StringsSkedmakerSubjectsSubjectTableSlotsEn {
	_StringsSkedmakerSubjectsSubjectTableSlotsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Slot';
	@override String data({required Object taken, required Object capacity}) => '${taken} / ${capacity}';
	@override String percent({required Object percent}) => '${percent}%';
	@override String get edit => 'Palitan ang mga slot:';
	@override String get outOf => ' mula sa ';
}

// Path: skedmaker.subjects.subject.table.remarks
class _StringsSkedmakerSubjectsSubjectTableRemarksTl extends _StringsSkedmakerSubjectsSubjectTableRemarksEn {
	_StringsSkedmakerSubjectsSubjectTableRemarksTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Puna';
	@override String get edit => 'Palitan ang mga puna (maaaring wala):';
}

// Path: skedmaker.filters.categories.offerings.includeClosed
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedTl extends _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Isáma ang nakasarang alok';
	@override String get desc => 'Paganahin \'to para \'wag pansinin kung bukas o sarado';
}

// Path: skedmaker.filters.categories.offerings.includeFullSlots
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTl extends _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Isáma ang punóng alok';
	@override String get desc => 'Paganahin \'to para \'wag pansinin ang kapasidad';
}

// Path: skedmaker.filters.categories.offerings.includeUnknownModality
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTl extends _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Isáma ang mga alok na \'di alam ang modalidad';
}

// Path: skedmaker.filters.categories.offerings.includeNoTeachers
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTl extends _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Isáma ang mga alok na walang guro';
}

// Path: skedmaker.filters.categories.offerings.excludeSectionLetter
class _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTl extends _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn {
	_StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Ibukod ang mga pangkat na naglalaman ng mga ito';
	@override String get desc => 'Gamitin \'to para ibukod ang mga alok na ang pangkat ay naglalaman ng (mga) titik';
}

// Path: skedmaker.filters.categories.offerings.includeFreshmanBlock
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTl extends _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Isáma ang block ng mga presman';
}

// Path: skedmaker.filters.categories.day.commonMaxNumberOfSubjects
class _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTl extends _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn {
	_StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pinakamaraming bilang ng asignatura';
	@override String get desc => 'Ilagay ang -1 \'pag walang hanggan; ilagay ang 0 \'pag wala talaga';
}

// Path: skedmaker.filters.categories.day.commonTimeInterval
class _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalTl extends _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn {
	_StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Dapat sa gantong oras lang may asignatura';
}

// Path: skedmaker.filters.categories.day.commonModality
class _StringsSkedmakerFiltersCategoriesDayCommonModalityTl extends _StringsSkedmakerFiltersCategoriesDayCommonModalityEn {
	_StringsSkedmakerFiltersCategoriesDayCommonModalityTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Modalidad ng mga asignatura';
	@override String get hybrid => 'Online o harap-harapan';
	@override String get online => 'Online';
	@override String get face => 'Harap-harapan';
	@override String get any => 'Kahit anong modalidad';
	@override String get unknown => '\'Di alam ang modalidad';
}

// Path: skedmaker.filters.categories.day.commonStartWithSubject
class _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTl extends _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn {
	_StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Unang asignatura ng araw';
}

// Path: skedmaker.filters.categories.day.commonEndWithSubject
class _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTl extends _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn {
	_StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Huling asignatura ng araw';
}

// Path: skedmaker.filters.categories.day.commonBreaktime
class _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeTl extends _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeEn {
	_StringsSkedmakerFiltersCategoriesDayCommonBreaktimeTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Oras-pahinga';
	@override String get desc => 'Oras na dapat walang asignatura';
}

// Path: skedmaker.filters.categories.location.enabled
class _StringsSkedmakerFiltersCategoriesLocationEnabledTl extends _StringsSkedmakerFiltersCategoriesLocationEnabledEn {
	_StringsSkedmakerFiltersCategoriesLocationEnabledTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Paganahin ang pagpapanalà gamit ang lokasyon at layo';
	@override String get desc => 'Kinokonsidera nito ang layo ng: Nakaraang klase → ang unang palapag → \nang unang palapag ng susunod na klase → ang susunod na klase. Kapag parehas sila ng\ngusali, ito lamang ang layo mula sa nakaraan hanggang sa susunod.';
}

// Path: skedmaker.filters.categories.location.checkingDistanceMinutes
class _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTl extends _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn {
	_StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pagitan ng mga asignatura upang tignan ang layo (minuto)';
}

// Path: skedmaker.filters.categories.location.maxAllowedDistanceMeters
class _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTl extends _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn {
	_StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pinakamataas na layo mula sa isang asignatura patungo sa susunod (metro)';
}

// Path: skedmaker.filters.categories.location.calculator
class _StringsSkedmakerFiltersCategoriesLocationCalculatorTl extends _StringsSkedmakerFiltersCategoriesLocationCalculatorEn {
	_StringsSkedmakerFiltersCategoriesLocationCalculatorTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

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

// Path: <root>
class _StringsTlQp extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTlQp.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.tlQp,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tl-QP>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _StringsTlQp _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralTlQp general = _StringsGeneralTlQp._(_root);
	@override late final _StringsSkedmakerTlQp skedmaker = _StringsSkedmakerTlQp._(_root);
}

// Path: general
class _StringsGeneralTlQp extends _StringsGeneralEn {
	_StringsGeneralTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralAppTlQp app = _StringsGeneralAppTlQp._(_root);
	@override late final _StringsGeneralHomeTlQp home = _StringsGeneralHomeTlQp._(_root);
	@override late final _StringsGeneralDrawerTlQp drawer = _StringsGeneralDrawerTlQp._(_root);
	@override late final _StringsGeneralFunctionsTlQp functions = _StringsGeneralFunctionsTlQp._(_root);
	@override late final _StringsGeneralGeneralTlQp general = _StringsGeneralGeneralTlQp._(_root);
}

// Path: skedmaker
class _StringsSkedmakerTlQp extends _StringsSkedmakerEn {
	_StringsSkedmakerTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerInfoTlQp info = _StringsSkedmakerInfoTlQp._(_root);
	@override late final _StringsSkedmakerDrawerTlQp drawer = _StringsSkedmakerDrawerTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsTlQp subjects = _StringsSkedmakerSubjectsTlQp._(_root);
	@override late final _StringsSkedmakerFiltersTlQp filters = _StringsSkedmakerFiltersTlQp._(_root);
	@override late final _StringsSkedmakerSchedulesTlQp schedules = _StringsSkedmakerSchedulesTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayTlQp scheduleDay = _StringsSkedmakerScheduleDayTlQp._(_root);
	@override late final _StringsSkedmakerScheduleRoomTlQp scheduleRoom = _StringsSkedmakerScheduleRoomTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDefaultTlQp scheduleDefault = _StringsSkedmakerScheduleDefaultTlQp._(_root);
	@override String get mlsCourseOfferings => 'My.LaSalle\'s Course Offerings';
	@override late final _StringsSkedmakerInfobarTlQp infobar = _StringsSkedmakerInfobarTlQp._(_root);
}

// Path: general.app
class _StringsGeneralAppTlQp extends _StringsGeneralAppEn {
	_StringsGeneralAppTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'AralTools';
}

// Path: general.home
class _StringsGeneralHomeTlQp extends _StringsGeneralHomeEn {
	_StringsGeneralHomeTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Home';
	@override String get welcome => 'Welcome!';
	@override late final _StringsGeneralHomeMoreTlQp more = _StringsGeneralHomeMoreTlQp._(_root);
}

// Path: general.drawer
class _StringsGeneralDrawerTlQp extends _StringsGeneralDrawerEn {
	_StringsGeneralDrawerTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralDrawerAboutTlQp about = _StringsGeneralDrawerAboutTlQp._(_root);
	@override late final _StringsGeneralDrawerSupportTlQp support = _StringsGeneralDrawerSupportTlQp._(_root);
	@override late final _StringsGeneralDrawerGithubTlQp github = _StringsGeneralDrawerGithubTlQp._(_root);
	@override late final _StringsGeneralDrawerBugsTlQp bugs = _StringsGeneralDrawerBugsTlQp._(_root);
	@override late final _StringsGeneralDrawerLanguageTlQp language = _StringsGeneralDrawerLanguageTlQp._(_root);
}

// Path: general.functions
class _StringsGeneralFunctionsTlQp extends _StringsGeneralFunctionsEn {
	_StringsGeneralFunctionsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralFunctionsBackToHomeTlQp backToHome = _StringsGeneralFunctionsBackToHomeTlQp._(_root);
	@override late final _StringsGeneralFunctionsNewProjectTlQp newProject = _StringsGeneralFunctionsNewProjectTlQp._(_root);
}

// Path: general.general
class _StringsGeneralGeneralTlQp extends _StringsGeneralGeneralEn {
	_StringsGeneralGeneralTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get go => 'Go';
	@override String get ok => 'OK';
	@override late final _StringsGeneralGeneralOpenTlQp open = _StringsGeneralGeneralOpenTlQp._(_root);
	@override String get delete => 'I-delete';
	@override String get add => 'I-add';
	@override String get select => 'I-select';
	@override String get save => 'I-save';
	@override String get saveDont => '\'Wag i-save';
	@override late final _StringsGeneralGeneralSaveAsTlQp saveAs = _StringsGeneralGeneralSaveAsTlQp._(_root);
	@override String get cancel => 'I-cancel';
	@override String get resume => 'I-resume';
	@override String get pause => 'I-pause';
	@override String get stop => 'I-stop';
	@override String get close => 'I-close';
	@override String get rename => 'I-rename';
	@override String get copy => 'I-copy';
	@override String get new_ => 'New';
}

// Path: skedmaker.info
class _StringsSkedmakerInfoTlQp extends _StringsSkedmakerInfoEn {
	_StringsSkedmakerInfoTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'SkedMaker';
	@override String get nameFull => '${_root.general.app.name} ${_root.skedmaker.info.name}';
	@override String get desc => 'Ang automatic na class schedule maker para sa DLSU students';
}

// Path: skedmaker.drawer
class _StringsSkedmakerDrawerTlQp extends _StringsSkedmakerDrawerEn {
	_StringsSkedmakerDrawerTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerDrawerFileLocationTlQp fileLocation = _StringsSkedmakerDrawerFileLocationTlQp._(_root);
}

// Path: skedmaker.subjects
class _StringsSkedmakerSubjectsTlQp extends _StringsSkedmakerSubjectsEn {
	_StringsSkedmakerSubjectsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Subjects';
	@override late final _StringsSkedmakerSubjectsAddTlQp add = _StringsSkedmakerSubjectsAddTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTlQp subject = _StringsSkedmakerSubjectsSubjectTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsEmptyTlQp empty = _StringsSkedmakerSubjectsEmptyTlQp._(_root);
}

// Path: skedmaker.filters
class _StringsSkedmakerFiltersTlQp extends _StringsSkedmakerFiltersEn {
	_StringsSkedmakerFiltersTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Filters';
	@override late final _StringsSkedmakerFiltersCategoriesTlQp categories = _StringsSkedmakerFiltersCategoriesTlQp._(_root);
	@override String get any => 'Any na subject';
	@override String get reset => 'I-reset lahat';
}

// Path: skedmaker.schedules
class _StringsSkedmakerSchedulesTlQp extends _StringsSkedmakerSchedulesEn {
	_StringsSkedmakerSchedulesTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Schedules';
	@override late final _StringsSkedmakerSchedulesGenerateTlQp generate = _StringsSkedmakerSchedulesGenerateTlQp._(_root);
	@override late final _StringsSkedmakerSchedulesCommandbarTlQp commandbar = _StringsSkedmakerSchedulesCommandbarTlQp._(_root);
	@override late final _StringsSkedmakerSchedulesDetailsTlQp details = _StringsSkedmakerSchedulesDetailsTlQp._(_root);
	@override late final _StringsSkedmakerSchedulesInfoTlQp info = _StringsSkedmakerSchedulesInfoTlQp._(_root);
	@override late final _StringsSkedmakerSchedulesOptionsTlQp options = _StringsSkedmakerSchedulesOptionsTlQp._(_root);
}

// Path: skedmaker.scheduleDay
class _StringsSkedmakerScheduleDayTlQp extends _StringsSkedmakerScheduleDayEn {
	_StringsSkedmakerScheduleDayTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerScheduleDayMondayFaceTlQp mondayFace = _StringsSkedmakerScheduleDayMondayFaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayMondayOnlineTlQp mondayOnline = _StringsSkedmakerScheduleDayMondayOnlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayMondayHybridTlQp mondayHybrid = _StringsSkedmakerScheduleDayMondayHybridTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayMondayUnknownTlQp mondayUnknown = _StringsSkedmakerScheduleDayMondayUnknownTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayFaceTlQp tuesdayFace = _StringsSkedmakerScheduleDayTuesdayFaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayOnlineTlQp tuesdayOnline = _StringsSkedmakerScheduleDayTuesdayOnlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayHybridTlQp tuesdayHybrid = _StringsSkedmakerScheduleDayTuesdayHybridTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayUnknownTlQp tuesdayUnknown = _StringsSkedmakerScheduleDayTuesdayUnknownTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdayFaceTlQp wednesdayFace = _StringsSkedmakerScheduleDayWednesdayFaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdayOnlineTlQp wednesdayOnline = _StringsSkedmakerScheduleDayWednesdayOnlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdayHybridTlQp wednesdayHybrid = _StringsSkedmakerScheduleDayWednesdayHybridTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdayUnknownTlQp wednesdayUnknown = _StringsSkedmakerScheduleDayWednesdayUnknownTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayThursdayFaceTlQp thursdayFace = _StringsSkedmakerScheduleDayThursdayFaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayThursdayOnlineTlQp thursdayOnline = _StringsSkedmakerScheduleDayThursdayOnlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayThursdayHybridTlQp thursdayHybrid = _StringsSkedmakerScheduleDayThursdayHybridTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayThursdayUnknownTlQp thursdayUnknown = _StringsSkedmakerScheduleDayThursdayUnknownTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayFridayFaceTlQp fridayFace = _StringsSkedmakerScheduleDayFridayFaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayFridayOnlineTlQp fridayOnline = _StringsSkedmakerScheduleDayFridayOnlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayFridayHybridTlQp fridayHybrid = _StringsSkedmakerScheduleDayFridayHybridTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayFridayUnknownTlQp fridayUnknown = _StringsSkedmakerScheduleDayFridayUnknownTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDaySaturdayFaceTlQp saturdayFace = _StringsSkedmakerScheduleDaySaturdayFaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDaySaturdayOnlineTlQp saturdayOnline = _StringsSkedmakerScheduleDaySaturdayOnlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDaySaturdayHybridTlQp saturdayHybrid = _StringsSkedmakerScheduleDaySaturdayHybridTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDaySaturdayUnknownTlQp saturdayUnknown = _StringsSkedmakerScheduleDaySaturdayUnknownTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayMondaythursdayFaceTlQp mondaythursdayFace = _StringsSkedmakerScheduleDayMondaythursdayFaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayMondaythursdayOnlineTlQp mondaythursdayOnline = _StringsSkedmakerScheduleDayMondaythursdayOnlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceTlQp mondaythursdayOnlineface = _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayMondaythursdayFaceonlineTlQp mondaythursdayFaceonline = _StringsSkedmakerScheduleDayMondaythursdayFaceonlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayMondaythursdayUnknownTlQp mondaythursdayUnknown = _StringsSkedmakerScheduleDayMondaythursdayUnknownTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayfridayFaceTlQp tuesdayfridayFace = _StringsSkedmakerScheduleDayTuesdayfridayFaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayfridayOnlineTlQp tuesdayfridayOnline = _StringsSkedmakerScheduleDayTuesdayfridayOnlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceTlQp tuesdayfridayOnlineface = _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineTlQp tuesdayfridayFaceonline = _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayTuesdayfridayUnknownTlQp tuesdayfridayUnknown = _StringsSkedmakerScheduleDayTuesdayfridayUnknownTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdaysaturdayFaceTlQp wednesdaysaturdayFace = _StringsSkedmakerScheduleDayWednesdaysaturdayFaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineTlQp wednesdaysaturdayOnline = _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTlQp wednesdaysaturdayOnlineface = _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTlQp wednesdaysaturdayFaceonline = _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownTlQp wednesdaysaturdayUnknown = _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownTlQp._(_root);
	@override late final _StringsSkedmakerScheduleDayUnknownTlQp unknown = _StringsSkedmakerScheduleDayUnknownTlQp._(_root);
}

// Path: skedmaker.scheduleRoom
class _StringsSkedmakerScheduleRoomTlQp extends _StringsSkedmakerScheduleRoomEn {
	_StringsSkedmakerScheduleRoomTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Walang room';
	@override String get online => 'Online';
	@override String hybrid({required Object room}) => '${room} at online';
}

// Path: skedmaker.scheduleDefault
class _StringsSkedmakerScheduleDefaultTlQp extends _StringsSkedmakerScheduleDefaultEn {
	_StringsSkedmakerScheduleDefaultTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String name({required Object n}) => 'Schedule ${n}';
}

// Path: skedmaker.infobar
class _StringsSkedmakerInfobarTlQp extends _StringsSkedmakerInfobarEn {
	_StringsSkedmakerInfobarTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get currentlyGeneratingSchedules => 'Naggegenerate ng schedules ngayon. Hindi mag-aapply ang mga changes dito hanggang sa mag-generate ka ulit.';
}

// Path: general.home.more
class _StringsGeneralHomeMoreTlQp extends _StringsGeneralHomeMoreEn {
	_StringsGeneralHomeMoreTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'More pa coming soon!';
	@override String get desc => 'Maging updated! :)';
}

// Path: general.drawer.about
class _StringsGeneralDrawerAboutTlQp extends _StringsGeneralDrawerAboutEn {
	_StringsGeneralDrawerAboutTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'About';
	@override String version({required Object version, required Object build}) => 'Version ${version} build ${build}';
	@override String get copyright => 'Copyright (C) 2024 Yivan Andrei Padsoyan';
}

// Path: general.drawer.support
class _StringsGeneralDrawerSupportTlQp extends _StringsGeneralDrawerSupportEn {
	_StringsGeneralDrawerSupportTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buy Me A Coffee';
	@override String get desc => 'I-support ako!';
}

// Path: general.drawer.github
class _StringsGeneralDrawerGithubTlQp extends _StringsGeneralDrawerGithubEn {
	_StringsGeneralDrawerGithubTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tignan ang source code';
	@override String get desc => 'Mag-contribute sa AralTools!';
}

// Path: general.drawer.bugs
class _StringsGeneralDrawerBugsTlQp extends _StringsGeneralDrawerBugsEn {
	_StringsGeneralDrawerBugsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Issue tracker';
	@override String get desc => 'Mag-report ng mga issue at bug dito!';
}

// Path: general.drawer.language
class _StringsGeneralDrawerLanguageTlQp extends _StringsGeneralDrawerLanguageEn {
	_StringsGeneralDrawerLanguageTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String title({required Object language}) => 'Language: ${language}';
	@override String get tooltip => 'Palitan ang language';
}

// Path: general.functions.backToHome
class _StringsGeneralFunctionsBackToHomeTlQp extends _StringsGeneralFunctionsBackToHomeEn {
	_StringsGeneralFunctionsBackToHomeTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Bumalik sa home';
	@override String get title => 'Bumalik sa home?';
	@override String get desc => 'Lahat ng unsaved data ay mawawala.';
}

// Path: general.functions.newProject
class _StringsGeneralFunctionsNewProjectTlQp extends _StringsGeneralFunctionsNewProjectEn {
	_StringsGeneralFunctionsNewProjectTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gumawa ng bagong project?';
	@override String get desc => 'Lahat ng unsaved data ay mawawala.';
}

// Path: general.general.open
class _StringsGeneralGeneralOpenTlQp extends _StringsGeneralGeneralOpenEn {
	_StringsGeneralGeneralOpenTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get regular => 'I-open';
	@override String get ellipsis => 'I-open...';
}

// Path: general.general.saveAs
class _StringsGeneralGeneralSaveAsTlQp extends _StringsGeneralGeneralSaveAsEn {
	_StringsGeneralGeneralSaveAsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get regular => 'I-save as';
	@override String get ellipsis => 'I-save as...';
}

// Path: skedmaker.drawer.fileLocation
class _StringsSkedmakerDrawerFileLocationTlQp extends _StringsSkedmakerDrawerFileLocationEn {
	_StringsSkedmakerDrawerFileLocationTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'File location';
	@override String get empty => '-';
	@override String get open => 'I-open ang file location';
}

// Path: skedmaker.subjects.add
class _StringsSkedmakerSubjectsAddTlQp extends _StringsSkedmakerSubjectsAddEn {
	_StringsSkedmakerSubjectsAddTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mag-add ng subject';
	@override late final _StringsSkedmakerSubjectsAddButtonMlsTlQp buttonMls = _StringsSkedmakerSubjectsAddButtonMlsTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsAddButtonManualTlQp buttonManual = _StringsSkedmakerSubjectsAddButtonManualTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsAddButtonCodeTlQp buttonCode = _StringsSkedmakerSubjectsAddButtonCodeTlQp._(_root);
}

// Path: skedmaker.subjects.subject
class _StringsSkedmakerSubjectsSubjectTlQp extends _StringsSkedmakerSubjectsSubjectEn {
	_StringsSkedmakerSubjectsSubjectTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String title({required Object subject, required Object offering, required Object available}) => '${subject} - ${offering} offerings (${available} available)';
	@override late final _StringsSkedmakerSubjectsSubjectActionsTlQp actions = _StringsSkedmakerSubjectsSubjectActionsTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableTlQp table = _StringsSkedmakerSubjectsSubjectTableTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectInfobarTlQp infobar = _StringsSkedmakerSubjectsSubjectInfobarTlQp._(_root);
}

// Path: skedmaker.subjects.empty
class _StringsSkedmakerSubjectsEmptyTlQp extends _StringsSkedmakerSubjectsEmptyEn {
	_StringsSkedmakerSubjectsEmptyTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String title({required Object subject}) => '${subject} ay walang offerings';
}

// Path: skedmaker.filters.categories
class _StringsSkedmakerFiltersCategoriesTlQp extends _StringsSkedmakerFiltersCategoriesEn {
	_StringsSkedmakerFiltersCategoriesTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsTlQp offerings = _StringsSkedmakerFiltersCategoriesOfferingsTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayTlQp day = _StringsSkedmakerFiltersCategoriesDayTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesLocationTlQp location = _StringsSkedmakerFiltersCategoriesLocationTlQp._(_root);
}

// Path: skedmaker.schedules.generate
class _StringsSkedmakerSchedulesGenerateTlQp extends _StringsSkedmakerSchedulesGenerateEn {
	_StringsSkedmakerSchedulesGenerateTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

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
class _StringsSkedmakerSchedulesCommandbarTlQp extends _StringsSkedmakerSchedulesCommandbarEn {
	_StringsSkedmakerSchedulesCommandbarTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerSchedulesCommandbarRenameTlQp rename = _StringsSkedmakerSchedulesCommandbarRenameTlQp._(_root);
	@override late final _StringsSkedmakerSchedulesCommandbarDeleteTlQp delete = _StringsSkedmakerSchedulesCommandbarDeleteTlQp._(_root);
	@override late final _StringsSkedmakerSchedulesCommandbarStarTlQp star = _StringsSkedmakerSchedulesCommandbarStarTlQp._(_root);
	@override late final _StringsSkedmakerSchedulesCommandbarSaveImageTlQp saveImage = _StringsSkedmakerSchedulesCommandbarSaveImageTlQp._(_root);
}

// Path: skedmaker.schedules.details
class _StringsSkedmakerSchedulesDetailsTlQp extends _StringsSkedmakerSchedulesDetailsEn {
	_StringsSkedmakerSchedulesDetailsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Details';
	@override String get notes => 'Notes';
	@override String get subjects => 'Subjects';
}

// Path: skedmaker.schedules.info
class _StringsSkedmakerSchedulesInfoTlQp extends _StringsSkedmakerSchedulesInfoEn {
	_StringsSkedmakerSchedulesInfoTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Info';
	@override String get title => 'Information';
	@override String get desc => 'Mag-select ng schedule sa left.\nI-view at i-compare multiple schedules by opening new tabs at the top.\n\nKeyboard shortcuts:\nUp/Down arrow key - pumunta sa next/previous schedule\nCtrl + T - gumawa ng new tab\nCtrl + W o Ctrl + F4 - i-close current tab\nCtrl + 1 hanggang 8 - pumunta sa first to eighth tab\nCtrl + 9 - pumunta sa last tab\n';
}

// Path: skedmaker.schedules.options
class _StringsSkedmakerSchedulesOptionsTlQp extends _StringsSkedmakerSchedulesOptionsEn {
	_StringsSkedmakerSchedulesOptionsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get hoverEffects => 'I-enable ang hover effects';
}

// Path: skedmaker.scheduleDay.mondayFace
class _StringsSkedmakerScheduleDayMondayFaceTlQp extends _StringsSkedmakerScheduleDayMondayFaceEn {
	_StringsSkedmakerScheduleDayMondayFaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday (face-to-face)';
	@override String get nameShort => 'M (f2f)';
}

// Path: skedmaker.scheduleDay.mondayOnline
class _StringsSkedmakerScheduleDayMondayOnlineTlQp extends _StringsSkedmakerScheduleDayMondayOnlineEn {
	_StringsSkedmakerScheduleDayMondayOnlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday (online)';
	@override String get nameShort => 'M (online)';
}

// Path: skedmaker.scheduleDay.mondayHybrid
class _StringsSkedmakerScheduleDayMondayHybridTlQp extends _StringsSkedmakerScheduleDayMondayHybridEn {
	_StringsSkedmakerScheduleDayMondayHybridTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday (hybrid)';
	@override String get nameShort => 'M (hybrid)';
}

// Path: skedmaker.scheduleDay.mondayUnknown
class _StringsSkedmakerScheduleDayMondayUnknownTlQp extends _StringsSkedmakerScheduleDayMondayUnknownEn {
	_StringsSkedmakerScheduleDayMondayUnknownTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday';
	@override String get nameShort => 'M';
}

// Path: skedmaker.scheduleDay.tuesdayFace
class _StringsSkedmakerScheduleDayTuesdayFaceTlQp extends _StringsSkedmakerScheduleDayTuesdayFaceEn {
	_StringsSkedmakerScheduleDayTuesdayFaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday (face-to-face)';
	@override String get nameShort => 'T (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayOnline
class _StringsSkedmakerScheduleDayTuesdayOnlineTlQp extends _StringsSkedmakerScheduleDayTuesdayOnlineEn {
	_StringsSkedmakerScheduleDayTuesdayOnlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday (online)';
	@override String get nameShort => 'T (online)';
}

// Path: skedmaker.scheduleDay.tuesdayHybrid
class _StringsSkedmakerScheduleDayTuesdayHybridTlQp extends _StringsSkedmakerScheduleDayTuesdayHybridEn {
	_StringsSkedmakerScheduleDayTuesdayHybridTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday (hybrid)';
	@override String get nameShort => 'T (hybrid)';
}

// Path: skedmaker.scheduleDay.tuesdayUnknown
class _StringsSkedmakerScheduleDayTuesdayUnknownTlQp extends _StringsSkedmakerScheduleDayTuesdayUnknownEn {
	_StringsSkedmakerScheduleDayTuesdayUnknownTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday';
	@override String get nameShort => 'T';
}

// Path: skedmaker.scheduleDay.wednesdayFace
class _StringsSkedmakerScheduleDayWednesdayFaceTlQp extends _StringsSkedmakerScheduleDayWednesdayFaceEn {
	_StringsSkedmakerScheduleDayWednesdayFaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday (face-to-face)';
	@override String get nameShort => 'W (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdayOnline
class _StringsSkedmakerScheduleDayWednesdayOnlineTlQp extends _StringsSkedmakerScheduleDayWednesdayOnlineEn {
	_StringsSkedmakerScheduleDayWednesdayOnlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday (online)';
	@override String get nameShort => 'W (online)';
}

// Path: skedmaker.scheduleDay.wednesdayHybrid
class _StringsSkedmakerScheduleDayWednesdayHybridTlQp extends _StringsSkedmakerScheduleDayWednesdayHybridEn {
	_StringsSkedmakerScheduleDayWednesdayHybridTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday (hybrid)';
	@override String get nameShort => 'W (hybrid)';
}

// Path: skedmaker.scheduleDay.wednesdayUnknown
class _StringsSkedmakerScheduleDayWednesdayUnknownTlQp extends _StringsSkedmakerScheduleDayWednesdayUnknownEn {
	_StringsSkedmakerScheduleDayWednesdayUnknownTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday';
	@override String get nameShort => 'W';
}

// Path: skedmaker.scheduleDay.thursdayFace
class _StringsSkedmakerScheduleDayThursdayFaceTlQp extends _StringsSkedmakerScheduleDayThursdayFaceEn {
	_StringsSkedmakerScheduleDayThursdayFaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Thursday (face-to-face)';
	@override String get nameShort => 'H (f2f)';
}

// Path: skedmaker.scheduleDay.thursdayOnline
class _StringsSkedmakerScheduleDayThursdayOnlineTlQp extends _StringsSkedmakerScheduleDayThursdayOnlineEn {
	_StringsSkedmakerScheduleDayThursdayOnlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Thursday (online)';
	@override String get nameShort => 'H (online)';
}

// Path: skedmaker.scheduleDay.thursdayHybrid
class _StringsSkedmakerScheduleDayThursdayHybridTlQp extends _StringsSkedmakerScheduleDayThursdayHybridEn {
	_StringsSkedmakerScheduleDayThursdayHybridTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Thursday (hybrid)';
	@override String get nameShort => 'H (hybrid)';
}

// Path: skedmaker.scheduleDay.thursdayUnknown
class _StringsSkedmakerScheduleDayThursdayUnknownTlQp extends _StringsSkedmakerScheduleDayThursdayUnknownEn {
	_StringsSkedmakerScheduleDayThursdayUnknownTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Thursday';
	@override String get nameShort => 'H';
}

// Path: skedmaker.scheduleDay.fridayFace
class _StringsSkedmakerScheduleDayFridayFaceTlQp extends _StringsSkedmakerScheduleDayFridayFaceEn {
	_StringsSkedmakerScheduleDayFridayFaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Friday (face-to-face)';
	@override String get nameShort => 'F (f2f)';
}

// Path: skedmaker.scheduleDay.fridayOnline
class _StringsSkedmakerScheduleDayFridayOnlineTlQp extends _StringsSkedmakerScheduleDayFridayOnlineEn {
	_StringsSkedmakerScheduleDayFridayOnlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Friday (online)';
	@override String get nameShort => 'F (online)';
}

// Path: skedmaker.scheduleDay.fridayHybrid
class _StringsSkedmakerScheduleDayFridayHybridTlQp extends _StringsSkedmakerScheduleDayFridayHybridEn {
	_StringsSkedmakerScheduleDayFridayHybridTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Friday (hybrid)';
	@override String get nameShort => 'F (hybrid)';
}

// Path: skedmaker.scheduleDay.fridayUnknown
class _StringsSkedmakerScheduleDayFridayUnknownTlQp extends _StringsSkedmakerScheduleDayFridayUnknownEn {
	_StringsSkedmakerScheduleDayFridayUnknownTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Friday';
	@override String get nameShort => 'F';
}

// Path: skedmaker.scheduleDay.saturdayFace
class _StringsSkedmakerScheduleDaySaturdayFaceTlQp extends _StringsSkedmakerScheduleDaySaturdayFaceEn {
	_StringsSkedmakerScheduleDaySaturdayFaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Saturday (face-to-face)';
	@override String get nameShort => 'S (f2f)';
}

// Path: skedmaker.scheduleDay.saturdayOnline
class _StringsSkedmakerScheduleDaySaturdayOnlineTlQp extends _StringsSkedmakerScheduleDaySaturdayOnlineEn {
	_StringsSkedmakerScheduleDaySaturdayOnlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Saturday (online)';
	@override String get nameShort => 'S (online)';
}

// Path: skedmaker.scheduleDay.saturdayHybrid
class _StringsSkedmakerScheduleDaySaturdayHybridTlQp extends _StringsSkedmakerScheduleDaySaturdayHybridEn {
	_StringsSkedmakerScheduleDaySaturdayHybridTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Saturday (hybrid)';
	@override String get nameShort => 'S (hybrid)';
}

// Path: skedmaker.scheduleDay.saturdayUnknown
class _StringsSkedmakerScheduleDaySaturdayUnknownTlQp extends _StringsSkedmakerScheduleDaySaturdayUnknownEn {
	_StringsSkedmakerScheduleDaySaturdayUnknownTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Saturday';
	@override String get nameShort => 'S';
}

// Path: skedmaker.scheduleDay.mondaythursdayFace
class _StringsSkedmakerScheduleDayMondaythursdayFaceTlQp extends _StringsSkedmakerScheduleDayMondaythursdayFaceEn {
	_StringsSkedmakerScheduleDayMondaythursdayFaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday at Thursday (both face-to-face)';
	@override String get nameShort => 'M & H (both f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnline
class _StringsSkedmakerScheduleDayMondaythursdayOnlineTlQp extends _StringsSkedmakerScheduleDayMondaythursdayOnlineEn {
	_StringsSkedmakerScheduleDayMondaythursdayOnlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday at Thursday (both online)';
	@override String get nameShort => 'M & H (both online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnlineface
class _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceTlQp extends _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceEn {
	_StringsSkedmakerScheduleDayMondaythursdayOnlinefaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday (online) at Thursday (face-to-face)';
	@override String get nameShort => 'M (online) & H (f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayFaceonline
class _StringsSkedmakerScheduleDayMondaythursdayFaceonlineTlQp extends _StringsSkedmakerScheduleDayMondaythursdayFaceonlineEn {
	_StringsSkedmakerScheduleDayMondaythursdayFaceonlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday (face-to-face) at Thursday (online)';
	@override String get nameShort => 'M (f2f) & H (online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayUnknown
class _StringsSkedmakerScheduleDayMondaythursdayUnknownTlQp extends _StringsSkedmakerScheduleDayMondaythursdayUnknownEn {
	_StringsSkedmakerScheduleDayMondaythursdayUnknownTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Monday at Thursday';
	@override String get nameShort => 'M & H';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFace
class _StringsSkedmakerScheduleDayTuesdayfridayFaceTlQp extends _StringsSkedmakerScheduleDayTuesdayfridayFaceEn {
	_StringsSkedmakerScheduleDayTuesdayfridayFaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday at Friday (both face-to-face)';
	@override String get nameShort => 'T & F (both f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnline
class _StringsSkedmakerScheduleDayTuesdayfridayOnlineTlQp extends _StringsSkedmakerScheduleDayTuesdayfridayOnlineEn {
	_StringsSkedmakerScheduleDayTuesdayfridayOnlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday at Friday (both online)';
	@override String get nameShort => 'T & F (both online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnlineface
class _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceTlQp extends _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn {
	_StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday (online) at Friday (face-to-face)';
	@override String get nameShort => 'T (online) & F (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFaceonline
class _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineTlQp extends _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineEn {
	_StringsSkedmakerScheduleDayTuesdayfridayFaceonlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday (face-to-face) at Friday (online)';
	@override String get nameShort => 'T (f2f) & F (online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayUnknown
class _StringsSkedmakerScheduleDayTuesdayfridayUnknownTlQp extends _StringsSkedmakerScheduleDayTuesdayfridayUnknownEn {
	_StringsSkedmakerScheduleDayTuesdayfridayUnknownTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Tuesday at Friday';
	@override String get nameShort => 'T & F';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFace
class _StringsSkedmakerScheduleDayWednesdaysaturdayFaceTlQp extends _StringsSkedmakerScheduleDayWednesdaysaturdayFaceEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayFaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday at Saturday (both face-to-face)';
	@override String get nameShort => 'W & S (both f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnline
class _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineTlQp extends _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayOnlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday at Saturday (both online)';
	@override String get nameShort => 'W & S (both online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnlineface
class _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTlQp extends _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday (online) at Saturday (face-to-face)';
	@override String get nameShort => 'W (online) & S (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFaceonline
class _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTlQp extends _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday (face-to-face) at Saturday (online)';
	@override String get nameShort => 'W (f2f) & S (online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayUnknown
class _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownTlQp extends _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayUnknownTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Wednesday at Saturday';
	@override String get nameShort => 'W & S';
}

// Path: skedmaker.scheduleDay.unknown
class _StringsSkedmakerScheduleDayUnknownTlQp extends _StringsSkedmakerScheduleDayUnknownEn {
	_StringsSkedmakerScheduleDayUnknownTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Unknown';
	@override String get nameShort => 'Unknown';
}

// Path: skedmaker.subjects.add.buttonMls
class _StringsSkedmakerSubjectsAddButtonMlsTlQp extends _StringsSkedmakerSubjectsAddButtonMlsEn {
	_StringsSkedmakerSubjectsAddButtonMlsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

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
class _StringsSkedmakerSubjectsAddButtonManualTlQp extends _StringsSkedmakerSubjectsAddButtonManualEn {
	_StringsSkedmakerSubjectsAddButtonManualTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mag-add manu-mano';
	@override String get title => 'Mag-create ng new subject';
	@override String get desc => 'Mag-enter ng 7-character na subject code:';
}

// Path: skedmaker.subjects.add.buttonCode
class _StringsSkedmakerSubjectsAddButtonCodeTlQp extends _StringsSkedmakerSubjectsAddButtonCodeEn {
	_StringsSkedmakerSubjectsAddButtonCodeTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

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

// Path: skedmaker.subjects.subject.actions
class _StringsSkedmakerSubjectsSubjectActionsTlQp extends _StringsSkedmakerSubjectsSubjectActionsEn {
	_StringsSkedmakerSubjectsSubjectActionsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerSubjectsSubjectActionsRecolorTlQp recolor = _StringsSkedmakerSubjectsSubjectActionsRecolorTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectActionsDeleteTlQp delete = _StringsSkedmakerSubjectsSubjectActionsDeleteTlQp._(_root);
	@override String get showhide => 'I-show/I-hide';
	@override String get offeringAdd => 'Mag-add ng offering';
	@override late final _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteTlQp offeringDelete = _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteTlQp._(_root);
}

// Path: skedmaker.subjects.subject.table
class _StringsSkedmakerSubjectsSubjectTableTlQp extends _StringsSkedmakerSubjectsSubjectTableEn {
	_StringsSkedmakerSubjectsSubjectTableTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerSubjectsSubjectTableStatusTlQp status = _StringsSkedmakerSubjectsSubjectTableStatusTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableClassnoTlQp classno = _StringsSkedmakerSubjectsSubjectTableClassnoTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableSectionTlQp section = _StringsSkedmakerSubjectsSubjectTableSectionTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableRoomTlQp room = _StringsSkedmakerSubjectsSubjectTableRoomTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableDayTlQp day = _StringsSkedmakerSubjectsSubjectTableDayTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableTimeTlQp time = _StringsSkedmakerSubjectsSubjectTableTimeTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableTeacherTlQp teacher = _StringsSkedmakerSubjectsSubjectTableTeacherTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableSlotsTlQp slots = _StringsSkedmakerSubjectsSubjectTableSlotsTlQp._(_root);
	@override late final _StringsSkedmakerSubjectsSubjectTableRemarksTlQp remarks = _StringsSkedmakerSubjectsSubjectTableRemarksTlQp._(_root);
}

// Path: skedmaker.subjects.subject.infobar
class _StringsSkedmakerSubjectsSubjectInfobarTlQp extends _StringsSkedmakerSubjectsSubjectInfobarEn {
	_StringsSkedmakerSubjectsSubjectInfobarTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String noAvailableOffering({required Object subject}) => '${subject} ay walang available na offering.';
	@override String hidden({required Object subject}) => 'Naka-hide ang ${subject}. Hindi ito included kapag nag-gegenerate ng mga schedule.';
}

// Path: skedmaker.filters.categories.offerings
class _StringsSkedmakerFiltersCategoriesOfferingsTlQp extends _StringsSkedmakerFiltersCategoriesOfferingsEn {
	_StringsSkedmakerFiltersCategoriesOfferingsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mga offering';
	@override String get desc => 'I-filter ang mga offerings na i-iinclude at i-eexclude';
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedTlQp includeClosed = _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTlQp includeFullSlots = _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTlQp includeUnknownModality = _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTlQp includeNoTeachers = _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTlQp excludeSectionLetter = _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTlQp includeFreshmanBlock = _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTlQp._(_root);
}

// Path: skedmaker.filters.categories.day
class _StringsSkedmakerFiltersCategoriesDayTlQp extends _StringsSkedmakerFiltersCategoriesDayEn {
	_StringsSkedmakerFiltersCategoriesDayTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Specific sa day';
	@override String get desc => 'Mag-add ng specific filters kada araw ng linggo';
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTlQp commonMaxNumberOfSubjects = _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalTlQp commonTimeInterval = _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonModalityTlQp commonModality = _StringsSkedmakerFiltersCategoriesDayCommonModalityTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTlQp commonStartWithSubject = _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTlQp commonEndWithSubject = _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeTlQp commonBreaktime = _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeTlQp._(_root);
	@override String get mondayName => 'Monday';
	@override String get tuesdayName => 'Tuesday';
	@override String get wednesdayName => 'Wednesday';
	@override String get thursdayName => 'Thursday';
	@override String get fridayName => 'Friday';
	@override String get saturdayName => 'Saturday';
}

// Path: skedmaker.filters.categories.location
class _StringsSkedmakerFiltersCategoriesLocationTlQp extends _StringsSkedmakerFiltersCategoriesLocationEn {
	_StringsSkedmakerFiltersCategoriesLocationTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Location (experimental)';
	@override String get desc => 'I-filter ang schedules base sa location ng offering';
	@override late final _StringsSkedmakerFiltersCategoriesLocationEnabledTlQp enabled = _StringsSkedmakerFiltersCategoriesLocationEnabledTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTlQp checkingDistanceMinutes = _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTlQp maxAllowedDistanceMeters = _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTlQp._(_root);
	@override late final _StringsSkedmakerFiltersCategoriesLocationCalculatorTlQp calculator = _StringsSkedmakerFiltersCategoriesLocationCalculatorTlQp._(_root);
}

// Path: skedmaker.schedules.commandbar.rename
class _StringsSkedmakerSchedulesCommandbarRenameTlQp extends _StringsSkedmakerSchedulesCommandbarRenameEn {
	_StringsSkedmakerSchedulesCommandbarRenameTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-rename';
	@override String get edit => 'Mag-enter ng bagong name';
}

// Path: skedmaker.schedules.commandbar.delete
class _StringsSkedmakerSchedulesCommandbarDeleteTlQp extends _StringsSkedmakerSchedulesCommandbarDeleteEn {
	_StringsSkedmakerSchedulesCommandbarDeleteTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-delete';
	@override String desc({required Object name}) => 'I-delete ang ${name}?\n\'Di mo \'to ma-uundelete..\nMadedelete lahat ng tabs with this schedule.\n';
}

// Path: skedmaker.schedules.commandbar.star
class _StringsSkedmakerSchedulesCommandbarStarTlQp extends _StringsSkedmakerSchedulesCommandbarStarEn {
	_StringsSkedmakerSchedulesCommandbarStarTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get star => 'I-star';
	@override String get unstar => 'I-unstar';
}

// Path: skedmaker.schedules.commandbar.saveImage
class _StringsSkedmakerSchedulesCommandbarSaveImageTlQp extends _StringsSkedmakerSchedulesCommandbarSaveImageEn {
	_StringsSkedmakerSchedulesCommandbarSaveImageTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

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
class _StringsSkedmakerSubjectsSubjectActionsRecolorTlQp extends _StringsSkedmakerSubjectsSubjectActionsRecolorEn {
	_StringsSkedmakerSubjectsSubjectActionsRecolorTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-recolor';
	@override String get title => 'Mag-select ng color';
	@override String get primary => 'Primary';
	@override String get wheel => 'Wheel';
	@override String get shades => 'Shades';
}

// Path: skedmaker.subjects.subject.actions.delete
class _StringsSkedmakerSubjectsSubjectActionsDeleteTlQp extends _StringsSkedmakerSubjectsSubjectActionsDeleteEn {
	_StringsSkedmakerSubjectsSubjectActionsDeleteTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-delete';
	@override String warning({required Object subject}) => 'I-delete ang ${subject}? \n\'Di mo \'to ma-uundelete.';
}

// Path: skedmaker.subjects.subject.actions.offeringDelete
class _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteTlQp extends _StringsSkedmakerSubjectsSubjectActionsOfferingDeleteEn {
	_StringsSkedmakerSubjectsSubjectActionsOfferingDeleteTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mag-delete ng offering';
	@override String get warning => 'I-delete \'tong offering? \n\'Di mo \'to ma-uundelete.';
}

// Path: skedmaker.subjects.subject.table.status
class _StringsSkedmakerSubjectsSubjectTableStatusTlQp extends _StringsSkedmakerSubjectsSubjectTableStatusEn {
	_StringsSkedmakerSubjectsSubjectTableStatusTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Status';
	@override String get open => 'Naka-open';
	@override String get closed => 'Naka-close';
}

// Path: skedmaker.subjects.subject.table.classno
class _StringsSkedmakerSubjectsSubjectTableClassnoTlQp extends _StringsSkedmakerSubjectsSubjectTableClassnoEn {
	_StringsSkedmakerSubjectsSubjectTableClassnoTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Class \#';
	@override String get edit => 'I-edit ang class number:';
}

// Path: skedmaker.subjects.subject.table.section
class _StringsSkedmakerSubjectsSubjectTableSectionTlQp extends _StringsSkedmakerSubjectsSubjectTableSectionEn {
	_StringsSkedmakerSubjectsSubjectTableSectionTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Section';
	@override String get edit => 'I-edit ang section:';
}

// Path: skedmaker.subjects.subject.table.room
class _StringsSkedmakerSubjectsSubjectTableRoomTlQp extends _StringsSkedmakerSubjectsSubjectTableRoomEn {
	_StringsSkedmakerSubjectsSubjectTableRoomTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Room';
	@override String get edit => 'I-edit ang room (puwedeng empty):';
}

// Path: skedmaker.subjects.subject.table.day
class _StringsSkedmakerSubjectsSubjectTableDayTlQp extends _StringsSkedmakerSubjectsSubjectTableDayEn {
	_StringsSkedmakerSubjectsSubjectTableDayTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Day';
	@override String get edit => 'I-edit ang day:';
}

// Path: skedmaker.subjects.subject.table.time
class _StringsSkedmakerSubjectsSubjectTableTimeTlQp extends _StringsSkedmakerSubjectsSubjectTableTimeEn {
	_StringsSkedmakerSubjectsSubjectTableTimeTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

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
class _StringsSkedmakerSubjectsSubjectTableTeacherTlQp extends _StringsSkedmakerSubjectsSubjectTableTeacherEn {
	_StringsSkedmakerSubjectsSubjectTableTeacherTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Teacher';
	@override String get edit => 'I-edit ang teacher (puwedeng empty):';
}

// Path: skedmaker.subjects.subject.table.slots
class _StringsSkedmakerSubjectsSubjectTableSlotsTlQp extends _StringsSkedmakerSubjectsSubjectTableSlotsEn {
	_StringsSkedmakerSubjectsSubjectTableSlotsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Slots';
	@override String data({required Object taken, required Object capacity}) => '${taken} / ${capacity}';
	@override String percent({required Object percent}) => '${percent}%';
	@override String get edit => 'I-edit ang slots:';
	@override String get outOf => ' out of ';
}

// Path: skedmaker.subjects.subject.table.remarks
class _StringsSkedmakerSubjectsSubjectTableRemarksTlQp extends _StringsSkedmakerSubjectsSubjectTableRemarksEn {
	_StringsSkedmakerSubjectsSubjectTableRemarksTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Remarks';
	@override String get edit => 'I-edit ang remarks (puwedeng empty):';
}

// Path: skedmaker.filters.categories.offerings.includeClosed
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedTlQp extends _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-include ang mga closed na offerings';
	@override String get desc => 'I-enable para i-ignore ang status nito (regardless kung open o closed)';
}

// Path: skedmaker.filters.categories.offerings.includeFullSlots
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTlQp extends _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-include ang offerings na full ang slots';
	@override String get desc => 'I-enable para i-ignore ang slot capacity nito';
}

// Path: skedmaker.filters.categories.offerings.includeUnknownModality
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTlQp extends _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-include ang offerings na unknown ang modality';
}

// Path: skedmaker.filters.categories.offerings.includeNoTeachers
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTlQp extends _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-include ang offerings na walang teacher';
}

// Path: skedmaker.filters.categories.offerings.excludeSectionLetter
class _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTlQp extends _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn {
	_StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-exclude ang sections na nag-cocontain ng gan\'to';
	@override String get desc => 'Gamitin \'to para mag-exclude ng offerings na ang section ay may gan\'tong letter(s)';
}

// Path: skedmaker.filters.categories.offerings.includeFreshmanBlock
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTlQp extends _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-include ang freshman block';
}

// Path: skedmaker.filters.categories.day.commonMaxNumberOfSubjects
class _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTlQp extends _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn {
	_StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Maximum na bilang ng subjects';
	@override String get desc => 'I-enter ang -1 \'pag walang limit; I-enter ang 0 \'pag wala talangang subjects';
}

// Path: skedmaker.filters.categories.day.commonTimeInterval
class _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalTlQp extends _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn {
	_StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Dapat may subjects lang sa gan\'tong time interval';
}

// Path: skedmaker.filters.categories.day.commonModality
class _StringsSkedmakerFiltersCategoriesDayCommonModalityTlQp extends _StringsSkedmakerFiltersCategoriesDayCommonModalityEn {
	_StringsSkedmakerFiltersCategoriesDayCommonModalityTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Modality ng subjects';
	@override String get hybrid => 'Online o face-to-face';
	@override String get online => 'Online';
	@override String get face => 'Face-to-face';
	@override String get any => 'Kahit anong modality';
	@override String get unknown => 'Unknown na modality';
}

// Path: skedmaker.filters.categories.day.commonStartWithSubject
class _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTlQp extends _StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn {
	_StringsSkedmakerFiltersCategoriesDayCommonStartWithSubjectTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'First subject ng araw';
}

// Path: skedmaker.filters.categories.day.commonEndWithSubject
class _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTlQp extends _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn {
	_StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Last subject ng araw';
}

// Path: skedmaker.filters.categories.day.commonBreaktime
class _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeTlQp extends _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeEn {
	_StringsSkedmakerFiltersCategoriesDayCommonBreaktimeTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Breaktime';
	@override String get desc => 'Oras na dapat walang subjects';
}

// Path: skedmaker.filters.categories.location.enabled
class _StringsSkedmakerFiltersCategoriesLocationEnabledTlQp extends _StringsSkedmakerFiltersCategoriesLocationEnabledEn {
	_StringsSkedmakerFiltersCategoriesLocationEnabledTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'I-enable ang pag-filter gamit ang location at distance';
	@override String get desc => 'I-coconsider nito ang distance ng: Previous class → ground floor → \nground floor ng next class → next class. \'Pag both ay \nnasa same building, ang distance mula previous hanggang next lang.';
}

// Path: skedmaker.filters.categories.location.checkingDistanceMinutes
class _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTlQp extends _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn {
	_StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Time gap between subjects para i-check ang distance (in minutes)';
}

// Path: skedmaker.filters.categories.location.maxAllowedDistanceMeters
class _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTlQp extends _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn {
	_StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'Maximum distance mula sa isang subject hanggang sa next (in meters)';
}

// Path: skedmaker.filters.categories.location.calculator
class _StringsSkedmakerFiltersCategoriesLocationCalculatorTlQp extends _StringsSkedmakerFiltersCategoriesLocationCalculatorEn {
	_StringsSkedmakerFiltersCategoriesLocationCalculatorTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

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

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.app.name': return 'AralTools';
			case 'general.home.name': return 'Home';
			case 'general.home.welcome': return 'Welcome!';
			case 'general.home.more.title': return 'More coming soon!';
			case 'general.home.more.desc': return 'Stay updated! :)';
			case 'general.drawer.about.name': return 'About';
			case 'general.drawer.about.version': return ({required Object version, required Object build}) => 'Version ${version} build ${build}';
			case 'general.drawer.about.copyright': return 'Copyright (C) 2024 Yivan Andrei Padsoyan';
			case 'general.drawer.support.title': return 'Buy Me A Coffee';
			case 'general.drawer.support.desc': return 'Support me!';
			case 'general.drawer.github.title': return 'View source code';
			case 'general.drawer.github.desc': return 'Contribute to AralTools!';
			case 'general.drawer.bugs.title': return 'Issue tracker';
			case 'general.drawer.bugs.desc': return 'Report issues & bugs here!';
			case 'general.drawer.language.title': return ({required Object language}) => 'Language: ${language}';
			case 'general.drawer.language.tooltip': return 'Change language';
			case 'general.functions.backToHome.name': return 'Back to home';
			case 'general.functions.backToHome.title': return 'Go back to home?';
			case 'general.functions.backToHome.desc': return 'All unsaved data will be lost.';
			case 'general.functions.newProject.title': return 'Create new project?';
			case 'general.functions.newProject.desc': return 'All unsaved data will be lost.';
			case 'general.general.go': return 'Go';
			case 'general.general.ok': return 'OK';
			case 'general.general.open.regular': return 'Open';
			case 'general.general.open.ellipsis': return 'Open...';
			case 'general.general.delete': return 'Delete';
			case 'general.general.add': return 'Add';
			case 'general.general.select': return 'Select';
			case 'general.general.save': return 'Save';
			case 'general.general.saveDont': return 'Don\'t save';
			case 'general.general.saveAs.regular': return 'Save as';
			case 'general.general.saveAs.ellipsis': return 'Save as...';
			case 'general.general.cancel': return 'Cancel';
			case 'general.general.resume': return 'Resume';
			case 'general.general.pause': return 'Pause';
			case 'general.general.stop': return 'Stop';
			case 'general.general.close': return 'Close';
			case 'general.general.rename': return 'Rename';
			case 'general.general.copy': return 'Copy';
			case 'general.general.new_': return 'New';
			case 'general.general.date.eras.0': return 'BC';
			case 'general.general.date.eras.1': return 'AD';
			case 'general.general.date.eraNames.0': return 'Before Christ';
			case 'general.general.date.eraNames.1': return 'Anno Domini';
			case 'general.general.date.narrowMonths.0': return 'J';
			case 'general.general.date.narrowMonths.1': return 'F';
			case 'general.general.date.narrowMonths.2': return 'M';
			case 'general.general.date.narrowMonths.3': return 'A';
			case 'general.general.date.narrowMonths.4': return 'M';
			case 'general.general.date.narrowMonths.5': return 'J';
			case 'general.general.date.narrowMonths.6': return 'J';
			case 'general.general.date.narrowMonths.7': return 'A';
			case 'general.general.date.narrowMonths.8': return 'S';
			case 'general.general.date.narrowMonths.9': return 'O';
			case 'general.general.date.narrowMonths.10': return 'N';
			case 'general.general.date.narrowMonths.11': return 'D';
			case 'general.general.date.standaloneNarrowMonths.0': return 'J';
			case 'general.general.date.standaloneNarrowMonths.1': return 'F';
			case 'general.general.date.standaloneNarrowMonths.2': return 'M';
			case 'general.general.date.standaloneNarrowMonths.3': return 'A';
			case 'general.general.date.standaloneNarrowMonths.4': return 'M';
			case 'general.general.date.standaloneNarrowMonths.5': return 'J';
			case 'general.general.date.standaloneNarrowMonths.6': return 'J';
			case 'general.general.date.standaloneNarrowMonths.7': return 'A';
			case 'general.general.date.standaloneNarrowMonths.8': return 'S';
			case 'general.general.date.standaloneNarrowMonths.9': return 'O';
			case 'general.general.date.standaloneNarrowMonths.10': return 'N';
			case 'general.general.date.standaloneNarrowMonths.11': return 'D';
			case 'general.general.date.months.0': return 'January';
			case 'general.general.date.months.1': return 'February';
			case 'general.general.date.months.2': return 'March';
			case 'general.general.date.months.3': return 'April';
			case 'general.general.date.months.4': return 'May';
			case 'general.general.date.months.5': return 'June';
			case 'general.general.date.months.6': return 'July';
			case 'general.general.date.months.7': return 'August';
			case 'general.general.date.months.8': return 'September';
			case 'general.general.date.months.9': return 'October';
			case 'general.general.date.months.10': return 'November';
			case 'general.general.date.months.11': return 'December';
			case 'general.general.date.standaloneMonths.0': return 'January';
			case 'general.general.date.standaloneMonths.1': return 'February';
			case 'general.general.date.standaloneMonths.2': return 'March';
			case 'general.general.date.standaloneMonths.3': return 'April';
			case 'general.general.date.standaloneMonths.4': return 'May';
			case 'general.general.date.standaloneMonths.5': return 'June';
			case 'general.general.date.standaloneMonths.6': return 'July';
			case 'general.general.date.standaloneMonths.7': return 'August';
			case 'general.general.date.standaloneMonths.8': return 'September';
			case 'general.general.date.standaloneMonths.9': return 'October';
			case 'general.general.date.standaloneMonths.10': return 'November';
			case 'general.general.date.standaloneMonths.11': return 'December';
			case 'general.general.date.shortMonths.0': return 'Jan';
			case 'general.general.date.shortMonths.1': return 'Feb';
			case 'general.general.date.shortMonths.2': return 'Mar';
			case 'general.general.date.shortMonths.3': return 'Apr';
			case 'general.general.date.shortMonths.4': return 'May';
			case 'general.general.date.shortMonths.5': return 'Jun';
			case 'general.general.date.shortMonths.6': return 'Jul';
			case 'general.general.date.shortMonths.7': return 'Aug';
			case 'general.general.date.shortMonths.8': return 'Sep';
			case 'general.general.date.shortMonths.9': return 'Oct';
			case 'general.general.date.shortMonths.10': return 'Nov';
			case 'general.general.date.shortMonths.11': return 'Dec';
			case 'general.general.date.standaloneShortMonths.0': return 'Jan';
			case 'general.general.date.standaloneShortMonths.1': return 'Feb';
			case 'general.general.date.standaloneShortMonths.2': return 'Mar';
			case 'general.general.date.standaloneShortMonths.3': return 'Apr';
			case 'general.general.date.standaloneShortMonths.4': return 'May';
			case 'general.general.date.standaloneShortMonths.5': return 'Jun';
			case 'general.general.date.standaloneShortMonths.6': return 'Jul';
			case 'general.general.date.standaloneShortMonths.7': return 'Aug';
			case 'general.general.date.standaloneShortMonths.8': return 'Sep';
			case 'general.general.date.standaloneShortMonths.9': return 'Oct';
			case 'general.general.date.standaloneShortMonths.10': return 'Nov';
			case 'general.general.date.standaloneShortMonths.11': return 'Dec';
			case 'general.general.date.weekdays.0': return 'Sunday';
			case 'general.general.date.weekdays.1': return 'Monday';
			case 'general.general.date.weekdays.2': return 'Tuesday';
			case 'general.general.date.weekdays.3': return 'Wednesday';
			case 'general.general.date.weekdays.4': return 'Thursday';
			case 'general.general.date.weekdays.5': return 'Friday';
			case 'general.general.date.weekdays.6': return 'Saturday';
			case 'general.general.date.standaloneWeekdays.0': return 'Sunday';
			case 'general.general.date.standaloneWeekdays.1': return 'Monday';
			case 'general.general.date.standaloneWeekdays.2': return 'Tuesday';
			case 'general.general.date.standaloneWeekdays.3': return 'Wednesday';
			case 'general.general.date.standaloneWeekdays.4': return 'Thursday';
			case 'general.general.date.standaloneWeekdays.5': return 'Friday';
			case 'general.general.date.standaloneWeekdays.6': return 'Saturday';
			case 'general.general.date.shortWeekdays.0': return 'Sun';
			case 'general.general.date.shortWeekdays.1': return 'Mon';
			case 'general.general.date.shortWeekdays.2': return 'Tue';
			case 'general.general.date.shortWeekdays.3': return 'Wed';
			case 'general.general.date.shortWeekdays.4': return 'Thu';
			case 'general.general.date.shortWeekdays.5': return 'Fri';
			case 'general.general.date.shortWeekdays.6': return 'Sat';
			case 'general.general.date.standaloneShortWeekdays.0': return 'Sun';
			case 'general.general.date.standaloneShortWeekdays.1': return 'Mon';
			case 'general.general.date.standaloneShortWeekdays.2': return 'Tue';
			case 'general.general.date.standaloneShortWeekdays.3': return 'Wed';
			case 'general.general.date.standaloneShortWeekdays.4': return 'Thu';
			case 'general.general.date.standaloneShortWeekdays.5': return 'Fri';
			case 'general.general.date.standaloneShortWeekdays.6': return 'Sat';
			case 'general.general.date.narrowWeekdays.0': return 'S';
			case 'general.general.date.narrowWeekdays.1': return 'M';
			case 'general.general.date.narrowWeekdays.2': return 'T';
			case 'general.general.date.narrowWeekdays.3': return 'W';
			case 'general.general.date.narrowWeekdays.4': return 'T';
			case 'general.general.date.narrowWeekdays.5': return 'F';
			case 'general.general.date.narrowWeekdays.6': return 'S';
			case 'general.general.date.standaloneNarrowWeekdays.0': return 'S';
			case 'general.general.date.standaloneNarrowWeekdays.1': return 'M';
			case 'general.general.date.standaloneNarrowWeekdays.2': return 'T';
			case 'general.general.date.standaloneNarrowWeekdays.3': return 'W';
			case 'general.general.date.standaloneNarrowWeekdays.4': return 'T';
			case 'general.general.date.standaloneNarrowWeekdays.5': return 'F';
			case 'general.general.date.standaloneNarrowWeekdays.6': return 'S';
			case 'general.general.date.shortQuarters.0': return 'Q1';
			case 'general.general.date.shortQuarters.1': return 'Q2';
			case 'general.general.date.shortQuarters.2': return 'Q3';
			case 'general.general.date.shortQuarters.3': return 'Q4';
			case 'general.general.date.quarters.0': return '1st quarter';
			case 'general.general.date.quarters.1': return '2nd quarter';
			case 'general.general.date.quarters.2': return '3rd quarter';
			case 'general.general.date.quarters.3': return '4th quarter';
			case 'general.general.date.ampms.0': return 'AM';
			case 'general.general.date.ampms.1': return 'PM';
			case 'general.general.date.dateFormats.0': return 'EEEE, MMMM d, y';
			case 'general.general.date.dateFormats.1': return 'MMMM d, y';
			case 'general.general.date.dateFormats.2': return 'MMM d, y';
			case 'general.general.date.dateFormats.3': return 'M/d/yy';
			case 'general.general.date.timeFormats.0': return 'h:mm:ss a zzzz';
			case 'general.general.date.timeFormats.1': return 'h:mm:ss a z';
			case 'general.general.date.timeFormats.2': return 'h:mm:ss a';
			case 'general.general.date.timeFormats.3': return 'h:mm a';
			case 'general.general.date.firstDayOfWeek': return '6';
			case 'general.general.date.weekendRange.0': return '5';
			case 'general.general.date.weekendRange.1': return '6';
			case 'general.general.date.firstWeekCutoffDay': return '5';
			case 'general.general.date.dateTimeFormats.0': return '{1}, {0}';
			case 'general.general.date.dateTimeFormats.1': return '{1}, {0}';
			case 'general.general.date.dateTimeFormats.2': return '{1}, {0}';
			case 'general.general.date.dateTimeFormats.3': return '{1}, {0}';
			case 'skedmaker.info.name': return 'SkedMaker';
			case 'skedmaker.info.nameFull': return '${_root.general.app.name} ${_root.skedmaker.info.name}';
			case 'skedmaker.info.desc': return 'The automatic class schedule maker for DLSU students';
			case 'skedmaker.drawer.fileLocation.name': return 'File location';
			case 'skedmaker.drawer.fileLocation.empty': return '-';
			case 'skedmaker.drawer.fileLocation.open': return 'Open file location';
			case 'skedmaker.subjects.name': return 'Subjects';
			case 'skedmaker.subjects.add.title': return 'Add subject';
			case 'skedmaker.subjects.add.buttonMls.name': return 'Add from My.LaSalle';
			case 'skedmaker.subjects.add.buttonMls.title': return 'Add subject';
			case 'skedmaker.subjects.add.buttonMls.desc': return 'Enter your ID number and the subject code on the pop-up window. Once the offerings are displayed, click "Add".';
			case 'skedmaker.subjects.add.buttonMls.webviewTitle': return 'WebView2 is not installed';
			case 'skedmaker.subjects.add.buttonMls.webviewDesc': return ({required InlineSpanBuilder webview, required InlineSpanBuilder learn}) => TextSpan(children: [
				const TextSpan(text: 'You need to download and install the '),
				webview('Microsoft Edge WebView2 Runtime'),
				const TextSpan(text: ' to access My.LaSalle within AralTools SkedMaker. This program is already included with Windows 11, but your device doesn\'t.\n\n'),
				learn('Click here to learn more.'),
			]);
			case 'skedmaker.subjects.add.buttonManual.name': return 'Add manually';
			case 'skedmaker.subjects.add.buttonManual.title': return 'Create new subject';
			case 'skedmaker.subjects.add.buttonManual.desc': return 'Enter a 7-character subject code:';
			case 'skedmaker.subjects.add.buttonCode.name': return 'Add via code';
			case 'skedmaker.subjects.add.buttonCode.title': return 'Add subjects via code';
			case 'skedmaker.subjects.add.buttonCode.desc': return ({required InlineSpanBuilder mls}) => TextSpan(children: [
				const TextSpan(text: 'Open '),
				mls(_root.skedmaker.mlsCourseOfferings),
				const TextSpan(text: ' on a browser and enter your ID number and subject code as normal. Once the offerings are displayed, open the Developer Console and enter this command:'),
			]);
			case 'skedmaker.subjects.add.buttonCode.field': return 'Copy the output and paste it here:';
			case 'skedmaker.subjects.add.buttonCode.hint': return 'The command output';
			case 'skedmaker.subjects.add.buttonCode.error': return 'Invalid input';
			case 'skedmaker.subjects.subject.title': return ({required Object subject, required Object offering, required Object available}) => '${subject} - ${offering} offerings (${available} available)';
			case 'skedmaker.subjects.subject.actions.recolor.name': return 'Recolor';
			case 'skedmaker.subjects.subject.actions.recolor.title': return 'Select color';
			case 'skedmaker.subjects.subject.actions.recolor.primary': return 'Primary';
			case 'skedmaker.subjects.subject.actions.recolor.wheel': return 'Wheel';
			case 'skedmaker.subjects.subject.actions.recolor.shades': return 'Shades';
			case 'skedmaker.subjects.subject.actions.delete.name': return 'Delete';
			case 'skedmaker.subjects.subject.actions.delete.warning': return ({required Object subject}) => 'Delete ${subject}? \nYou cannot un-delete this.';
			case 'skedmaker.subjects.subject.actions.showhide': return 'Show/Hide';
			case 'skedmaker.subjects.subject.actions.offeringAdd': return 'Add offering';
			case 'skedmaker.subjects.subject.actions.offeringDelete.name': return 'Delete offering';
			case 'skedmaker.subjects.subject.actions.offeringDelete.warning': return 'Delete this offering? \nYou cannot un-delete this.';
			case 'skedmaker.subjects.subject.table.status.name': return 'Status';
			case 'skedmaker.subjects.subject.table.status.open': return 'Open';
			case 'skedmaker.subjects.subject.table.status.closed': return 'Closed';
			case 'skedmaker.subjects.subject.table.classno.name': return 'Class \#';
			case 'skedmaker.subjects.subject.table.classno.edit': return 'Edit class number:';
			case 'skedmaker.subjects.subject.table.section.name': return 'Section';
			case 'skedmaker.subjects.subject.table.section.edit': return 'Edit section:';
			case 'skedmaker.subjects.subject.table.room.name': return 'Room';
			case 'skedmaker.subjects.subject.table.room.edit': return 'Edit room (can be empty):';
			case 'skedmaker.subjects.subject.table.day.name': return 'Day';
			case 'skedmaker.subjects.subject.table.day.edit': return 'Edit day:';
			case 'skedmaker.subjects.subject.table.time.name': return 'Time';
			case 'skedmaker.subjects.subject.table.time.data': return ({required Object from, required Object to}) => '${from} - ${to}';
			case 'skedmaker.subjects.subject.table.time.edit': return 'Edit time:';
			case 'skedmaker.subjects.subject.table.time.to': return ' to ';
			case 'skedmaker.subjects.subject.table.time.secondTimeInterval': return 'Second time interval';
			case 'skedmaker.subjects.subject.table.time.errorStartTimeBeforeEndTime': return 'Start time must be before end time';
			case 'skedmaker.subjects.subject.table.time.errorSecondTimeInterval': return 'This must have a second time interval';
			case 'skedmaker.subjects.subject.table.time.errorConflict': return 'The two time intervals must not conflict since it\'s on the same day';
			case 'skedmaker.subjects.subject.table.teacher.name': return 'Teacher';
			case 'skedmaker.subjects.subject.table.teacher.edit': return 'Edit teacher (can be empty):';
			case 'skedmaker.subjects.subject.table.slots.name': return 'Slots';
			case 'skedmaker.subjects.subject.table.slots.data': return ({required Object taken, required Object capacity}) => '${taken} / ${capacity}';
			case 'skedmaker.subjects.subject.table.slots.percent': return ({required Object percent}) => '${percent}%';
			case 'skedmaker.subjects.subject.table.slots.edit': return 'Edit slots:';
			case 'skedmaker.subjects.subject.table.slots.outOf': return ' out of ';
			case 'skedmaker.subjects.subject.table.remarks.name': return 'Remarks';
			case 'skedmaker.subjects.subject.table.remarks.edit': return 'Edit remarks (can be empty):';
			case 'skedmaker.subjects.subject.infobar.noAvailableOffering': return ({required Object subject}) => '${subject} has no available offerings.';
			case 'skedmaker.subjects.subject.infobar.hidden': return ({required Object subject}) => '${subject} is hidden. It won\'t be included when generating schedules.';
			case 'skedmaker.subjects.empty.title': return ({required Object subject}) => '${subject} has no offerings';
			case 'skedmaker.filters.name': return 'Filters';
			case 'skedmaker.filters.categories.offerings.name': return 'Offerings';
			case 'skedmaker.filters.categories.offerings.desc': return 'Filter the offerings to include/exclude';
			case 'skedmaker.filters.categories.offerings.includeClosed.name': return 'Include closed offerings';
			case 'skedmaker.filters.categories.offerings.includeClosed.desc': return 'Enable this to ignore its status (whether it is open or closed)';
			case 'skedmaker.filters.categories.offerings.includeFullSlots.name': return 'Include offerings with full slots';
			case 'skedmaker.filters.categories.offerings.includeFullSlots.desc': return 'Enable this to ignore its slot capacity';
			case 'skedmaker.filters.categories.offerings.includeUnknownModality.name': return 'Include offerings with unknown modality';
			case 'skedmaker.filters.categories.offerings.includeNoTeachers.name': return 'Include offerings with no teachers';
			case 'skedmaker.filters.categories.offerings.excludeSectionLetter.name': return 'Exclude sections that contains the following';
			case 'skedmaker.filters.categories.offerings.excludeSectionLetter.desc': return 'Use this to exclude offerings whose section contains certain letter(s)';
			case 'skedmaker.filters.categories.offerings.includeFreshmanBlock.name': return 'Include freshman block';
			case 'skedmaker.filters.categories.day.name': return 'Day-specific';
			case 'skedmaker.filters.categories.day.desc': return 'Add specific filters for each day of the week';
			case 'skedmaker.filters.categories.day.commonMaxNumberOfSubjects.name': return 'Maximum number of subjects';
			case 'skedmaker.filters.categories.day.commonMaxNumberOfSubjects.desc': return 'Enter -1 if no limit; enter 0 if no subjects at all';
			case 'skedmaker.filters.categories.day.commonTimeInterval.name': return 'Only have subjects at this time interval';
			case 'skedmaker.filters.categories.day.commonModality.name': return 'Modality of subjects';
			case 'skedmaker.filters.categories.day.commonModality.hybrid': return 'Online or face-to-face';
			case 'skedmaker.filters.categories.day.commonModality.online': return 'Online';
			case 'skedmaker.filters.categories.day.commonModality.face': return 'Face-to-face';
			case 'skedmaker.filters.categories.day.commonModality.any': return 'Any modality';
			case 'skedmaker.filters.categories.day.commonModality.unknown': return 'Unknown modality';
			case 'skedmaker.filters.categories.day.commonStartWithSubject.name': return 'First subject of the day';
			case 'skedmaker.filters.categories.day.commonEndWithSubject.name': return 'Last subject of the day';
			case 'skedmaker.filters.categories.day.commonBreaktime.name': return 'Breaktime';
			case 'skedmaker.filters.categories.day.commonBreaktime.desc': return 'Time where there should be no subjects';
			case 'skedmaker.filters.categories.day.mondayName': return 'Monday';
			case 'skedmaker.filters.categories.day.tuesdayName': return 'Tuesday';
			case 'skedmaker.filters.categories.day.wednesdayName': return 'Wednesday';
			case 'skedmaker.filters.categories.day.thursdayName': return 'Thursday';
			case 'skedmaker.filters.categories.day.fridayName': return 'Friday';
			case 'skedmaker.filters.categories.day.saturdayName': return 'Saturday';
			case 'skedmaker.filters.categories.location.name': return 'Location (experimental)';
			case 'skedmaker.filters.categories.location.desc': return 'Filter schedules based on each offering\'s location';
			case 'skedmaker.filters.categories.location.enabled.name': return 'Enable filtering using location & distances';
			case 'skedmaker.filters.categories.location.enabled.desc': return 'This will consider the distance of: The previous class → the ground floor → \nthe ground floor of the next class → the next class. If both are on \nthe same building, this is just the distance from the previous to the next.';
			case 'skedmaker.filters.categories.location.checkingDistanceMinutes.name': return 'Time gap between subjects to check for distance (in minutes)';
			case 'skedmaker.filters.categories.location.maxAllowedDistanceMeters.name': return 'Maximum distance from one subject to the next (in meters)';
			case 'skedmaker.filters.categories.location.calculator.name': return 'Open distance calculator';
			case 'skedmaker.filters.categories.location.calculator.title': return 'Distance calculator';
			case 'skedmaker.filters.categories.location.calculator.desc': return 'Note: This is only an estimate.';
			case 'skedmaker.filters.categories.location.calculator.from': return 'From:';
			case 'skedmaker.filters.categories.location.calculator.to': return 'To:';
			case 'skedmaker.filters.categories.location.calculator.hint': return 'Room code (eg. A1105)';
			case 'skedmaker.filters.categories.location.calculator.calculate': return 'Calculate';
			case 'skedmaker.filters.categories.location.calculator.result': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: '~${n} meter',
				other: '~${n} meters',
			);
			case 'skedmaker.filters.any': return 'Any subject';
			case 'skedmaker.filters.reset': return 'Reset all';
			case 'skedmaker.schedules.name': return 'Schedules';
			case 'skedmaker.schedules.generate.title': return 'Generate possible schedules';
			case 'skedmaker.schedules.generate.button': return 'Generate';
			case 'skedmaker.schedules.generate.pending': return 'No schedules found yet. This will take some time.';
			case 'skedmaker.schedules.generate.found': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: '${n} schedule found',
				other: '${n} schedules found',
			);
			case 'skedmaker.schedules.generate.progress': return ({required Object percent}) => '${percent}% complete';
			case 'skedmaker.schedules.generate.none': return 'No schedules found. Maybe check your filters and try again.';
			case 'skedmaker.schedules.commandbar.rename.name': return 'Rename';
			case 'skedmaker.schedules.commandbar.rename.edit': return 'Enter new name';
			case 'skedmaker.schedules.commandbar.delete.name': return 'Delete';
			case 'skedmaker.schedules.commandbar.delete.desc': return ({required Object name}) => 'Delete ${name}?\nYou cannot un-delete this.\nAll tabs with this schedule will be removed.';
			case 'skedmaker.schedules.commandbar.star.star': return 'Star';
			case 'skedmaker.schedules.commandbar.star.unstar': return 'Unstar';
			case 'skedmaker.schedules.commandbar.saveImage.name': return 'Save as image';
			case 'skedmaker.schedules.commandbar.saveImage.title': return 'Save as image';
			case 'skedmaker.schedules.commandbar.saveImage.desc': return 'Resize the window to adjust the image formatting. When done, click "${_root.general.general.save}".';
			case 'skedmaker.schedules.commandbar.saveImage.credits': return ({required InlineSpanBuilder name}) => TextSpan(children: [
				const TextSpan(text: 'generated by '),
				name(_root.skedmaker.info.nameFull),
			]);
			case 'skedmaker.schedules.details.name': return 'Details';
			case 'skedmaker.schedules.details.notes': return 'Notes';
			case 'skedmaker.schedules.details.subjects': return 'Subjects';
			case 'skedmaker.schedules.info.name': return 'Info';
			case 'skedmaker.schedules.info.title': return 'Information';
			case 'skedmaker.schedules.info.desc': return 'Select a schedule from the left.\nView and compare multiple schedules by opening new tabs at the top.\n\nKeyboard shortcuts:\nUp/Down arrow key - go to next/previous schedule\nCtrl + T - create new tab\nCtrl + W or Ctrl + F4 - close current tab\nCtrl + 1 to 8 - go to first to eighth tab\nCtrl + 9 - go to last tab';
			case 'skedmaker.schedules.options.hoverEffects': return 'Enable hover effects';
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
			case 'skedmaker.scheduleDay.mondaythursdayFace.name': return 'Monday and Thursday (both face-to-face)';
			case 'skedmaker.scheduleDay.mondaythursdayFace.nameShort': return 'M & H (both f2f)';
			case 'skedmaker.scheduleDay.mondaythursdayOnline.name': return 'Monday and Thursday (both online)';
			case 'skedmaker.scheduleDay.mondaythursdayOnline.nameShort': return 'M & H (both online)';
			case 'skedmaker.scheduleDay.mondaythursdayOnlineface.name': return 'Monday (online) and Thursday (face-to-face)';
			case 'skedmaker.scheduleDay.mondaythursdayOnlineface.nameShort': return 'M (online) & H (f2f)';
			case 'skedmaker.scheduleDay.mondaythursdayFaceonline.name': return 'Monday (face-to-face) and Thursday (online)';
			case 'skedmaker.scheduleDay.mondaythursdayFaceonline.nameShort': return 'M (f2f) & H (online)';
			case 'skedmaker.scheduleDay.mondaythursdayUnknown.name': return 'Monday and Thursday';
			case 'skedmaker.scheduleDay.mondaythursdayUnknown.nameShort': return 'M & H';
			case 'skedmaker.scheduleDay.tuesdayfridayFace.name': return 'Tuesday and Friday (both face-to-face)';
			case 'skedmaker.scheduleDay.tuesdayfridayFace.nameShort': return 'T & F (both f2f)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnline.name': return 'Tuesday and Friday (both online)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnline.nameShort': return 'T & F (both online)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnlineface.name': return 'Tuesday (online) and Friday (face-to-face)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnlineface.nameShort': return 'T (online) & F (f2f)';
			case 'skedmaker.scheduleDay.tuesdayfridayFaceonline.name': return 'Tuesday (face-to-face) and Friday (online)';
			case 'skedmaker.scheduleDay.tuesdayfridayFaceonline.nameShort': return 'T (f2f) & F (online)';
			case 'skedmaker.scheduleDay.tuesdayfridayUnknown.name': return 'Tuesday and Friday';
			case 'skedmaker.scheduleDay.tuesdayfridayUnknown.nameShort': return 'T & F';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFace.name': return 'Wednesday and Saturday (both face-to-face)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFace.nameShort': return 'W & S (both f2f)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnline.name': return 'Wednesday and Saturday (both online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnline.nameShort': return 'W & S (both online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnlineface.name': return 'Wednesday (online) and Saturday (face-to-face)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayOnlineface.nameShort': return 'W (online) & S (f2f)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFaceonline.name': return 'Wednesday (face-to-face) and Saturday (online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayFaceonline.nameShort': return 'W (f2f) & S (online)';
			case 'skedmaker.scheduleDay.wednesdaysaturdayUnknown.name': return 'Wednesday and Saturday';
			case 'skedmaker.scheduleDay.wednesdaysaturdayUnknown.nameShort': return 'W & S';
			case 'skedmaker.scheduleDay.unknown.name': return 'Unknown';
			case 'skedmaker.scheduleDay.unknown.nameShort': return 'Unknown';
			case 'skedmaker.scheduleRoom.empty': return 'No room';
			case 'skedmaker.scheduleRoom.online': return 'Online';
			case 'skedmaker.scheduleRoom.hybrid': return ({required Object room}) => '${room} and online';
			case 'skedmaker.scheduleDefault.name': return ({required Object n}) => 'Schedule ${n}';
			case 'skedmaker.mlsCourseOfferings': return 'My.LaSalle\'s Course Offerings';
			case 'skedmaker.infobar.currentlyGeneratingSchedules': return 'Currently generating schedules. Changes here will not apply until you generate again.';
			default: return null;
		}
	}
}

extension on _StringsTl {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.app.name': return 'AralTools';
			case 'general.home.name': return 'Tahanan';
			case 'general.home.welcome': return 'Maligayang pagdating!';
			case 'general.home.more.title': return 'Marami pang dadating!';
			case 'general.home.more.desc': return 'Abangan! :)';
			case 'general.drawer.about.name': return 'Patungkol';
			case 'general.drawer.about.version': return ({required Object version, required Object build}) => 'Bersyon ${version} build ${build}';
			case 'general.drawer.about.copyright': return 'Karapatang-sipi (C) 2024 Yivan Andrei Padsoyan';
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

extension on _StringsTlQp {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.app.name': return 'AralTools';
			case 'general.home.name': return 'Home';
			case 'general.home.welcome': return 'Welcome!';
			case 'general.home.more.title': return 'More pa coming soon!';
			case 'general.home.more.desc': return 'Maging updated! :)';
			case 'general.drawer.about.name': return 'About';
			case 'general.drawer.about.version': return ({required Object version, required Object build}) => 'Version ${version} build ${build}';
			case 'general.drawer.about.copyright': return 'Copyright (C) 2024 Yivan Andrei Padsoyan';
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

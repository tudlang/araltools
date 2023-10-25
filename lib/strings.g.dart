/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 229 (76 per locale)
///
/// Built on 2023-10-25 at 01:46 UTC

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
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	tl(languageCode: 'tl', build: _StringsTl.build),
	tlQp(languageCode: 'tl', countryCode: 'QP', build: _StringsTlQp.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
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
_StringsEn get strings => LocaleSettings.instance.currentTranslations;

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
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.strings.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get strings => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
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
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
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
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsGeneralEn general = _StringsGeneralEn._(_root);
	late final _StringsSkedmakerEn skedmaker = _StringsSkedmakerEn._(_root);
}

// Path: general
class _StringsGeneralEn {
	_StringsGeneralEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsGeneralAppEn app = _StringsGeneralAppEn._(_root);
	late final _StringsGeneralHomeEn home = _StringsGeneralHomeEn._(_root);
	late final _StringsGeneralGeneralEn general = _StringsGeneralGeneralEn._(_root);
}

// Path: skedmaker
class _StringsSkedmakerEn {
	_StringsSkedmakerEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerInfoEn info = _StringsSkedmakerInfoEn._(_root);
	late final _StringsSkedmakerSubjectsEn subjects = _StringsSkedmakerSubjectsEn._(_root);
	late final _StringsSkedmakerFiltersEn filters = _StringsSkedmakerFiltersEn._(_root);
	late final _StringsSkedmakerSchedulesEn schedules = _StringsSkedmakerSchedulesEn._(_root);
	late final _StringsSkedmakerScheduleDayEn scheduleDay = _StringsSkedmakerScheduleDayEn._(_root);
	String get mlsCourseOfferings => 'My.LaSalle\'s Course Offerings';
}

// Path: general.app
class _StringsGeneralAppEn {
	_StringsGeneralAppEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'AralTools';
}

// Path: general.home
class _StringsGeneralHomeEn {
	_StringsGeneralHomeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Home';
	String get welcome => 'Welcome!';
}

// Path: general.general
class _StringsGeneralGeneralEn {
	_StringsGeneralGeneralEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get go => 'Go';
	String get ok => 'OK';
	String get open => 'Open';
	String get delete => 'Delete';
	String get add => 'Add';
	String get select => 'Select';
	String get save => 'Save';
	String get cancel => 'Cancel';
}

// Path: skedmaker.info
class _StringsSkedmakerInfoEn {
	_StringsSkedmakerInfoEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'SkedMaker';
	String get desc => 'The automatic class schedule maker for DLSU students';
}

// Path: skedmaker.subjects
class _StringsSkedmakerSubjectsEn {
	_StringsSkedmakerSubjectsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Subjects';
	late final _StringsSkedmakerSubjectsAddEn add = _StringsSkedmakerSubjectsAddEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectEn subject = _StringsSkedmakerSubjectsSubjectEn._(_root);
}

// Path: skedmaker.filters
class _StringsSkedmakerFiltersEn {
	_StringsSkedmakerFiltersEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Filters';
	late final _StringsSkedmakerFiltersCategoriesEn categories = _StringsSkedmakerFiltersCategoriesEn._(_root);
	String get any => 'Any subject';
}

// Path: skedmaker.schedules
class _StringsSkedmakerSchedulesEn {
	_StringsSkedmakerSchedulesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Schedules';
	late final _StringsSkedmakerSchedulesGenerateEn generate = _StringsSkedmakerSchedulesGenerateEn._(_root);
	late final _StringsSkedmakerSchedulesCommandbarEn commandbar = _StringsSkedmakerSchedulesCommandbarEn._(_root);
	late final _StringsSkedmakerSchedulesDetailsEn details = _StringsSkedmakerSchedulesDetailsEn._(_root);
	late final _StringsSkedmakerSchedulesOptionsEn options = _StringsSkedmakerSchedulesOptionsEn._(_root);
}

// Path: skedmaker.scheduleDay
class _StringsSkedmakerScheduleDayEn {
	_StringsSkedmakerScheduleDayEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

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

// Path: skedmaker.subjects.add
class _StringsSkedmakerSubjectsAddEn {
	_StringsSkedmakerSubjectsAddEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Add subject';
	late final _StringsSkedmakerSubjectsAddButtonMlsEn buttonMls = _StringsSkedmakerSubjectsAddButtonMlsEn._(_root);
	late final _StringsSkedmakerSubjectsAddButtonManualEn buttonManual = _StringsSkedmakerSubjectsAddButtonManualEn._(_root);
	late final _StringsSkedmakerSubjectsAddButtonCodeEn buttonCode = _StringsSkedmakerSubjectsAddButtonCodeEn._(_root);
}

// Path: skedmaker.subjects.subject
class _StringsSkedmakerSubjectsSubjectEn {
	_StringsSkedmakerSubjectsSubjectEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String title({required num n, required Object subject, required Object offerings, required Object available}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${subject} - ${offerings} offering (${available} available)',
		other: '${subject} - ${offerings} offerings (${available} available)',
	);
	late final _StringsSkedmakerSubjectsSubjectActionsEn actions = _StringsSkedmakerSubjectsSubjectActionsEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectTableEn table = _StringsSkedmakerSubjectsSubjectTableEn._(_root);
}

// Path: skedmaker.filters.categories
class _StringsSkedmakerFiltersCategoriesEn {
	_StringsSkedmakerFiltersCategoriesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerFiltersCategoriesOfferingsEn offerings = _StringsSkedmakerFiltersCategoriesOfferingsEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesDayEn day = _StringsSkedmakerFiltersCategoriesDayEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesLocationEn location = _StringsSkedmakerFiltersCategoriesLocationEn._(_root);
}

// Path: skedmaker.schedules.generate
class _StringsSkedmakerSchedulesGenerateEn {
	_StringsSkedmakerSchedulesGenerateEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Generate possible schedules';
	String get button => 'Generate';
	String found({required num n, required Object number}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${number} schedule found',
		other: '${number} schedules found',
	);
	String defaultName({required Object number}) => 'Schedule ${number}';
}

// Path: skedmaker.schedules.commandbar
class _StringsSkedmakerSchedulesCommandbarEn {
	_StringsSkedmakerSchedulesCommandbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerSchedulesCommandbarRenameEn rename = _StringsSkedmakerSchedulesCommandbarRenameEn._(_root);
	late final _StringsSkedmakerSchedulesCommandbarDeleteEn delete = _StringsSkedmakerSchedulesCommandbarDeleteEn._(_root);
	late final _StringsSkedmakerSchedulesCommandbarStarEn star = _StringsSkedmakerSchedulesCommandbarStarEn._(_root);
	late final _StringsSkedmakerSchedulesCommandbarSaveImageEn saveImage = _StringsSkedmakerSchedulesCommandbarSaveImageEn._(_root);
}

// Path: skedmaker.schedules.details
class _StringsSkedmakerSchedulesDetailsEn {
	_StringsSkedmakerSchedulesDetailsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get notes => 'Notes';
	String get subjects => 'Subjects';
}

// Path: skedmaker.schedules.options
class _StringsSkedmakerSchedulesOptionsEn {
	_StringsSkedmakerSchedulesOptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get hoverEffects => 'Enable hover effects';
}

// Path: skedmaker.scheduleDay.mondayFace
class _StringsSkedmakerScheduleDayMondayFaceEn {
	_StringsSkedmakerScheduleDayMondayFaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (face-to-face)';
	String get nameShort => 'M (f2f)';
}

// Path: skedmaker.scheduleDay.mondayOnline
class _StringsSkedmakerScheduleDayMondayOnlineEn {
	_StringsSkedmakerScheduleDayMondayOnlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (online)';
	String get nameShort => 'M (online)';
}

// Path: skedmaker.scheduleDay.mondayHybrid
class _StringsSkedmakerScheduleDayMondayHybridEn {
	_StringsSkedmakerScheduleDayMondayHybridEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (hybrid)';
	String get nameShort => 'M (hybrid)';
}

// Path: skedmaker.scheduleDay.mondayUnknown
class _StringsSkedmakerScheduleDayMondayUnknownEn {
	_StringsSkedmakerScheduleDayMondayUnknownEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Monday';
	String get nameShort => 'M';
}

// Path: skedmaker.scheduleDay.tuesdayFace
class _StringsSkedmakerScheduleDayTuesdayFaceEn {
	_StringsSkedmakerScheduleDayTuesdayFaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (face-to-face)';
	String get nameShort => 'T (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayOnline
class _StringsSkedmakerScheduleDayTuesdayOnlineEn {
	_StringsSkedmakerScheduleDayTuesdayOnlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (online)';
	String get nameShort => 'T (online)';
}

// Path: skedmaker.scheduleDay.tuesdayHybrid
class _StringsSkedmakerScheduleDayTuesdayHybridEn {
	_StringsSkedmakerScheduleDayTuesdayHybridEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (hybrid)';
	String get nameShort => 'T (hybrid)';
}

// Path: skedmaker.scheduleDay.tuesdayUnknown
class _StringsSkedmakerScheduleDayTuesdayUnknownEn {
	_StringsSkedmakerScheduleDayTuesdayUnknownEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday';
	String get nameShort => 'T';
}

// Path: skedmaker.scheduleDay.wednesdayFace
class _StringsSkedmakerScheduleDayWednesdayFaceEn {
	_StringsSkedmakerScheduleDayWednesdayFaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (face-to-face)';
	String get nameShort => 'W (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdayOnline
class _StringsSkedmakerScheduleDayWednesdayOnlineEn {
	_StringsSkedmakerScheduleDayWednesdayOnlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (online)';
	String get nameShort => 'W (online)';
}

// Path: skedmaker.scheduleDay.wednesdayHybrid
class _StringsSkedmakerScheduleDayWednesdayHybridEn {
	_StringsSkedmakerScheduleDayWednesdayHybridEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (hybrid)';
	String get nameShort => 'W (hybrid)';
}

// Path: skedmaker.scheduleDay.wednesdayUnknown
class _StringsSkedmakerScheduleDayWednesdayUnknownEn {
	_StringsSkedmakerScheduleDayWednesdayUnknownEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday';
	String get nameShort => 'W';
}

// Path: skedmaker.scheduleDay.thursdayFace
class _StringsSkedmakerScheduleDayThursdayFaceEn {
	_StringsSkedmakerScheduleDayThursdayFaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (face-to-face)';
	String get nameShort => 'H (f2f)';
}

// Path: skedmaker.scheduleDay.thursdayOnline
class _StringsSkedmakerScheduleDayThursdayOnlineEn {
	_StringsSkedmakerScheduleDayThursdayOnlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (online)';
	String get nameShort => 'H (online)';
}

// Path: skedmaker.scheduleDay.thursdayHybrid
class _StringsSkedmakerScheduleDayThursdayHybridEn {
	_StringsSkedmakerScheduleDayThursdayHybridEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (hybrid)';
	String get nameShort => 'H (hybrid)';
}

// Path: skedmaker.scheduleDay.thursdayUnknown
class _StringsSkedmakerScheduleDayThursdayUnknownEn {
	_StringsSkedmakerScheduleDayThursdayUnknownEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday';
	String get nameShort => 'H';
}

// Path: skedmaker.scheduleDay.fridayFace
class _StringsSkedmakerScheduleDayFridayFaceEn {
	_StringsSkedmakerScheduleDayFridayFaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Friday (face-to-face)';
	String get nameShort => 'F (f2f)';
}

// Path: skedmaker.scheduleDay.fridayOnline
class _StringsSkedmakerScheduleDayFridayOnlineEn {
	_StringsSkedmakerScheduleDayFridayOnlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Friday (online)';
	String get nameShort => 'F (online)';
}

// Path: skedmaker.scheduleDay.fridayHybrid
class _StringsSkedmakerScheduleDayFridayHybridEn {
	_StringsSkedmakerScheduleDayFridayHybridEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Friday (hybrid)';
	String get nameShort => 'F (hybrid)';
}

// Path: skedmaker.scheduleDay.fridayUnknown
class _StringsSkedmakerScheduleDayFridayUnknownEn {
	_StringsSkedmakerScheduleDayFridayUnknownEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Friday';
	String get nameShort => 'F';
}

// Path: skedmaker.scheduleDay.saturdayFace
class _StringsSkedmakerScheduleDaySaturdayFaceEn {
	_StringsSkedmakerScheduleDaySaturdayFaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday (face-to-face)';
	String get nameShort => 'S (f2f)';
}

// Path: skedmaker.scheduleDay.saturdayOnline
class _StringsSkedmakerScheduleDaySaturdayOnlineEn {
	_StringsSkedmakerScheduleDaySaturdayOnlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday (online)';
	String get nameShort => 'S (online)';
}

// Path: skedmaker.scheduleDay.saturdayHybrid
class _StringsSkedmakerScheduleDaySaturdayHybridEn {
	_StringsSkedmakerScheduleDaySaturdayHybridEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday (hybrid)';
	String get nameShort => 'S (hybrid)';
}

// Path: skedmaker.scheduleDay.saturdayUnknown
class _StringsSkedmakerScheduleDaySaturdayUnknownEn {
	_StringsSkedmakerScheduleDaySaturdayUnknownEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday';
	String get nameShort => 'S';
}

// Path: skedmaker.scheduleDay.mondaythursdayFace
class _StringsSkedmakerScheduleDayMondaythursdayFaceEn {
	_StringsSkedmakerScheduleDayMondaythursdayFaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Monday and Thursday (both face-to-face)';
	String get nameShort => 'M & H (both f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnline
class _StringsSkedmakerScheduleDayMondaythursdayOnlineEn {
	_StringsSkedmakerScheduleDayMondaythursdayOnlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Monday and Thursday (both online)';
	String get nameShort => 'M & H (both online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnlineface
class _StringsSkedmakerScheduleDayMondaythursdayOnlinefaceEn {
	_StringsSkedmakerScheduleDayMondaythursdayOnlinefaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (online) and Thursday (face-to-face)';
	String get nameShort => 'M (online) & H (f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayFaceonline
class _StringsSkedmakerScheduleDayMondaythursdayFaceonlineEn {
	_StringsSkedmakerScheduleDayMondaythursdayFaceonlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (face-to-face) and Thursday (online)';
	String get nameShort => 'M (f2f) & H (online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayUnknown
class _StringsSkedmakerScheduleDayMondaythursdayUnknownEn {
	_StringsSkedmakerScheduleDayMondaythursdayUnknownEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Monday and Thursday';
	String get nameShort => 'M & H';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFace
class _StringsSkedmakerScheduleDayTuesdayfridayFaceEn {
	_StringsSkedmakerScheduleDayTuesdayfridayFaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday and Friday (both face-to-face)';
	String get nameShort => 'T & F (both f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnline
class _StringsSkedmakerScheduleDayTuesdayfridayOnlineEn {
	_StringsSkedmakerScheduleDayTuesdayfridayOnlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday and Friday (both online)';
	String get nameShort => 'T & F (both online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnlineface
class _StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn {
	_StringsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (online) and Friday (face-to-face)';
	String get nameShort => 'T (online) & F (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFaceonline
class _StringsSkedmakerScheduleDayTuesdayfridayFaceonlineEn {
	_StringsSkedmakerScheduleDayTuesdayfridayFaceonlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (face-to-face) and Friday (online)';
	String get nameShort => 'T (f2f) & F (online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayUnknown
class _StringsSkedmakerScheduleDayTuesdayfridayUnknownEn {
	_StringsSkedmakerScheduleDayTuesdayfridayUnknownEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday and Friday';
	String get nameShort => 'T & F';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFace
class _StringsSkedmakerScheduleDayWednesdaysaturdayFaceEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayFaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday and Saturday (both face-to-face)';
	String get nameShort => 'W & S (both f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnline
class _StringsSkedmakerScheduleDayWednesdaysaturdayOnlineEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayOnlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday and Saturday (both online)';
	String get nameShort => 'W & S (both online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnlineface
class _StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (online) and Saturday (face-to-face)';
	String get nameShort => 'W (online) & S (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFaceonline
class _StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (face-to-face) and Saturday (online)';
	String get nameShort => 'W (f2f) & S (online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayUnknown
class _StringsSkedmakerScheduleDayWednesdaysaturdayUnknownEn {
	_StringsSkedmakerScheduleDayWednesdaysaturdayUnknownEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday and Saturday';
	String get nameShort => 'W & S';
}

// Path: skedmaker.scheduleDay.unknown
class _StringsSkedmakerScheduleDayUnknownEn {
	_StringsSkedmakerScheduleDayUnknownEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Unknown';
	String get nameShort => 'Unknown';
}

// Path: skedmaker.subjects.add.buttonMls
class _StringsSkedmakerSubjectsAddButtonMlsEn {
	_StringsSkedmakerSubjectsAddButtonMlsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Add from My.LaSalle';
	String get title => 'Add subject';
	String get desc => 'Enter your ID number and the subject code on the pop-up window. Once the offerings are displayed, click "Add".';
}

// Path: skedmaker.subjects.add.buttonManual
class _StringsSkedmakerSubjectsAddButtonManualEn {
	_StringsSkedmakerSubjectsAddButtonManualEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Add manually';
	String get title => 'Create new subject';
	String get desc => 'Enter a 7-character subject code:';
}

// Path: skedmaker.subjects.add.buttonCode
class _StringsSkedmakerSubjectsAddButtonCodeEn {
	_StringsSkedmakerSubjectsAddButtonCodeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Add subjects via code';
	String get desc => 'Open ${_root.skedmaker.mlsCourseOfferings} on a browser and enter your ID number and subject code as normal. Once the offerings are displayed, open the Developer Console and enter this command:\n';
	String get field => 'Copy the output and paste it here:';
	String get hint => 'The command output';
}

// Path: skedmaker.subjects.subject.actions
class _StringsSkedmakerSubjectsSubjectActionsEn {
	_StringsSkedmakerSubjectsSubjectActionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsSkedmakerSubjectsSubjectActionsRecolorEn recolor = _StringsSkedmakerSubjectsSubjectActionsRecolorEn._(_root);
	late final _StringsSkedmakerSubjectsSubjectActionsDeleteEn delete = _StringsSkedmakerSubjectsSubjectActionsDeleteEn._(_root);
	String get showhide => 'Show/Hide';
	String get offeringAdd => 'Add offering';
	String get offeringDelete => 'Delete offering';
}

// Path: skedmaker.subjects.subject.table
class _StringsSkedmakerSubjectsSubjectTableEn {
	_StringsSkedmakerSubjectsSubjectTableEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

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

// Path: skedmaker.filters.categories.offerings
class _StringsSkedmakerFiltersCategoriesOfferingsEn {
	_StringsSkedmakerFiltersCategoriesOfferingsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

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

	final _StringsEn _root; // ignore: unused_field

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

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Location (experimental)';
	String get desc => 'Filter schedules based on each offering\'s location';
	late final _StringsSkedmakerFiltersCategoriesLocationEnabledEn enabled = _StringsSkedmakerFiltersCategoriesLocationEnabledEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn checkingDistanceMinutes = _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn._(_root);
	late final _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn maxAllowedDistanceMeters = _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn._(_root);
}

// Path: skedmaker.schedules.commandbar.rename
class _StringsSkedmakerSchedulesCommandbarRenameEn {
	_StringsSkedmakerSchedulesCommandbarRenameEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Rename';
	String get edit => 'Enter new name';
}

// Path: skedmaker.schedules.commandbar.delete
class _StringsSkedmakerSchedulesCommandbarDeleteEn {
	_StringsSkedmakerSchedulesCommandbarDeleteEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Delete';
	String desc({required Object name}) => 'Delete ${name}? You cannot un-delete this. All tabs with this schedule will be removed.\n';
}

// Path: skedmaker.schedules.commandbar.star
class _StringsSkedmakerSchedulesCommandbarStarEn {
	_StringsSkedmakerSchedulesCommandbarStarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get star => 'Star';
	String get unstar => 'Unstar';
}

// Path: skedmaker.schedules.commandbar.saveImage
class _StringsSkedmakerSchedulesCommandbarSaveImageEn {
	_StringsSkedmakerSchedulesCommandbarSaveImageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Save as image';
	String get desc => 'Resize the window to adjust the image formatting. When done, click "Save".';
	String get credits => 'generated by ${_root.general.app.name} @skedmaker.info.name';
}

// Path: skedmaker.subjects.subject.actions.recolor
class _StringsSkedmakerSubjectsSubjectActionsRecolorEn {
	_StringsSkedmakerSubjectsSubjectActionsRecolorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Recolor';
	String get primary => 'Primary';
	String get wheel => 'Wheel';
	String get shades => 'Shades';
}

// Path: skedmaker.subjects.subject.actions.delete
class _StringsSkedmakerSubjectsSubjectActionsDeleteEn {
	_StringsSkedmakerSubjectsSubjectActionsDeleteEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Delete';
	String warning({required Object subject}) => 'Delete ${subject}? \nYou cannot un-delete this.';
}

// Path: skedmaker.subjects.subject.table.status
class _StringsSkedmakerSubjectsSubjectTableStatusEn {
	_StringsSkedmakerSubjectsSubjectTableStatusEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Status';
	String get open => 'Open';
	String get closed => 'Closed';
}

// Path: skedmaker.subjects.subject.table.classno
class _StringsSkedmakerSubjectsSubjectTableClassnoEn {
	_StringsSkedmakerSubjectsSubjectTableClassnoEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Class \#';
	String get edit => 'Edit class number:';
}

// Path: skedmaker.subjects.subject.table.section
class _StringsSkedmakerSubjectsSubjectTableSectionEn {
	_StringsSkedmakerSubjectsSubjectTableSectionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Section';
	String get edit => 'Edit section:';
}

// Path: skedmaker.subjects.subject.table.room
class _StringsSkedmakerSubjectsSubjectTableRoomEn {
	_StringsSkedmakerSubjectsSubjectTableRoomEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Room';
	String get edit => 'Edit room (can be empty):';
}

// Path: skedmaker.subjects.subject.table.day
class _StringsSkedmakerSubjectsSubjectTableDayEn {
	_StringsSkedmakerSubjectsSubjectTableDayEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Day';
	String get edit => 'Edit day:';
}

// Path: skedmaker.subjects.subject.table.time
class _StringsSkedmakerSubjectsSubjectTableTimeEn {
	_StringsSkedmakerSubjectsSubjectTableTimeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

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

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Teacher';
	String get edit => 'Edit teacher (can be empty):';
}

// Path: skedmaker.subjects.subject.table.slots
class _StringsSkedmakerSubjectsSubjectTableSlotsEn {
	_StringsSkedmakerSubjectsSubjectTableSlotsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

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

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Remarks';
	String get edit => 'Edit remarks (can be empty):';
}

// Path: skedmaker.filters.categories.offerings.includeClosed
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Include closed offerings';
	String get desc => 'Enable this to ignore its status (whether it is open or closed)';
}

// Path: skedmaker.filters.categories.offerings.includeFullSlots
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Include offerings with full slots';
	String get desc => 'Enable this to ignore its slot capacity';
}

// Path: skedmaker.filters.categories.offerings.includeUnknownModality
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Include offerings with unknown modality';
}

// Path: skedmaker.filters.categories.offerings.includeNoTeachers
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Include offerings with no teachers';
}

// Path: skedmaker.filters.categories.offerings.excludeSectionLetter
class _StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn {
	_StringsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Exclude sections that contains the following';
	String get desc => 'Use this to exclude offerings whose section contains certain letter(s)';
}

// Path: skedmaker.filters.categories.offerings.includeFreshmanBlock
class _StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn {
	_StringsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Include freshman block';
}

// Path: skedmaker.filters.categories.day.commonMaxNumberOfSubjects
class _StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn {
	_StringsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Maximum number of subjects';
	String get desc => 'Enter -1 if no limit; enter 0 if no subjects at all';
}

// Path: skedmaker.filters.categories.day.commonTimeInterval
class _StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn {
	_StringsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Only have subjects at this time interval';
}

// Path: skedmaker.filters.categories.day.commonModality
class _StringsSkedmakerFiltersCategoriesDayCommonModalityEn {
	_StringsSkedmakerFiltersCategoriesDayCommonModalityEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

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

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'First subject of the day';
}

// Path: skedmaker.filters.categories.day.commonEndWithSubject
class _StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn {
	_StringsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Last subject of the day';
}

// Path: skedmaker.filters.categories.day.commonBreaktime
class _StringsSkedmakerFiltersCategoriesDayCommonBreaktimeEn {
	_StringsSkedmakerFiltersCategoriesDayCommonBreaktimeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Breaktime';
	String get desc => 'Time where there should be no subjects';
}

// Path: skedmaker.filters.categories.location.enabled
class _StringsSkedmakerFiltersCategoriesLocationEnabledEn {
	_StringsSkedmakerFiltersCategoriesLocationEnabledEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Enable filtering using location & distances';
	String get desc => 'This will consider the distance of: The previous class → the ground floor → \nthe ground floor of the next class → the next class. If both are on \nthe same building, this is just the distance from the previous to the next.';
}

// Path: skedmaker.filters.categories.location.checkingDistanceMinutes
class _StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn {
	_StringsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Time gap between subjects to check for distance (in minutes)';
}

// Path: skedmaker.filters.categories.location.maxAllowedDistanceMeters
class _StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn {
	_StringsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Maximum distance from one subject to the next (in meters)';
}

// Path: <root>
class _StringsTl extends _StringsEn {

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
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

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
	@override late final _StringsGeneralGeneralTl general = _StringsGeneralGeneralTl._(_root);
}

// Path: skedmaker
class _StringsSkedmakerTl extends _StringsSkedmakerEn {
	_StringsSkedmakerTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerInfoTl info = _StringsSkedmakerInfoTl._(_root);
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
}

// Path: general.general
class _StringsGeneralGeneralTl extends _StringsGeneralGeneralEn {
	_StringsGeneralGeneralTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get go => 'Pumunta';
	@override String get ok => 'Okay';
	@override String get open => 'Buksan';
	@override String get delete => 'Ibura';
	@override String get add => 'Idagdag';
	@override String get select => 'Select';
	@override String get save => 'I-save';
	@override String get cancel => 'Kansela';
}

// Path: skedmaker.info
class _StringsSkedmakerInfoTl extends _StringsSkedmakerInfoEn {
	_StringsSkedmakerInfoTl._(_StringsTl root) : this._root = root, super._(root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get name => 'SkedMaker';
	@override String get desc => 'Ang awtomatikong paggawa ng iskedyul sa klase ng mga estudyante ng DLSU';
}

// Path: <root>
class _StringsTlQp extends _StringsEn {

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
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

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
	@override late final _StringsGeneralGeneralTlQp general = _StringsGeneralGeneralTlQp._(_root);
}

// Path: skedmaker
class _StringsSkedmakerTlQp extends _StringsSkedmakerEn {
	_StringsSkedmakerTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override late final _StringsSkedmakerInfoTlQp info = _StringsSkedmakerInfoTlQp._(_root);
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
}

// Path: general.general
class _StringsGeneralGeneralTlQp extends _StringsGeneralGeneralEn {
	_StringsGeneralGeneralTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get go => 'Go';
	@override String get ok => 'OK';
	@override String get open => 'I-open';
	@override String get delete => 'I-delete';
	@override String get add => 'I-add';
	@override String get select => 'I-select';
	@override String get save => 'I-save';
	@override String get cancel => 'I-cancel';
}

// Path: skedmaker.info
class _StringsSkedmakerInfoTlQp extends _StringsSkedmakerInfoEn {
	_StringsSkedmakerInfoTlQp._(_StringsTlQp root) : this._root = root, super._(root);

	@override final _StringsTlQp _root; // ignore: unused_field

	// Translations
	@override String get name => 'SkedMaker';
	@override String get desc => 'Ang automatic na class schedule maker para sa DLSU students';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.app.name': return 'AralTools';
			case 'general.home.name': return 'Home';
			case 'general.home.welcome': return 'Welcome!';
			case 'general.general.go': return 'Go';
			case 'general.general.ok': return 'OK';
			case 'general.general.open': return 'Open';
			case 'general.general.delete': return 'Delete';
			case 'general.general.add': return 'Add';
			case 'general.general.select': return 'Select';
			case 'general.general.save': return 'Save';
			case 'general.general.cancel': return 'Cancel';
			case 'skedmaker.info.name': return 'SkedMaker';
			case 'skedmaker.info.desc': return 'The automatic class schedule maker for DLSU students';
			case 'skedmaker.subjects.name': return 'Subjects';
			case 'skedmaker.subjects.add.title': return 'Add subject';
			case 'skedmaker.subjects.add.buttonMls.name': return 'Add from My.LaSalle';
			case 'skedmaker.subjects.add.buttonMls.title': return 'Add subject';
			case 'skedmaker.subjects.add.buttonMls.desc': return 'Enter your ID number and the subject code on the pop-up window. Once the offerings are displayed, click "Add".';
			case 'skedmaker.subjects.add.buttonManual.name': return 'Add manually';
			case 'skedmaker.subjects.add.buttonManual.title': return 'Create new subject';
			case 'skedmaker.subjects.add.buttonManual.desc': return 'Enter a 7-character subject code:';
			case 'skedmaker.subjects.add.buttonCode.name': return 'Add subjects via code';
			case 'skedmaker.subjects.add.buttonCode.desc': return 'Open ${_root.skedmaker.mlsCourseOfferings} on a browser and enter your ID number and subject code as normal. Once the offerings are displayed, open the Developer Console and enter this command:\n';
			case 'skedmaker.subjects.add.buttonCode.field': return 'Copy the output and paste it here:';
			case 'skedmaker.subjects.add.buttonCode.hint': return 'The command output';
			case 'skedmaker.subjects.subject.title': return ({required num n, required Object subject, required Object offerings, required Object available}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: '${subject} - ${offerings} offering (${available} available)',
				other: '${subject} - ${offerings} offerings (${available} available)',
			);
			case 'skedmaker.subjects.subject.actions.recolor.name': return 'Recolor';
			case 'skedmaker.subjects.subject.actions.recolor.primary': return 'Primary';
			case 'skedmaker.subjects.subject.actions.recolor.wheel': return 'Wheel';
			case 'skedmaker.subjects.subject.actions.recolor.shades': return 'Shades';
			case 'skedmaker.subjects.subject.actions.delete.name': return 'Delete';
			case 'skedmaker.subjects.subject.actions.delete.warning': return ({required Object subject}) => 'Delete ${subject}? \nYou cannot un-delete this.';
			case 'skedmaker.subjects.subject.actions.showhide': return 'Show/Hide';
			case 'skedmaker.subjects.subject.actions.offeringAdd': return 'Add offering';
			case 'skedmaker.subjects.subject.actions.offeringDelete': return 'Delete offering';
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
			case 'skedmaker.filters.any': return 'Any subject';
			case 'skedmaker.schedules.name': return 'Schedules';
			case 'skedmaker.schedules.generate.title': return 'Generate possible schedules';
			case 'skedmaker.schedules.generate.button': return 'Generate';
			case 'skedmaker.schedules.generate.found': return ({required num n, required Object number}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: '${number} schedule found',
				other: '${number} schedules found',
			);
			case 'skedmaker.schedules.generate.defaultName': return ({required Object number}) => 'Schedule ${number}';
			case 'skedmaker.schedules.commandbar.rename.name': return 'Rename';
			case 'skedmaker.schedules.commandbar.rename.edit': return 'Enter new name';
			case 'skedmaker.schedules.commandbar.delete.name': return 'Delete';
			case 'skedmaker.schedules.commandbar.delete.desc': return ({required Object name}) => 'Delete ${name}? You cannot un-delete this. All tabs with this schedule will be removed.\n';
			case 'skedmaker.schedules.commandbar.star.star': return 'Star';
			case 'skedmaker.schedules.commandbar.star.unstar': return 'Unstar';
			case 'skedmaker.schedules.commandbar.saveImage.name': return 'Save as image';
			case 'skedmaker.schedules.commandbar.saveImage.desc': return 'Resize the window to adjust the image formatting. When done, click "Save".';
			case 'skedmaker.schedules.commandbar.saveImage.credits': return 'generated by ${_root.general.app.name} @skedmaker.info.name';
			case 'skedmaker.schedules.details.notes': return 'Notes';
			case 'skedmaker.schedules.details.subjects': return 'Subjects';
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
			case 'skedmaker.scheduleDay.tuesdayfridayFace.name': return 'Thursday and Friday (both face-to-face)';
			case 'skedmaker.scheduleDay.tuesdayfridayFace.nameShort': return 'T & F (both f2f)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnline.name': return 'Thursday and Friday (both online)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnline.nameShort': return 'T & F (both online)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnlineface.name': return 'Thursday (online) and Friday (face-to-face)';
			case 'skedmaker.scheduleDay.tuesdayfridayOnlineface.nameShort': return 'T (online) & F (f2f)';
			case 'skedmaker.scheduleDay.tuesdayfridayFaceonline.name': return 'Thursday (face-to-face) and Friday (online)';
			case 'skedmaker.scheduleDay.tuesdayfridayFaceonline.nameShort': return 'T (f2f) & F (online)';
			case 'skedmaker.scheduleDay.tuesdayfridayUnknown.name': return 'Thursday and Friday';
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
			case 'skedmaker.mlsCourseOfferings': return 'My.LaSalle\'s Course Offerings';
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
			case 'general.general.go': return 'Pumunta';
			case 'general.general.ok': return 'Okay';
			case 'general.general.open': return 'Buksan';
			case 'general.general.delete': return 'Ibura';
			case 'general.general.add': return 'Idagdag';
			case 'general.general.select': return 'Select';
			case 'general.general.save': return 'I-save';
			case 'general.general.cancel': return 'Kansela';
			case 'skedmaker.info.name': return 'SkedMaker';
			case 'skedmaker.info.desc': return 'Ang awtomatikong paggawa ng iskedyul sa klase ng mga estudyante ng DLSU';
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
			case 'general.general.go': return 'Go';
			case 'general.general.ok': return 'OK';
			case 'general.general.open': return 'I-open';
			case 'general.general.delete': return 'I-delete';
			case 'general.general.add': return 'I-add';
			case 'general.general.select': return 'I-select';
			case 'general.general.save': return 'I-save';
			case 'general.general.cancel': return 'I-cancel';
			case 'skedmaker.info.name': return 'SkedMaker';
			case 'skedmaker.info.desc': return 'Ang automatic na class schedule maker para sa DLSU students';
			default: return null;
		}
	}
}

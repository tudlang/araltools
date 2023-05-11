/// Generated file. Do not edit.
///
/// Locales: 1
/// Strings: 15
///
/// Built on 2023-05-10 at 23:27 UTC

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
	en(languageCode: 'en', build: _StringsEn.build);

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
	late final _StringsSkedmakerSchedulesEn schedules = _StringsSkedmakerSchedulesEn._(_root);
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
	String get delete => 'Delete';
	String get cancel => 'Cancel';
}

// Path: skedmaker.info
class _StringsSkedmakerInfoEn {
	_StringsSkedmakerInfoEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'SkedMaker';
	String get description => 'The automatic class schedule maker for DLSU students';
}

// Path: skedmaker.subjects
class _StringsSkedmakerSubjectsEn {
	_StringsSkedmakerSubjectsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String title({required Object number}) => 'Subjects (${number})';
	String get add => 'Add';
}

// Path: skedmaker.schedules
class _StringsSkedmakerSchedulesEn {
	_StringsSkedmakerSchedulesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String title({required Object number}) => 'Possible schedules (${number})';
	String get generate => 'Generate';
	late final _StringsSkedmakerSchedulesTableEn table = _StringsSkedmakerSchedulesTableEn._(_root);
}

// Path: skedmaker.schedules.table
class _StringsSkedmakerSchedulesTableEn {
	_StringsSkedmakerSchedulesTableEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Name';
	String get days => 'Days';
	String get weight => 'Weight';
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
			case 'general.general.delete': return 'Delete';
			case 'general.general.cancel': return 'Cancel';
			case 'skedmaker.info.name': return 'SkedMaker';
			case 'skedmaker.info.description': return 'The automatic class schedule maker for DLSU students';
			case 'skedmaker.subjects.title': return ({required Object number}) => 'Subjects (${number})';
			case 'skedmaker.subjects.add': return 'Add';
			case 'skedmaker.schedules.title': return ({required Object number}) => 'Possible schedules (${number})';
			case 'skedmaker.schedules.generate': return 'Generate';
			case 'skedmaker.schedules.table.name': return 'Name';
			case 'skedmaker.schedules.table.days': return 'Days';
			case 'skedmaker.schedules.table.weight': return 'Weight';
			default: return null;
		}
	}
}

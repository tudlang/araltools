///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final strings = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsGeneralEn general = TranslationsGeneralEn.internal(_root);
	late final TranslationsSkedmakerEn skedmaker = TranslationsSkedmakerEn.internal(_root);
}

// Path: general
class TranslationsGeneralEn {
	TranslationsGeneralEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsGeneralAppEn app = TranslationsGeneralAppEn.internal(_root);
	late final TranslationsGeneralHomeEn home = TranslationsGeneralHomeEn.internal(_root);
	late final TranslationsGeneralDrawerEn drawer = TranslationsGeneralDrawerEn.internal(_root);
	late final TranslationsGeneralFunctionsEn functions = TranslationsGeneralFunctionsEn.internal(_root);
	late final TranslationsGeneralGeneralEn general = TranslationsGeneralGeneralEn.internal(_root);
}

// Path: skedmaker
class TranslationsSkedmakerEn {
	TranslationsSkedmakerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSkedmakerInfoEn info = TranslationsSkedmakerInfoEn.internal(_root);
	late final TranslationsSkedmakerDrawerEn drawer = TranslationsSkedmakerDrawerEn.internal(_root);
	late final TranslationsSkedmakerSubjectsEn subjects = TranslationsSkedmakerSubjectsEn.internal(_root);
	late final TranslationsSkedmakerFiltersEn filters = TranslationsSkedmakerFiltersEn.internal(_root);
	late final TranslationsSkedmakerSchedulesEn schedules = TranslationsSkedmakerSchedulesEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayEn scheduleDay = TranslationsSkedmakerScheduleDayEn.internal(_root);
	late final TranslationsSkedmakerScheduleRoomEn scheduleRoom = TranslationsSkedmakerScheduleRoomEn.internal(_root);
	late final TranslationsSkedmakerScheduleDefaultEn scheduleDefault = TranslationsSkedmakerScheduleDefaultEn.internal(_root);
	String get mlsCourseOfferings => 'My.LaSalle\'s Course Offerings';
	late final TranslationsSkedmakerInfobarEn infobar = TranslationsSkedmakerInfobarEn.internal(_root);
}

// Path: general.app
class TranslationsGeneralAppEn {
	TranslationsGeneralAppEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'AralTools';
}

// Path: general.home
class TranslationsGeneralHomeEn {
	TranslationsGeneralHomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Home';
	String get welcome => 'Welcome!';
	late final TranslationsGeneralHomeMoreEn more = TranslationsGeneralHomeMoreEn.internal(_root);
}

// Path: general.drawer
class TranslationsGeneralDrawerEn {
	TranslationsGeneralDrawerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsGeneralDrawerAboutEn about = TranslationsGeneralDrawerAboutEn.internal(_root);
	late final TranslationsGeneralDrawerSupportEn support = TranslationsGeneralDrawerSupportEn.internal(_root);
	late final TranslationsGeneralDrawerGithubEn github = TranslationsGeneralDrawerGithubEn.internal(_root);
	late final TranslationsGeneralDrawerBugsEn bugs = TranslationsGeneralDrawerBugsEn.internal(_root);
	late final TranslationsGeneralDrawerLanguageEn language = TranslationsGeneralDrawerLanguageEn.internal(_root);
}

// Path: general.functions
class TranslationsGeneralFunctionsEn {
	TranslationsGeneralFunctionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsGeneralFunctionsBackToHomeEn backToHome = TranslationsGeneralFunctionsBackToHomeEn.internal(_root);
	late final TranslationsGeneralFunctionsNewProjectEn newProject = TranslationsGeneralFunctionsNewProjectEn.internal(_root);
}

// Path: general.general
class TranslationsGeneralGeneralEn {
	TranslationsGeneralGeneralEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get go => 'Go';
	String get ok => 'OK';
	late final TranslationsGeneralGeneralOpenEn open = TranslationsGeneralGeneralOpenEn.internal(_root);
	String get delete => 'Delete';
	String get add => 'Add';
	String get select => 'Select';
	String get save => 'Save';
	String get saveDont => 'Don\'t save';
	late final TranslationsGeneralGeneralSaveAsEn saveAs = TranslationsGeneralGeneralSaveAsEn.internal(_root);
	String get cancel => 'Cancel';
	String get resume => 'Resume';
	String get pause => 'Pause';
	String get stop => 'Stop';
	String get close => 'Close';
	String get rename => 'Rename';
	String get copy => 'Copy';
	String get new_ => 'New';
	String get moreInfo => 'More info';
	String get proceed => 'Proceed';
	late final TranslationsGeneralGeneralDateEn date = TranslationsGeneralGeneralDateEn.internal(_root);
}

// Path: skedmaker.info
class TranslationsSkedmakerInfoEn {
	TranslationsSkedmakerInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'SkedMaker';
	String get nameFull => '${_root.general.app.name} ${_root.skedmaker.info.name}';
	String get desc => 'The automatic class schedule maker for DLSU students';
}

// Path: skedmaker.drawer
class TranslationsSkedmakerDrawerEn {
	TranslationsSkedmakerDrawerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSkedmakerDrawerFileLocationEn fileLocation = TranslationsSkedmakerDrawerFileLocationEn.internal(_root);
}

// Path: skedmaker.subjects
class TranslationsSkedmakerSubjectsEn {
	TranslationsSkedmakerSubjectsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Subjects';
	late final TranslationsSkedmakerSubjectsAddEn add = TranslationsSkedmakerSubjectsAddEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectEn subject = TranslationsSkedmakerSubjectsSubjectEn.internal(_root);
	late final TranslationsSkedmakerSubjectsEmptyEn empty = TranslationsSkedmakerSubjectsEmptyEn.internal(_root);
}

// Path: skedmaker.filters
class TranslationsSkedmakerFiltersEn {
	TranslationsSkedmakerFiltersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Filters';
	late final TranslationsSkedmakerFiltersCategoriesEn categories = TranslationsSkedmakerFiltersCategoriesEn.internal(_root);
	String get any => 'Any subject';
	String get reset => 'Reset all';
}

// Path: skedmaker.schedules
class TranslationsSkedmakerSchedulesEn {
	TranslationsSkedmakerSchedulesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Schedules';
	late final TranslationsSkedmakerSchedulesGenerateEn generate = TranslationsSkedmakerSchedulesGenerateEn.internal(_root);
	late final TranslationsSkedmakerSchedulesCommandbarEn commandbar = TranslationsSkedmakerSchedulesCommandbarEn.internal(_root);
	late final TranslationsSkedmakerSchedulesDetailsEn details = TranslationsSkedmakerSchedulesDetailsEn.internal(_root);
	late final TranslationsSkedmakerSchedulesInfoEn info = TranslationsSkedmakerSchedulesInfoEn.internal(_root);
	late final TranslationsSkedmakerSchedulesOptionsEn options = TranslationsSkedmakerSchedulesOptionsEn.internal(_root);
}

// Path: skedmaker.scheduleDay
class TranslationsSkedmakerScheduleDayEn {
	TranslationsSkedmakerScheduleDayEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSkedmakerScheduleDayMondayFaceEn mondayFace = TranslationsSkedmakerScheduleDayMondayFaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayMondayOnlineEn mondayOnline = TranslationsSkedmakerScheduleDayMondayOnlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayMondayHybridEn mondayHybrid = TranslationsSkedmakerScheduleDayMondayHybridEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayMondayUnknownEn mondayUnknown = TranslationsSkedmakerScheduleDayMondayUnknownEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayTuesdayFaceEn tuesdayFace = TranslationsSkedmakerScheduleDayTuesdayFaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayTuesdayOnlineEn tuesdayOnline = TranslationsSkedmakerScheduleDayTuesdayOnlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayTuesdayHybridEn tuesdayHybrid = TranslationsSkedmakerScheduleDayTuesdayHybridEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayTuesdayUnknownEn tuesdayUnknown = TranslationsSkedmakerScheduleDayTuesdayUnknownEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayWednesdayFaceEn wednesdayFace = TranslationsSkedmakerScheduleDayWednesdayFaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayWednesdayOnlineEn wednesdayOnline = TranslationsSkedmakerScheduleDayWednesdayOnlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayWednesdayHybridEn wednesdayHybrid = TranslationsSkedmakerScheduleDayWednesdayHybridEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayWednesdayUnknownEn wednesdayUnknown = TranslationsSkedmakerScheduleDayWednesdayUnknownEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayThursdayFaceEn thursdayFace = TranslationsSkedmakerScheduleDayThursdayFaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayThursdayOnlineEn thursdayOnline = TranslationsSkedmakerScheduleDayThursdayOnlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayThursdayHybridEn thursdayHybrid = TranslationsSkedmakerScheduleDayThursdayHybridEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayThursdayUnknownEn thursdayUnknown = TranslationsSkedmakerScheduleDayThursdayUnknownEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayFridayFaceEn fridayFace = TranslationsSkedmakerScheduleDayFridayFaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayFridayOnlineEn fridayOnline = TranslationsSkedmakerScheduleDayFridayOnlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayFridayHybridEn fridayHybrid = TranslationsSkedmakerScheduleDayFridayHybridEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayFridayUnknownEn fridayUnknown = TranslationsSkedmakerScheduleDayFridayUnknownEn.internal(_root);
	late final TranslationsSkedmakerScheduleDaySaturdayFaceEn saturdayFace = TranslationsSkedmakerScheduleDaySaturdayFaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDaySaturdayOnlineEn saturdayOnline = TranslationsSkedmakerScheduleDaySaturdayOnlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDaySaturdayHybridEn saturdayHybrid = TranslationsSkedmakerScheduleDaySaturdayHybridEn.internal(_root);
	late final TranslationsSkedmakerScheduleDaySaturdayUnknownEn saturdayUnknown = TranslationsSkedmakerScheduleDaySaturdayUnknownEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayMondaythursdayFaceEn mondaythursdayFace = TranslationsSkedmakerScheduleDayMondaythursdayFaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayMondaythursdayOnlineEn mondaythursdayOnline = TranslationsSkedmakerScheduleDayMondaythursdayOnlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceEn mondaythursdayOnlineface = TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineEn mondaythursdayFaceonline = TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayMondaythursdayUnknownEn mondaythursdayUnknown = TranslationsSkedmakerScheduleDayMondaythursdayUnknownEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayTuesdayfridayFaceEn tuesdayfridayFace = TranslationsSkedmakerScheduleDayTuesdayfridayFaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayTuesdayfridayOnlineEn tuesdayfridayOnline = TranslationsSkedmakerScheduleDayTuesdayfridayOnlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn tuesdayfridayOnlineface = TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineEn tuesdayfridayFaceonline = TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayTuesdayfridayUnknownEn tuesdayfridayUnknown = TranslationsSkedmakerScheduleDayTuesdayfridayUnknownEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceEn wednesdaysaturdayFace = TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineEn wednesdaysaturdayOnline = TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn wednesdaysaturdayOnlineface = TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn wednesdaysaturdayFaceonline = TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownEn wednesdaysaturdayUnknown = TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownEn.internal(_root);
	late final TranslationsSkedmakerScheduleDayUnknownEn unknown = TranslationsSkedmakerScheduleDayUnknownEn.internal(_root);
}

// Path: skedmaker.scheduleRoom
class TranslationsSkedmakerScheduleRoomEn {
	TranslationsSkedmakerScheduleRoomEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'No room';
	String get online => 'Online';
	String hybrid({required Object room}) => '${room} and online';
}

// Path: skedmaker.scheduleDefault
class TranslationsSkedmakerScheduleDefaultEn {
	TranslationsSkedmakerScheduleDefaultEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String name({required Object n}) => 'Schedule ${n}';
}

// Path: skedmaker.infobar
class TranslationsSkedmakerInfobarEn {
	TranslationsSkedmakerInfobarEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get currentlyGeneratingSchedules => 'Currently generating schedules. Changes here will not apply until you generate again.';
}

// Path: general.home.more
class TranslationsGeneralHomeMoreEn {
	TranslationsGeneralHomeMoreEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'More coming soon!';
	String get desc => 'Stay updated! :)';
}

// Path: general.drawer.about
class TranslationsGeneralDrawerAboutEn {
	TranslationsGeneralDrawerAboutEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'About';
	String version({required Object version, required Object build}) => 'Version ${version} build ${build}';
	String get copyright => 'Copyright (C) 2024 Yivan Padsoyan';
}

// Path: general.drawer.support
class TranslationsGeneralDrawerSupportEn {
	TranslationsGeneralDrawerSupportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Buy Me A Coffee';
	String get desc => 'Support me!';
}

// Path: general.drawer.github
class TranslationsGeneralDrawerGithubEn {
	TranslationsGeneralDrawerGithubEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'View source code';
	String get desc => 'Contribute to AralTools!';
}

// Path: general.drawer.bugs
class TranslationsGeneralDrawerBugsEn {
	TranslationsGeneralDrawerBugsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Issue tracker';
	String get desc => 'Report issues & bugs here!';
}

// Path: general.drawer.language
class TranslationsGeneralDrawerLanguageEn {
	TranslationsGeneralDrawerLanguageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String title({required Object language}) => 'Language: ${language}';
	String get tooltip => 'Change language';
}

// Path: general.functions.backToHome
class TranslationsGeneralFunctionsBackToHomeEn {
	TranslationsGeneralFunctionsBackToHomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Back to home';
	String get title => 'Go back to home?';
	String get desc => 'All unsaved data will be lost.';
}

// Path: general.functions.newProject
class TranslationsGeneralFunctionsNewProjectEn {
	TranslationsGeneralFunctionsNewProjectEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Create new project?';
	String get desc => 'All unsaved data will be lost.';
}

// Path: general.general.open
class TranslationsGeneralGeneralOpenEn {
	TranslationsGeneralGeneralOpenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get regular => 'Open';
	String get ellipsis => 'Open...';
}

// Path: general.general.saveAs
class TranslationsGeneralGeneralSaveAsEn {
	TranslationsGeneralGeneralSaveAsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get regular => 'Save as';
	String get ellipsis => 'Save as...';
}

// Path: general.general.date
class TranslationsGeneralGeneralDateEn {
	TranslationsGeneralGeneralDateEn.internal(this._root);

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
class TranslationsSkedmakerDrawerFileLocationEn {
	TranslationsSkedmakerDrawerFileLocationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'File location';
	String get empty => '-';
	String get open => 'Open file location';
}

// Path: skedmaker.subjects.add
class TranslationsSkedmakerSubjectsAddEn {
	TranslationsSkedmakerSubjectsAddEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Add subject';
	late final TranslationsSkedmakerSubjectsAddButtonMlsEn buttonMls = TranslationsSkedmakerSubjectsAddButtonMlsEn.internal(_root);
	late final TranslationsSkedmakerSubjectsAddButtonManualEn buttonManual = TranslationsSkedmakerSubjectsAddButtonManualEn.internal(_root);
	late final TranslationsSkedmakerSubjectsAddButtonCodeEn buttonCode = TranslationsSkedmakerSubjectsAddButtonCodeEn.internal(_root);
	late final TranslationsSkedmakerSubjectsAddErrorParseEn errorParse = TranslationsSkedmakerSubjectsAddErrorParseEn.internal(_root);
}

// Path: skedmaker.subjects.subject
class TranslationsSkedmakerSubjectsSubjectEn {
	TranslationsSkedmakerSubjectsSubjectEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String title({required Object subject, required Object offering, required Object available}) => '${subject} - ${offering} offerings (${available} available)';
	late final TranslationsSkedmakerSubjectsSubjectActionsEn actions = TranslationsSkedmakerSubjectsSubjectActionsEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectTableEn table = TranslationsSkedmakerSubjectsSubjectTableEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectInfobarEn infobar = TranslationsSkedmakerSubjectsSubjectInfobarEn.internal(_root);
}

// Path: skedmaker.subjects.empty
class TranslationsSkedmakerSubjectsEmptyEn {
	TranslationsSkedmakerSubjectsEmptyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String title({required Object subject}) => '${subject} has no offerings';
}

// Path: skedmaker.filters.categories
class TranslationsSkedmakerFiltersCategoriesEn {
	TranslationsSkedmakerFiltersCategoriesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSkedmakerFiltersCategoriesOfferingsEn offerings = TranslationsSkedmakerFiltersCategoriesOfferingsEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesDayEn day = TranslationsSkedmakerFiltersCategoriesDayEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesLocationEn location = TranslationsSkedmakerFiltersCategoriesLocationEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesSchedulesEn schedules = TranslationsSkedmakerFiltersCategoriesSchedulesEn.internal(_root);
}

// Path: skedmaker.schedules.generate
class TranslationsSkedmakerSchedulesGenerateEn {
	TranslationsSkedmakerSchedulesGenerateEn.internal(this._root);

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
class TranslationsSkedmakerSchedulesCommandbarEn {
	TranslationsSkedmakerSchedulesCommandbarEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSkedmakerSchedulesCommandbarRenameEn rename = TranslationsSkedmakerSchedulesCommandbarRenameEn.internal(_root);
	late final TranslationsSkedmakerSchedulesCommandbarDeleteEn delete = TranslationsSkedmakerSchedulesCommandbarDeleteEn.internal(_root);
	late final TranslationsSkedmakerSchedulesCommandbarStarEn star = TranslationsSkedmakerSchedulesCommandbarStarEn.internal(_root);
	late final TranslationsSkedmakerSchedulesCommandbarSaveImageEn saveImage = TranslationsSkedmakerSchedulesCommandbarSaveImageEn.internal(_root);
}

// Path: skedmaker.schedules.details
class TranslationsSkedmakerSchedulesDetailsEn {
	TranslationsSkedmakerSchedulesDetailsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Details';
	String get notes => 'Notes';
	String get subjects => 'Subjects';
}

// Path: skedmaker.schedules.info
class TranslationsSkedmakerSchedulesInfoEn {
	TranslationsSkedmakerSchedulesInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Info';
	String get title => 'Information';
	String get desc => 'Select a schedule from the left.\nView and compare multiple schedules by opening new tabs at the top.\n\nKeyboard shortcuts:\nUp/Down arrow key - go to next/previous schedule\nCtrl + T - create new tab\nCtrl + W or Ctrl + F4 - close current tab\nCtrl + 1 to 8 - go to first to eighth tab\nCtrl + 9 - go to last tab';
}

// Path: skedmaker.schedules.options
class TranslationsSkedmakerSchedulesOptionsEn {
	TranslationsSkedmakerSchedulesOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hoverEffects => 'Enable hover effects';
}

// Path: skedmaker.scheduleDay.mondayFace
class TranslationsSkedmakerScheduleDayMondayFaceEn {
	TranslationsSkedmakerScheduleDayMondayFaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (face-to-face)';
	String get nameShort => 'M (f2f)';
}

// Path: skedmaker.scheduleDay.mondayOnline
class TranslationsSkedmakerScheduleDayMondayOnlineEn {
	TranslationsSkedmakerScheduleDayMondayOnlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (online)';
	String get nameShort => 'M (online)';
}

// Path: skedmaker.scheduleDay.mondayHybrid
class TranslationsSkedmakerScheduleDayMondayHybridEn {
	TranslationsSkedmakerScheduleDayMondayHybridEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (hybrid)';
	String get nameShort => 'M (hybrid)';
}

// Path: skedmaker.scheduleDay.mondayUnknown
class TranslationsSkedmakerScheduleDayMondayUnknownEn {
	TranslationsSkedmakerScheduleDayMondayUnknownEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday';
	String get nameShort => 'M';
}

// Path: skedmaker.scheduleDay.tuesdayFace
class TranslationsSkedmakerScheduleDayTuesdayFaceEn {
	TranslationsSkedmakerScheduleDayTuesdayFaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (face-to-face)';
	String get nameShort => 'T (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayOnline
class TranslationsSkedmakerScheduleDayTuesdayOnlineEn {
	TranslationsSkedmakerScheduleDayTuesdayOnlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (online)';
	String get nameShort => 'T (online)';
}

// Path: skedmaker.scheduleDay.tuesdayHybrid
class TranslationsSkedmakerScheduleDayTuesdayHybridEn {
	TranslationsSkedmakerScheduleDayTuesdayHybridEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (hybrid)';
	String get nameShort => 'T (hybrid)';
}

// Path: skedmaker.scheduleDay.tuesdayUnknown
class TranslationsSkedmakerScheduleDayTuesdayUnknownEn {
	TranslationsSkedmakerScheduleDayTuesdayUnknownEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday';
	String get nameShort => 'T';
}

// Path: skedmaker.scheduleDay.wednesdayFace
class TranslationsSkedmakerScheduleDayWednesdayFaceEn {
	TranslationsSkedmakerScheduleDayWednesdayFaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (face-to-face)';
	String get nameShort => 'W (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdayOnline
class TranslationsSkedmakerScheduleDayWednesdayOnlineEn {
	TranslationsSkedmakerScheduleDayWednesdayOnlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (online)';
	String get nameShort => 'W (online)';
}

// Path: skedmaker.scheduleDay.wednesdayHybrid
class TranslationsSkedmakerScheduleDayWednesdayHybridEn {
	TranslationsSkedmakerScheduleDayWednesdayHybridEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (hybrid)';
	String get nameShort => 'W (hybrid)';
}

// Path: skedmaker.scheduleDay.wednesdayUnknown
class TranslationsSkedmakerScheduleDayWednesdayUnknownEn {
	TranslationsSkedmakerScheduleDayWednesdayUnknownEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday';
	String get nameShort => 'W';
}

// Path: skedmaker.scheduleDay.thursdayFace
class TranslationsSkedmakerScheduleDayThursdayFaceEn {
	TranslationsSkedmakerScheduleDayThursdayFaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (face-to-face)';
	String get nameShort => 'H (f2f)';
}

// Path: skedmaker.scheduleDay.thursdayOnline
class TranslationsSkedmakerScheduleDayThursdayOnlineEn {
	TranslationsSkedmakerScheduleDayThursdayOnlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (online)';
	String get nameShort => 'H (online)';
}

// Path: skedmaker.scheduleDay.thursdayHybrid
class TranslationsSkedmakerScheduleDayThursdayHybridEn {
	TranslationsSkedmakerScheduleDayThursdayHybridEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday (hybrid)';
	String get nameShort => 'H (hybrid)';
}

// Path: skedmaker.scheduleDay.thursdayUnknown
class TranslationsSkedmakerScheduleDayThursdayUnknownEn {
	TranslationsSkedmakerScheduleDayThursdayUnknownEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Thursday';
	String get nameShort => 'H';
}

// Path: skedmaker.scheduleDay.fridayFace
class TranslationsSkedmakerScheduleDayFridayFaceEn {
	TranslationsSkedmakerScheduleDayFridayFaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Friday (face-to-face)';
	String get nameShort => 'F (f2f)';
}

// Path: skedmaker.scheduleDay.fridayOnline
class TranslationsSkedmakerScheduleDayFridayOnlineEn {
	TranslationsSkedmakerScheduleDayFridayOnlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Friday (online)';
	String get nameShort => 'F (online)';
}

// Path: skedmaker.scheduleDay.fridayHybrid
class TranslationsSkedmakerScheduleDayFridayHybridEn {
	TranslationsSkedmakerScheduleDayFridayHybridEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Friday (hybrid)';
	String get nameShort => 'F (hybrid)';
}

// Path: skedmaker.scheduleDay.fridayUnknown
class TranslationsSkedmakerScheduleDayFridayUnknownEn {
	TranslationsSkedmakerScheduleDayFridayUnknownEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Friday';
	String get nameShort => 'F';
}

// Path: skedmaker.scheduleDay.saturdayFace
class TranslationsSkedmakerScheduleDaySaturdayFaceEn {
	TranslationsSkedmakerScheduleDaySaturdayFaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday (face-to-face)';
	String get nameShort => 'S (f2f)';
}

// Path: skedmaker.scheduleDay.saturdayOnline
class TranslationsSkedmakerScheduleDaySaturdayOnlineEn {
	TranslationsSkedmakerScheduleDaySaturdayOnlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday (online)';
	String get nameShort => 'S (online)';
}

// Path: skedmaker.scheduleDay.saturdayHybrid
class TranslationsSkedmakerScheduleDaySaturdayHybridEn {
	TranslationsSkedmakerScheduleDaySaturdayHybridEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday (hybrid)';
	String get nameShort => 'S (hybrid)';
}

// Path: skedmaker.scheduleDay.saturdayUnknown
class TranslationsSkedmakerScheduleDaySaturdayUnknownEn {
	TranslationsSkedmakerScheduleDaySaturdayUnknownEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Saturday';
	String get nameShort => 'S';
}

// Path: skedmaker.scheduleDay.mondaythursdayFace
class TranslationsSkedmakerScheduleDayMondaythursdayFaceEn {
	TranslationsSkedmakerScheduleDayMondaythursdayFaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday and Thursday (both face-to-face)';
	String get nameShort => 'M & H (both f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnline
class TranslationsSkedmakerScheduleDayMondaythursdayOnlineEn {
	TranslationsSkedmakerScheduleDayMondaythursdayOnlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday and Thursday (both online)';
	String get nameShort => 'M & H (both online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayOnlineface
class TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceEn {
	TranslationsSkedmakerScheduleDayMondaythursdayOnlinefaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (online) and Thursday (face-to-face)';
	String get nameShort => 'M (online) & H (f2f)';
}

// Path: skedmaker.scheduleDay.mondaythursdayFaceonline
class TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineEn {
	TranslationsSkedmakerScheduleDayMondaythursdayFaceonlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday (face-to-face) and Thursday (online)';
	String get nameShort => 'M (f2f) & H (online)';
}

// Path: skedmaker.scheduleDay.mondaythursdayUnknown
class TranslationsSkedmakerScheduleDayMondaythursdayUnknownEn {
	TranslationsSkedmakerScheduleDayMondaythursdayUnknownEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Monday and Thursday';
	String get nameShort => 'M & H';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFace
class TranslationsSkedmakerScheduleDayTuesdayfridayFaceEn {
	TranslationsSkedmakerScheduleDayTuesdayfridayFaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday and Friday (both face-to-face)';
	String get nameShort => 'T & F (both f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnline
class TranslationsSkedmakerScheduleDayTuesdayfridayOnlineEn {
	TranslationsSkedmakerScheduleDayTuesdayfridayOnlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday and Friday (both online)';
	String get nameShort => 'T & F (both online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayOnlineface
class TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn {
	TranslationsSkedmakerScheduleDayTuesdayfridayOnlinefaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (online) and Friday (face-to-face)';
	String get nameShort => 'T (online) & F (f2f)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayFaceonline
class TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineEn {
	TranslationsSkedmakerScheduleDayTuesdayfridayFaceonlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday (face-to-face) and Friday (online)';
	String get nameShort => 'T (f2f) & F (online)';
}

// Path: skedmaker.scheduleDay.tuesdayfridayUnknown
class TranslationsSkedmakerScheduleDayTuesdayfridayUnknownEn {
	TranslationsSkedmakerScheduleDayTuesdayfridayUnknownEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tuesday and Friday';
	String get nameShort => 'T & F';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFace
class TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceEn {
	TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday and Saturday (both face-to-face)';
	String get nameShort => 'W & S (both f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnline
class TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineEn {
	TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday and Saturday (both online)';
	String get nameShort => 'W & S (both online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayOnlineface
class TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn {
	TranslationsSkedmakerScheduleDayWednesdaysaturdayOnlinefaceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (online) and Saturday (face-to-face)';
	String get nameShort => 'W (online) & S (f2f)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayFaceonline
class TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn {
	TranslationsSkedmakerScheduleDayWednesdaysaturdayFaceonlineEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday (face-to-face) and Saturday (online)';
	String get nameShort => 'W (f2f) & S (online)';
}

// Path: skedmaker.scheduleDay.wednesdaysaturdayUnknown
class TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownEn {
	TranslationsSkedmakerScheduleDayWednesdaysaturdayUnknownEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Wednesday and Saturday';
	String get nameShort => 'W & S';
}

// Path: skedmaker.scheduleDay.unknown
class TranslationsSkedmakerScheduleDayUnknownEn {
	TranslationsSkedmakerScheduleDayUnknownEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Unknown';
	String get nameShort => 'Unknown';
}

// Path: skedmaker.subjects.add.buttonMls
class TranslationsSkedmakerSubjectsAddButtonMlsEn {
	TranslationsSkedmakerSubjectsAddButtonMlsEn.internal(this._root);

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
class TranslationsSkedmakerSubjectsAddButtonManualEn {
	TranslationsSkedmakerSubjectsAddButtonManualEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Add manually';
	String get title => 'Create new subject';
	String get desc => 'Enter a 7-character subject code:';
}

// Path: skedmaker.subjects.add.buttonCode
class TranslationsSkedmakerSubjectsAddButtonCodeEn {
	TranslationsSkedmakerSubjectsAddButtonCodeEn.internal(this._root);

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
	String get consoleWarning => 'Only do this if you know what you\'re doing. Do not enter random code into the browser console.';
}

// Path: skedmaker.subjects.add.errorParse
class TranslationsSkedmakerSubjectsAddErrorParseEn {
	TranslationsSkedmakerSubjectsAddErrorParseEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Error while parsing';
	String get messagebox => 'The following offerings cannot be parsed.';
	String get footer => 'Proceeding will discard all of these offerings.';
}

// Path: skedmaker.subjects.subject.actions
class TranslationsSkedmakerSubjectsSubjectActionsEn {
	TranslationsSkedmakerSubjectsSubjectActionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSkedmakerSubjectsSubjectActionsRecolorEn recolor = TranslationsSkedmakerSubjectsSubjectActionsRecolorEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectActionsDeleteEn delete = TranslationsSkedmakerSubjectsSubjectActionsDeleteEn.internal(_root);
	String get showhide => 'Show/Hide';
	String get offeringAdd => 'Add offering';
	late final TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteEn offeringDelete = TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteEn.internal(_root);
	String get offeringCloseAll => 'Close all offerings';
	String get offeringOpenAll => 'Open all offerings';
}

// Path: skedmaker.subjects.subject.table
class TranslationsSkedmakerSubjectsSubjectTableEn {
	TranslationsSkedmakerSubjectsSubjectTableEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSkedmakerSubjectsSubjectTableStatusEn status = TranslationsSkedmakerSubjectsSubjectTableStatusEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectTableClassnoEn classno = TranslationsSkedmakerSubjectsSubjectTableClassnoEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectTableSectionEn section = TranslationsSkedmakerSubjectsSubjectTableSectionEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectTableRoomEn room = TranslationsSkedmakerSubjectsSubjectTableRoomEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectTableDayEn day = TranslationsSkedmakerSubjectsSubjectTableDayEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectTableTimeEn time = TranslationsSkedmakerSubjectsSubjectTableTimeEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectTableTeacherEn teacher = TranslationsSkedmakerSubjectsSubjectTableTeacherEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectTableSlotsEn slots = TranslationsSkedmakerSubjectsSubjectTableSlotsEn.internal(_root);
	late final TranslationsSkedmakerSubjectsSubjectTableRemarksEn remarks = TranslationsSkedmakerSubjectsSubjectTableRemarksEn.internal(_root);
}

// Path: skedmaker.subjects.subject.infobar
class TranslationsSkedmakerSubjectsSubjectInfobarEn {
	TranslationsSkedmakerSubjectsSubjectInfobarEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String noAvailableOffering({required Object subject}) => '${subject} has no available offerings.';
	String hidden({required Object subject}) => '${subject} is hidden. It won\'t be included when generating schedules.';
}

// Path: skedmaker.filters.categories.offerings
class TranslationsSkedmakerFiltersCategoriesOfferingsEn {
	TranslationsSkedmakerFiltersCategoriesOfferingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Offerings';
	String get desc => 'Filter the offerings to include/exclude';
	late final TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn includeClosed = TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn includeFullSlots = TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn includeUnknownModality = TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn includeNoTeachers = TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoRoomEn includeNoRoom = TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoRoomEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn excludeSectionLetter = TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterEn excludeRemarksLetter = TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn includeFreshmanBlock = TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn.internal(_root);
}

// Path: skedmaker.filters.categories.day
class TranslationsSkedmakerFiltersCategoriesDayEn {
	TranslationsSkedmakerFiltersCategoriesDayEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Day-specific';
	String get desc => 'Add specific filters for each day of the week';
	late final TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn commonMaxNumberOfSubjects = TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn commonTimeInterval = TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesDayCommonModalityEn commonModality = TranslationsSkedmakerFiltersCategoriesDayCommonModalityEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn commonStartWithSubject = TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn commonEndWithSubject = TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeEn commonBreaktime = TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeEn.internal(_root);
	String get mondayName => 'Monday';
	String get tuesdayName => 'Tuesday';
	String get wednesdayName => 'Wednesday';
	String get thursdayName => 'Thursday';
	String get fridayName => 'Friday';
	String get saturdayName => 'Saturday';
}

// Path: skedmaker.filters.categories.location
class TranslationsSkedmakerFiltersCategoriesLocationEn {
	TranslationsSkedmakerFiltersCategoriesLocationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Location (experimental)';
	String get desc => 'Filter schedules based on each offering\'s location';
	late final TranslationsSkedmakerFiltersCategoriesLocationEnabledEn enabled = TranslationsSkedmakerFiltersCategoriesLocationEnabledEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn checkingDistanceMinutes = TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn maxAllowedDistanceMeters = TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesLocationCalculatorEn calculator = TranslationsSkedmakerFiltersCategoriesLocationCalculatorEn.internal(_root);
}

// Path: skedmaker.filters.categories.schedules
class TranslationsSkedmakerFiltersCategoriesSchedulesEn {
	TranslationsSkedmakerFiltersCategoriesSchedulesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Schedules';
	late final TranslationsSkedmakerFiltersCategoriesSchedulesConflictCheckerEn conflictChecker = TranslationsSkedmakerFiltersCategoriesSchedulesConflictCheckerEn.internal(_root);
	late final TranslationsSkedmakerFiltersCategoriesSchedulesSameSectionEn sameSection = TranslationsSkedmakerFiltersCategoriesSchedulesSameSectionEn.internal(_root);
}

// Path: skedmaker.schedules.commandbar.rename
class TranslationsSkedmakerSchedulesCommandbarRenameEn {
	TranslationsSkedmakerSchedulesCommandbarRenameEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Rename';
	String get edit => 'Enter new name';
}

// Path: skedmaker.schedules.commandbar.delete
class TranslationsSkedmakerSchedulesCommandbarDeleteEn {
	TranslationsSkedmakerSchedulesCommandbarDeleteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Delete';
	String desc({required Object name}) => 'Delete ${name}?\nYou cannot un-delete this.\nAll tabs with this schedule will be removed.';
}

// Path: skedmaker.schedules.commandbar.star
class TranslationsSkedmakerSchedulesCommandbarStarEn {
	TranslationsSkedmakerSchedulesCommandbarStarEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get star => 'Star';
	String get unstar => 'Unstar';
}

// Path: skedmaker.schedules.commandbar.saveImage
class TranslationsSkedmakerSchedulesCommandbarSaveImageEn {
	TranslationsSkedmakerSchedulesCommandbarSaveImageEn.internal(this._root);

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
class TranslationsSkedmakerSubjectsSubjectActionsRecolorEn {
	TranslationsSkedmakerSubjectsSubjectActionsRecolorEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Recolor';
	String get title => 'Select color';
	String get primary => 'Primary';
	String get wheel => 'Wheel';
	String get shades => 'Shades';
}

// Path: skedmaker.subjects.subject.actions.delete
class TranslationsSkedmakerSubjectsSubjectActionsDeleteEn {
	TranslationsSkedmakerSubjectsSubjectActionsDeleteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Delete';
	String warning({required Object subject}) => 'Delete ${subject}? \nYou cannot un-delete this.';
}

// Path: skedmaker.subjects.subject.actions.offeringDelete
class TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteEn {
	TranslationsSkedmakerSubjectsSubjectActionsOfferingDeleteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Delete offering';
	String get warning => 'Delete this offering? \nYou cannot un-delete this.';
}

// Path: skedmaker.subjects.subject.table.status
class TranslationsSkedmakerSubjectsSubjectTableStatusEn {
	TranslationsSkedmakerSubjectsSubjectTableStatusEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Status';
	String get open => 'Open';
	String get closed => 'Closed';
}

// Path: skedmaker.subjects.subject.table.classno
class TranslationsSkedmakerSubjectsSubjectTableClassnoEn {
	TranslationsSkedmakerSubjectsSubjectTableClassnoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Class \#';
	String get edit => 'Edit class number:';
}

// Path: skedmaker.subjects.subject.table.section
class TranslationsSkedmakerSubjectsSubjectTableSectionEn {
	TranslationsSkedmakerSubjectsSubjectTableSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Section';
	String get edit => 'Edit section:';
}

// Path: skedmaker.subjects.subject.table.room
class TranslationsSkedmakerSubjectsSubjectTableRoomEn {
	TranslationsSkedmakerSubjectsSubjectTableRoomEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Room';
	String get edit => 'Edit room (can be empty):';
}

// Path: skedmaker.subjects.subject.table.day
class TranslationsSkedmakerSubjectsSubjectTableDayEn {
	TranslationsSkedmakerSubjectsSubjectTableDayEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Day';
	String get edit => 'Edit day:';
}

// Path: skedmaker.subjects.subject.table.time
class TranslationsSkedmakerSubjectsSubjectTableTimeEn {
	TranslationsSkedmakerSubjectsSubjectTableTimeEn.internal(this._root);

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
class TranslationsSkedmakerSubjectsSubjectTableTeacherEn {
	TranslationsSkedmakerSubjectsSubjectTableTeacherEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Teacher';
	String get edit => 'Edit teacher (can be empty):';
}

// Path: skedmaker.subjects.subject.table.slots
class TranslationsSkedmakerSubjectsSubjectTableSlotsEn {
	TranslationsSkedmakerSubjectsSubjectTableSlotsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Slots';
	String data({required Object taken, required Object capacity}) => '${taken} / ${capacity}';
	String percent({required Object percent}) => '${percent}%';
	String get edit => 'Edit slots:';
	String get outOf => ' out of ';
}

// Path: skedmaker.subjects.subject.table.remarks
class TranslationsSkedmakerSubjectsSubjectTableRemarksEn {
	TranslationsSkedmakerSubjectsSubjectTableRemarksEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Remarks';
	String get edit => 'Edit remarks (can be empty):';
}

// Path: skedmaker.filters.categories.offerings.includeClosed
class TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn {
	TranslationsSkedmakerFiltersCategoriesOfferingsIncludeClosedEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include closed offerings';
	String get desc => 'Enable this to ignore its status (whether it is open or closed)';
}

// Path: skedmaker.filters.categories.offerings.includeFullSlots
class TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn {
	TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFullSlotsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include offerings with full slots';
	String get desc => 'Enable this to ignore its slot capacity';
}

// Path: skedmaker.filters.categories.offerings.includeUnknownModality
class TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn {
	TranslationsSkedmakerFiltersCategoriesOfferingsIncludeUnknownModalityEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include offerings with unknown modality';
}

// Path: skedmaker.filters.categories.offerings.includeNoTeachers
class TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn {
	TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoTeachersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include offerings with no teacher';
}

// Path: skedmaker.filters.categories.offerings.includeNoRoom
class TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoRoomEn {
	TranslationsSkedmakerFiltersCategoriesOfferingsIncludeNoRoomEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include offerings with no room';
}

// Path: skedmaker.filters.categories.offerings.excludeSectionLetter
class TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn {
	TranslationsSkedmakerFiltersCategoriesOfferingsExcludeSectionLetterEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Exclude sections that contains the following';
	String get desc => 'Use this to exclude offerings whose section contains certain letter(s)';
}

// Path: skedmaker.filters.categories.offerings.excludeRemarksLetter
class TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterEn {
	TranslationsSkedmakerFiltersCategoriesOfferingsExcludeRemarksLetterEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Exclude remarks that contains the following';
	String get desc => 'Use this to exclude offerings whose remarks contains certain letter(s)';
}

// Path: skedmaker.filters.categories.offerings.includeFreshmanBlock
class TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn {
	TranslationsSkedmakerFiltersCategoriesOfferingsIncludeFreshmanBlockEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Include freshman block';
}

// Path: skedmaker.filters.categories.day.commonMaxNumberOfSubjects
class TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn {
	TranslationsSkedmakerFiltersCategoriesDayCommonMaxNumberOfSubjectsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Maximum number of subjects';
	String get desc => 'Enter -1 if no limit; enter 0 if no subjects at all';
}

// Path: skedmaker.filters.categories.day.commonTimeInterval
class TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn {
	TranslationsSkedmakerFiltersCategoriesDayCommonTimeIntervalEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Only have subjects at this time interval';
}

// Path: skedmaker.filters.categories.day.commonModality
class TranslationsSkedmakerFiltersCategoriesDayCommonModalityEn {
	TranslationsSkedmakerFiltersCategoriesDayCommonModalityEn.internal(this._root);

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
class TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn {
	TranslationsSkedmakerFiltersCategoriesDayCommonStartWithSubjectEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'First subject of the day';
}

// Path: skedmaker.filters.categories.day.commonEndWithSubject
class TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn {
	TranslationsSkedmakerFiltersCategoriesDayCommonEndWithSubjectEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Last subject of the day';
}

// Path: skedmaker.filters.categories.day.commonBreaktime
class TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeEn {
	TranslationsSkedmakerFiltersCategoriesDayCommonBreaktimeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Breaktime';
	String get desc => 'Time where there should be no subjects';
}

// Path: skedmaker.filters.categories.location.enabled
class TranslationsSkedmakerFiltersCategoriesLocationEnabledEn {
	TranslationsSkedmakerFiltersCategoriesLocationEnabledEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Enable filtering using location & distances';
	String get desc => 'This will consider the distance of: The previous class → the ground floor → \nthe ground floor of the next class → the next class. If both are on \nthe same building, this is just the distance from the previous to the next.';
}

// Path: skedmaker.filters.categories.location.checkingDistanceMinutes
class TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn {
	TranslationsSkedmakerFiltersCategoriesLocationCheckingDistanceMinutesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Time gap between subjects to check for distance (in minutes)';
}

// Path: skedmaker.filters.categories.location.maxAllowedDistanceMeters
class TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn {
	TranslationsSkedmakerFiltersCategoriesLocationMaxAllowedDistanceMetersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Maximum distance from one subject to the next (in meters)';
}

// Path: skedmaker.filters.categories.location.calculator
class TranslationsSkedmakerFiltersCategoriesLocationCalculatorEn {
	TranslationsSkedmakerFiltersCategoriesLocationCalculatorEn.internal(this._root);

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

// Path: skedmaker.filters.categories.schedules.conflictChecker
class TranslationsSkedmakerFiltersCategoriesSchedulesConflictCheckerEn {
	TranslationsSkedmakerFiltersCategoriesSchedulesConflictCheckerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Enable conflict checker';
	String get desc => 'Disable this if you want offerings to conflict & overlap with each other.';
}

// Path: skedmaker.filters.categories.schedules.sameSection
class TranslationsSkedmakerFiltersCategoriesSchedulesSameSectionEn {
	TranslationsSkedmakerFiltersCategoriesSchedulesSameSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Create schedules with the same section for all subjects';
	String get desc => 'Useful for the management of schedules.';
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
			case 'general.drawer.about.copyright': return 'Copyright (C) 2024 Yivan Padsoyan';
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
			case 'general.general.moreInfo': return 'More info';
			case 'general.general.proceed': return 'Proceed';
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
			case 'skedmaker.subjects.add.buttonCode.consoleWarning': return 'Only do this if you know what you\'re doing. Do not enter random code into the browser console.';
			case 'skedmaker.subjects.add.errorParse.title': return 'Error while parsing';
			case 'skedmaker.subjects.add.errorParse.messagebox': return 'The following offerings cannot be parsed.';
			case 'skedmaker.subjects.add.errorParse.footer': return 'Proceeding will discard all of these offerings.';
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
			case 'skedmaker.subjects.subject.actions.offeringCloseAll': return 'Close all offerings';
			case 'skedmaker.subjects.subject.actions.offeringOpenAll': return 'Open all offerings';
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
			case 'skedmaker.filters.categories.offerings.includeNoTeachers.name': return 'Include offerings with no teacher';
			case 'skedmaker.filters.categories.offerings.includeNoRoom.name': return 'Include offerings with no room';
			case 'skedmaker.filters.categories.offerings.excludeSectionLetter.name': return 'Exclude sections that contains the following';
			case 'skedmaker.filters.categories.offerings.excludeSectionLetter.desc': return 'Use this to exclude offerings whose section contains certain letter(s)';
			case 'skedmaker.filters.categories.offerings.excludeRemarksLetter.name': return 'Exclude remarks that contains the following';
			case 'skedmaker.filters.categories.offerings.excludeRemarksLetter.desc': return 'Use this to exclude offerings whose remarks contains certain letter(s)';
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
			case 'skedmaker.filters.categories.schedules.name': return 'Schedules';
			case 'skedmaker.filters.categories.schedules.conflictChecker.name': return 'Enable conflict checker';
			case 'skedmaker.filters.categories.schedules.conflictChecker.desc': return 'Disable this if you want offerings to conflict & overlap with each other.';
			case 'skedmaker.filters.categories.schedules.sameSection.name': return 'Create schedules with the same section for all subjects';
			case 'skedmaker.filters.categories.schedules.sameSection.desc': return 'Useful for the management of schedules.';
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


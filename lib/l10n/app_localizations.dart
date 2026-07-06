import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('ur')
  ];

  /// Title of the Application
  ///
  /// In en, this message translates to:
  /// **'First Notes App'**
  String get appTitle;

  /// Title for Home Screen
  ///
  /// In en, this message translates to:
  /// **'My Notes'**
  String get homeTitle;

  /// Title for Details Screen
  ///
  /// In en, this message translates to:
  /// **'Note Details'**
  String get detailsTitle;

  /// Title for Note Screen
  ///
  /// In en, this message translates to:
  /// **'New Note'**
  String get noteTitle;

  /// Empty Message for All Tab
  ///
  /// In en, this message translates to:
  /// **'No Notes Made Yet'**
  String get allEmptyMessage;

  /// Empty Message for High Tab
  ///
  /// In en, this message translates to:
  /// **'No High Priority Notes'**
  String get highEmptyMessage;

  /// Empty Message for Medium Tab
  ///
  /// In en, this message translates to:
  /// **'No Medium Priority Notes'**
  String get mediumEmptyMessage;

  /// No description provided for @lowEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'No Low Priority Notes'**
  String get lowEmptyMessage;

  /// Tool Tip Text for Floating Action Button
  ///
  /// In en, this message translates to:
  /// **'Add New Note'**
  String get fabToolTip;

  /// Text for the Title TextField Header/Title
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleTextField;

  /// Text for the Description TextField Header/Title
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionTextField;

  /// Text for the Create Note Button in note_screen.dart
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get createNoteButton;

  /// Text for the Save Note Button in details_screen.dart
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveNoteButton;

  /// Text for Low Priority
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get lowPriority;

  /// Text for Medium Priority
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get mediumPriority;

  /// Text for High Priority
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get highPriority;

  /// Text for All Tab Title
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allTabTitle;

  /// Text for High Tab Title
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get highTabTitle;

  /// Text for Medium Tab Title
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get mediumTabTitle;

  /// Text for Low Tab Title
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get lowTabTitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'ur': return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

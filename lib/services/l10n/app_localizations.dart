import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('en'),
    Locale('ru'),
    Locale('uz')
  ];

  /// No description provided for @str_quizzly.
  ///
  /// In en, this message translates to:
  /// **'QUIZZLY'**
  String get str_quizzly;

  /// No description provided for @str_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Quizzly'**
  String get str_welcome;

  /// No description provided for @str_with.
  ///
  /// In en, this message translates to:
  /// **'With Quizzly, you can improve\nyour thinking, intelligence and\nlogical skills.'**
  String get str_with;

  /// No description provided for @str_choose.
  ///
  /// In en, this message translates to:
  /// **'Choose the appropriate level'**
  String get str_choose;

  /// No description provided for @str_level1.
  ///
  /// In en, this message translates to:
  /// **'Level 1'**
  String get str_level1;

  /// No description provided for @str_level2.
  ///
  /// In en, this message translates to:
  /// **'Level 2'**
  String get str_level2;

  /// No description provided for @str_level3.
  ///
  /// In en, this message translates to:
  /// **'Level 3'**
  String get str_level3;

  /// No description provided for @str_score.
  ///
  /// In en, this message translates to:
  /// **'Your Score'**
  String get str_score;

  /// No description provided for @str_correct.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get str_correct;

  /// No description provided for @str_wrong.
  ///
  /// In en, this message translates to:
  /// **'Wrong'**
  String get str_wrong;

  /// No description provided for @str_play.
  ///
  /// In en, this message translates to:
  /// **'Play again'**
  String get str_play;

  /// No description provided for @str_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get str_home;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
    case 'uz': return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

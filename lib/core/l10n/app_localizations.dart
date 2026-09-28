import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @news_app.
  ///
  /// In en, this message translates to:
  /// **'News App'**
  String get news_app;

  /// No description provided for @go_to_home.
  ///
  /// In en, this message translates to:
  /// **'Go To Home'**
  String get go_to_home;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @good_morning_news.
  ///
  /// In en, this message translates to:
  /// **'Good Morning \nHere is Some News For You'**
  String get good_morning_news;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @by_author.
  ///
  /// In en, this message translates to:
  /// **'By: {author}'**
  String by_author(String author);

  /// No description provided for @article.
  ///
  /// In en, this message translates to:
  /// **'Article'**
  String get article;

  /// No description provided for @view_full_article.
  ///
  /// In en, this message translates to:
  /// **'View Full Article'**
  String get view_full_article;

  /// No description provided for @no_additional_content.
  ///
  /// In en, this message translates to:
  /// **'No additional content available.'**
  String get no_additional_content;

  /// No description provided for @could_not_open_article.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open the article: {error}'**
  String could_not_open_article(String error);

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @start_typing_to_search.
  ///
  /// In en, this message translates to:
  /// **'Start typing to search for news'**
  String get start_typing_to_search;

  /// No description provided for @no_results_found.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get no_results_found;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get something_went_wrong;

  /// No description provided for @supervised_by.
  ///
  /// In en, this message translates to:
  /// **'Supervised by Mohamed Monge'**
  String get supervised_by;

  /// No description provided for @category_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get category_general;

  /// No description provided for @category_business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get category_business;

  /// No description provided for @category_sports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get category_sports;

  /// No description provided for @category_health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get category_health;

  /// No description provided for @category_entertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get category_entertainment;

  /// No description provided for @category_technology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get category_technology;

  /// No description provided for @category_science.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get category_science;

  /// No description provided for @seconds_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} seconds ago'**
  String seconds_ago(int count);

  /// No description provided for @minutes_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} minutes ago'**
  String minutes_ago(int count);

  /// No description provided for @hours_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} hours ago'**
  String hours_ago(int count);

  /// No description provided for @days_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String days_ago(int count);

  /// No description provided for @weeks_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} weeks ago'**
  String weeks_ago(int count);

  /// No description provided for @months_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} months ago'**
  String months_ago(int count);

  /// No description provided for @years_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} years ago'**
  String years_ago(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

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
    Locale('en'),
    Locale('tr')
  ];

  /// Home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home_page_title;

  /// Home greeting label
  ///
  /// In en, this message translates to:
  /// **'Hi, plant lover!'**
  String get home_greeting_label;

  /// Home greeting title
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon! ⛅'**
  String get home_greeting_title;

  /// Home search input hint
  ///
  /// In en, this message translates to:
  /// **'Search for plants'**
  String get home_search_hint;

  /// Home premium banner title
  ///
  /// In en, this message translates to:
  /// **'FREE Premium Available'**
  String get home_premium_title;

  /// Home premium banner subtitle
  ///
  /// In en, this message translates to:
  /// **'Tap to upgrade your account!'**
  String get home_premium_subtitle;

  /// Home bottom navigation home label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home_nav_home;

  /// Home bottom navigation diagnose label
  ///
  /// In en, this message translates to:
  /// **'Diagnose'**
  String get home_nav_diagnose;

  /// Home bottom navigation garden label
  ///
  /// In en, this message translates to:
  /// **'My Garden'**
  String get home_nav_garden;

  /// Home bottom navigation profile label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get home_nav_profile;

  /// Paywall screen title
  ///
  /// In en, this message translates to:
  /// **'{appName} Premium'**
  String paywall_title(String appName);

  /// Paywall screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Access All Features'**
  String get paywall_subtitle;

  /// Paywall primary action button label
  ///
  /// In en, this message translates to:
  /// **'Try free for 3 days'**
  String get paywall_try_free_button;

  /// Paywall free trial renewal disclosure
  ///
  /// In en, this message translates to:
  /// **'After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable'**
  String get paywall_trial_note;

  /// Paywall terms link label
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get paywall_terms;

  /// Paywall privacy link label
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get paywall_privacy;

  /// Paywall restore link label
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get paywall_restore;

  /// Paywall unlimited feature title
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get paywall_feature_unlimited_title;

  /// Paywall unlimited feature subtitle
  ///
  /// In en, this message translates to:
  /// **'Plant Identify'**
  String get paywall_feature_unlimited_subtitle;

  /// Paywall faster feature title
  ///
  /// In en, this message translates to:
  /// **'Faster'**
  String get paywall_feature_faster_title;

  /// Paywall faster feature subtitle
  ///
  /// In en, this message translates to:
  /// **'Process'**
  String get paywall_feature_faster_subtitle;

  /// Paywall monthly plan title
  ///
  /// In en, this message translates to:
  /// **'1 Month'**
  String get paywall_monthly_title;

  /// Paywall monthly plan subtitle
  ///
  /// In en, this message translates to:
  /// **'\$2.99/month, auto renewable'**
  String get paywall_monthly_subtitle;

  /// Paywall yearly plan title
  ///
  /// In en, this message translates to:
  /// **'1 Year'**
  String get paywall_yearly_title;

  /// Paywall yearly plan subtitle
  ///
  /// In en, this message translates to:
  /// **'First 3 days free, then \$529,99/year'**
  String get paywall_yearly_subtitle;

  /// Paywall yearly plan discount badge
  ///
  /// In en, this message translates to:
  /// **'Save 50%'**
  String get paywall_yearly_badge;

  /// Get started screen title
  ///
  /// In en, this message translates to:
  /// **'Welcome to {appName}'**
  String get_started_title(String appName);

  /// Get started screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Identify more than 3000+ plants and 88% accuracy.'**
  String get get_started_subtitle;

  /// Get started button label
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started_button;

  /// Prefix text before legal links on get started screen
  ///
  /// In en, this message translates to:
  /// **'By tapping next, you are agreeing to PlantID'**
  String get get_started_terms_prefix;

  /// Terms of use link label
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get get_started_terms_of_use;

  /// Privacy policy link label
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get get_started_privacy_policy;

  /// First onboarding title text before highlighted word
  ///
  /// In en, this message translates to:
  /// **'Take a photo to '**
  String get onboarding_first_title_prefix;

  /// Highlighted word in first onboarding title
  ///
  /// In en, this message translates to:
  /// **'identify'**
  String get onboarding_first_title_highlight;

  /// First onboarding title text after highlighted word
  ///
  /// In en, this message translates to:
  /// **' the plant!'**
  String get onboarding_first_title_suffix;

  /// Second onboarding title text before highlighted word
  ///
  /// In en, this message translates to:
  /// **'Get plant '**
  String get onboarding_second_title_prefix;

  /// Highlighted word in second onboarding title
  ///
  /// In en, this message translates to:
  /// **'care guides'**
  String get onboarding_second_title_highlight;

  /// Second onboarding title text after highlighted word
  ///
  /// In en, this message translates to:
  /// **''**
  String get onboarding_second_title_suffix;

  /// Onboarding continue button label
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboarding_continue_button;

  /// Dark Mode
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get profile_dark_mode;

  /// Language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profile_language;

  /// Language Selection
  ///
  /// In en, this message translates to:
  /// **'Language Selection'**
  String get profile_language_sheet_title;

  /// Turkish
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get profile_language_tr;

  /// English
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get profile_language_en;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

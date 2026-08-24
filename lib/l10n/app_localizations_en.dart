// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home_page_title => 'Home';

  @override
  String get home_greeting_label => 'Hi, plant lover!';

  @override
  String get home_greeting_title => 'Good Afternoon! ⛅';

  @override
  String get home_search_hint => 'Search for plants';

  @override
  String get home_premium_title => 'FREE Premium Available';

  @override
  String get home_premium_subtitle => 'Tap to upgrade your account!';

  @override
  String get home_nav_home => 'Home';

  @override
  String get home_nav_diagnose => 'Diagnose';

  @override
  String get home_nav_garden => 'My Garden';

  @override
  String get home_nav_profile => 'Profile';

  @override
  String paywall_title(String appName) {
    return '$appName Premium';
  }

  @override
  String get paywall_subtitle => 'Access All Features';

  @override
  String get paywall_try_free_button => 'Try free for 3 days';

  @override
  String get paywall_trial_note => 'After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable';

  @override
  String get paywall_terms => 'Terms';

  @override
  String get paywall_privacy => 'Privacy';

  @override
  String get paywall_restore => 'Restore';

  @override
  String get paywall_feature_unlimited_title => 'Unlimited';

  @override
  String get paywall_feature_unlimited_subtitle => 'Plant Identify';

  @override
  String get paywall_feature_faster_title => 'Faster';

  @override
  String get paywall_feature_faster_subtitle => 'Process';

  @override
  String get paywall_monthly_title => '1 Month';

  @override
  String get paywall_monthly_subtitle => '\$2.99/month, auto renewable';

  @override
  String get paywall_yearly_title => '1 Year';

  @override
  String get paywall_yearly_subtitle => 'First 3 days free, then \$529,99/year';

  @override
  String get paywall_yearly_badge => 'Save 50%';

  @override
  String get_started_title(String appName) {
    return 'Welcome to $appName';
  }

  @override
  String get get_started_subtitle => 'Identify more than 3000+ plants and 88% accuracy.';

  @override
  String get get_started_button => 'Get Started';

  @override
  String get get_started_terms_prefix => 'By tapping next, you are agreeing to PlantID';

  @override
  String get get_started_terms_of_use => 'Terms of Use';

  @override
  String get get_started_privacy_policy => 'Privacy Policy';

  @override
  String get onboarding_first_title_prefix => 'Take a photo to ';

  @override
  String get onboarding_first_title_highlight => 'identify';

  @override
  String get onboarding_first_title_suffix => ' the plant!';

  @override
  String get onboarding_second_title_prefix => 'Get plant ';

  @override
  String get onboarding_second_title_highlight => 'care guides';

  @override
  String get onboarding_second_title_suffix => '';

  @override
  String get onboarding_continue_button => 'Continue';

  @override
  String get profile_dark_mode => 'Dark Mode';

  @override
  String get profile_language => 'Language';

  @override
  String get profile_language_sheet_title => 'Language Selection';

  @override
  String get profile_language_tr => 'Turkish';

  @override
  String get profile_language_en => 'English';
}

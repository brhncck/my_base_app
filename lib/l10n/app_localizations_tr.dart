// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get home_page_title => 'Ana Sayfa';

  @override
  String get home_greeting_label => 'Merhaba, bitki sever!';

  @override
  String get home_greeting_title => 'İyi Günler! ⛅';

  @override
  String get home_search_hint => 'Bitki ara';

  @override
  String get home_premium_title => 'ÜCRETSİZ Premium Kullanılabilir';

  @override
  String get home_premium_subtitle => 'Hesabını yükseltmek için dokun!';

  @override
  String get home_nav_home => 'Ana Sayfa';

  @override
  String get home_nav_diagnose => 'Tanıla';

  @override
  String get home_nav_garden => 'Bahçem';

  @override
  String get home_nav_profile => 'Profil';

  @override
  String paywall_title(String appName) {
    return '$appName Premium';
  }

  @override
  String get paywall_subtitle => 'Tüm Özelliklere Eriş';

  @override
  String get paywall_try_free_button => '3 gün ücretsiz dene';

  @override
  String get paywall_trial_note => '3 günlük ücretsiz deneme süresinden sonra iptal etmezsen yıllık ₺274.99 ücretlendirilirsin. Yıllık abonelik otomatik yenilenir';

  @override
  String get paywall_terms => 'Şartlar';

  @override
  String get paywall_privacy => 'Gizlilik';

  @override
  String get paywall_restore => 'Geri Yükle';

  @override
  String get paywall_feature_unlimited_title => 'Sınırsız';

  @override
  String get paywall_feature_unlimited_subtitle => 'Bitki Tanıma';

  @override
  String get paywall_feature_faster_title => 'Daha Hızlı';

  @override
  String get paywall_feature_faster_subtitle => 'İşlem';

  @override
  String get paywall_monthly_title => '1 Ay';

  @override
  String get paywall_monthly_subtitle => '₺2.99/ay, otomatik yenilenir';

  @override
  String get paywall_yearly_title => '1 Yıl';

  @override
  String get paywall_yearly_subtitle => 'İlk 3 gün ücretsiz, sonra ₺529,99/yıl';

  @override
  String get paywall_yearly_badge => '%50 Tasarruf';

  @override
  String get_started_title(String appName) {
    return '$appName\'e hoş geldin';
  }

  @override
  String get get_started_subtitle => '3000\'den fazla bitkiyi %88 doğrulukla tanımla.';

  @override
  String get get_started_button => 'Başla';

  @override
  String get get_started_terms_prefix => 'Devam ederek PlantID kullanım koşullarını kabul etmiş olursun';

  @override
  String get get_started_terms_of_use => 'Kullanım Koşulları';

  @override
  String get get_started_privacy_policy => 'Gizlilik Politikası';

  @override
  String get onboarding_first_title_prefix => 'Bitkiyi ';

  @override
  String get onboarding_first_title_highlight => 'tanımlamak';

  @override
  String get onboarding_first_title_suffix => ' için fotoğraf çek!';

  @override
  String get onboarding_second_title_prefix => 'Bitki ';

  @override
  String get onboarding_second_title_highlight => 'bakım rehberleri';

  @override
  String get onboarding_second_title_suffix => ' al';

  @override
  String get onboarding_continue_button => 'Devam Et';

  @override
  String get profile_dark_mode => 'Karanlık Mod';

  @override
  String get profile_language => 'Dil';

  @override
  String get profile_language_sheet_title => 'Dil Seçimi';

  @override
  String get profile_language_tr => 'Türkçe';

  @override
  String get profile_language_en => 'English';
}

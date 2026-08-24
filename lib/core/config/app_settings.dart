class AppSettings {
  final String languageCode;
  final String themeMode;

  const AppSettings({required this.languageCode, required this.themeMode});

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      languageCode: json['languageCode'] as String,
      themeMode: json['themeMode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'languageCode': languageCode, 'themeMode': themeMode};
  }
}

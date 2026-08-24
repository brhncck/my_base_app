enum Flavor { dev, qa, prod }

class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.appName,
    required this.baseUrl,
    this.enableApiRequestLogging = false,
    this.enableApiResponseLogging = false,
    this.logApiRequestHeaders = false,
    this.logApiRequestBody = false,
    this.logApiResponseBody = false,
  });

  final Flavor flavor;
  final String appName;
  final String baseUrl;
  final bool enableApiRequestLogging;
  final bool enableApiResponseLogging;
  final bool logApiRequestHeaders;
  final bool logApiRequestBody;
  final bool logApiResponseBody;

  bool get isDev => flavor == Flavor.dev;
  bool get isQa => flavor == Flavor.qa;
  bool get isProd => flavor == Flavor.prod;
}

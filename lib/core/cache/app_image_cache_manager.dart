import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppImageCacheManager {
  const AppImageCacheManager._();

  static final CacheManager instance = CacheManager(
    Config('appImageCache', stalePeriod: const Duration(days: 30)),
  );
}

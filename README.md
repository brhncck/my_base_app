# My Base App

A Flutter starter project I use as the foundation for new consumer apps. It sets up what every production app needs (environments, architecture, networking, theming, localization and tests), so a new product can start from its screens instead of its setup.

## What's inside

| Area | Implementation |
|---|---|
| Architecture | Feature-first folders (`lib/features/*`), BLoC with shared base classes (`lib/core/bloc/base`), repository and service layers |
| Dependency injection | `get_it`, registered in one place (`lib/core/config/app_dependencies.dart`) |
| Navigation | `auto_route` with a generated router |
| Networking | `dio` with a base API client, request/response logging interceptors and a single `ApiError` model |
| Environments | `dev`, `qa` and `prod` flavors on Android (product flavors) and iOS (schemes and xcconfigs), each with its own entry point |
| Theming | Light and dark themes, with the user's choice persisted |
| Localization | Turkish and English via `gen-l10n`, switchable at runtime |
| Error handling | `runZonedGuarded`, `FlutterError.onError` and `PlatformDispatcher.onError` routed to a central logger, plus a `BlocObserver` |
| Caching and storage | `cached_network_image` with a custom cache manager, `shared_preferences` wrapper |
| Testing | Integration test that drives the theme flow end to end |

Sample flows included: onboarding, get started, home, dashboard, scan, diagnose, my garden, paywall and profile.

## Getting started

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run --flavor dev -t lib/main_dev.dart
```

Other environments:

```bash
flutter run --flavor qa -t lib/main_qa.dart
flutter run --flavor prod -t lib/main.dart
```

Integration tests:

```bash
flutter test integration_test --flavor dev
```

## Project structure

```text
lib/
├── app/            # Root app widget
├── common/         # Shared widgets
├── constants/      # Assets, dimensions and constants
├── core/
│   ├── api/        # Dio client, interceptors and error model
│   ├── bloc/       # Base BLoC classes and observer
│   ├── cache/      # Image cache manager
│   ├── config/     # Environments, DI, router, theme and app settings
│   ├── logging/    # App logger
│   └── storage/    # Local preferences
├── features/       # One folder per feature (bloc, data, pages, widgets)
└── l10n/           # Turkish and English translations
```

# Project Map

This page explains the repository in everyday language. You do not need to understand every file to use the app.

| Folder or file | What it is for |
|---|---|
| `lib/` | The app's Flutter code. |
| `lib/main.dart` | The app's starting point. |
| `lib/src/app.dart` | Connects the main screens and navigation. |
| `lib/src/dashboard_screen.dart` | The home/dashboard screen. |
| `lib/src/learning_screen.dart` | Learning framework and lesson content. |
| `lib/src/decision_tool_screen.dart` | Accounting decision tools and calculations. |
| `lib/src/case_practice_screen.dart` | Interactive case practice. |
| `lib/src/progress_store.dart` | Saves learning progress locally on the device. |
| `test/` | Automated checks that help catch accidental breakages. |
| `.github/workflows/` | Instructions GitHub follows to check the app and build the APK. |
| `docs/` | Guides and project notes written for people. |
| `pubspec.yaml` | Project identity and the Flutter packages the app uses. |
| `analysis_options.yaml` | Code-quality settings. |
| `.gitignore` | Tells Git which generated or private local files should not be uploaded. |

## How an APK is produced

The workflow in `.github/workflows/android-apk.yml` runs in GitHub's cloud. It prepares Android build files, checks the code, runs tests, builds the APK and attaches it to the workflow run as an artifact.

The generated Android folder is not currently committed to the repository. The workflow creates it each time it builds.

## Which files should usually be changed?

- A screen or app feature: the relevant file under `lib/src/`.
- Learning or accounting material: the relevant learning or decision-tool source file, with accounting review.
- App dependencies: `pubspec.yaml`.
- Automated checks: files under `test/`.
- APK build process: `.github/workflows/android-apk.yml`.

Avoid changing the build workflow or project configuration unless needed. Use a separate Git branch so the working app remains safe.

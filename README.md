# Ind AS 115 Studio

A learning and practice app for understanding Ind AS 115 (Revenue from Contracts with Customers). The app is built with Flutter for Android.

**Project status:** Working MVP. The Android build has previously completed successfully and the app has been installed and tested.

## If you only want to use the app

You do not need to install Flutter or write code.

1. Open this repository on GitHub.
2. Tap **Actions**.
3. Open the latest successful **Build Android APK** run on the `main` branch.
4. Scroll to **Artifacts** and download `ind-as115-android-apk`.
5. Open the downloaded ZIP file on your Android phone and extract it.
6. Tap `app-release.apk` to install. If Android asks, allow your browser or file manager to install unknown apps, then return to the APK and continue.

The artifact is a temporary download and expires after 14 days. If you cannot find it, run the workflow again from **Actions → Build Android APK → Run workflow**, or ask for help.

More detailed phone-first instructions: [Start Here](docs/START_HERE.md).

## What the app currently includes

- A home dashboard and simple app navigation
- A five-step Ind AS 115 learning framework
- Expandable lesson cards and decision checkpoints
- A relative stand-alone selling price (SSP) allocation calculator
- Prompts for assessing over-time revenue recognition
- Interactive case practice
- Learning progress and quiz scores saved on the device

This is an MVP. Features and accounting coverage may change as the project develops.

## If you want to improve the app

You can describe the change you want in plain English. For example: "Add a worked example for a contract with three performance obligations." A developer or coding assistant can translate the request into a code change.

The usual process is:

1. Explain the desired change and expected result.
2. Make the change on a separate branch.
3. Review the proposed changes before they are added to `main`.
4. After approved changes reach `main`, GitHub Actions checks the project and builds a new APK.

The app's folders and files are explained in [Project Map](docs/PROJECT_MAP.md).

## Project structure

- `lib/` — the app's Flutter source code
- `test/` — automated app checks
- `.github/workflows/android-apk.yml` — the automatic Android APK build
- `docs/` — plain-English project guidance

## Build checks

The GitHub Actions workflow runs these steps:

1. Set up Java and Flutter
2. Generate the Android platform folder needed for the build
3. Download project dependencies
4. Analyze the Flutter code
5. Run automated tests
6. Build a release APK
7. Upload the APK as a downloadable workflow artifact

The Android platform files are generated during the cloud build; they are not currently stored in this repository.

## Accounting accuracy and limitations

This app is an educational aid, not an authoritative accounting opinion or a substitute for professional judgment. Always verify conclusions against the latest notified Ind AS 115, amendments, relevant appendices, contract facts and applicable requirements.

The current SSP calculator performs a basic relative-SSP allocation. It does not automatically apply every exception or judgement area, including allocation of discounts or variable consideration to specific performance obligations. See [Accounting Content Rules](docs/ACCOUNTING_CONTENT_RULES.md).

## Security and signing

Do not upload passwords, API keys, signing keystores or other secrets to this repository. The current workflow creates an installable release APK using Flutter's default Android release configuration. A private release keystore and secure GitHub Actions secrets should be configured before production or Google Play distribution.

## For developers

Requirements: a compatible Flutter stable release and Java 17.

```bash
flutter pub get
flutter analyze
flutter test
flutter run
flutter build apk --release
```

## Help and project notes

- [Start Here](docs/START_HERE.md) — how to get and install the APK using an Android phone
- [Project Map](docs/PROJECT_MAP.md) — what each important folder and file does
- [Accounting Content Rules](docs/ACCOUNTING_CONTENT_RULES.md) — principles for maintaining reliable learning content
- [Changelog](docs/CHANGELOG.md) — notable project changes

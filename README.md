# Ind AS 115 Studio — Flutter MVP

Offline-first educational Android app for CA Final learners and accounting professionals.

## Included in this starter MVP

- Premium mobile dashboard and navigation
- Five-step Ind AS 115 learning framework
- Expandable lesson cards with decision checkpoints
- Relative stand-alone selling price allocation calculator
- Over-time recognition screening prompts
- Interactive software + implementation case practice
- Local learning progress and quiz score persistence
- GitHub Actions workflow to analyze, test and build an Android APK

## Build in GitHub Actions from an Android phone

1. Create a new GitHub repository named `ind-as115-studio`.
2. Upload the **contents** of this project archive to the repository root (not the containing folder).
3. Open the repository's **Actions** tab.
4. If prompted, enable GitHub Actions.
5. Select **Build Android APK** and tap **Run workflow** (or push a commit to `main`).
6. Open the completed workflow run, scroll to **Artifacts**, and download `ind-as115-android-apk`.
7. Extract the ZIP and install `app-release.apk` on your Android phone. Android may ask you to allow installation from that browser or file manager.

## Signing note

The workflow produces an installable release APK using Flutter's default Android release configuration. Before distributing through Google Play or wider production distribution, configure a private release keystore using GitHub Actions secrets and update Android signing configuration. Never commit keystore files or passwords to the repository.

## Accounting-content note

This is an educational MVP, not an authoritative accounting opinion engine. Validate all treatments against the latest notified Ind AS 115 text, amendments, appendices, facts, contract terms and applicable legal environment. The current calculator implements the basic relative-SSP allocation formula and does not automate exceptions such as allocation of discounts or variable consideration to specific performance obligations.

## Local development

```bash
flutter pub get
flutter analyze
flutter test
flutter run
flutter build apk --release
```

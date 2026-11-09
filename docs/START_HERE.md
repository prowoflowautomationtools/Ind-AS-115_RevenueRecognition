# Start Here: use the app from an Android phone

This guide is for someone who wants to install and use the app, not develop it.

## Download the latest app

1. Open the repository's Actions page: https://github.com/prowoflowautomationtools/ind-as115-studio/actions
2. Find the most recent successful run named **Build Android APK** (green check mark).
3. Open the run and scroll to **Artifacts**.
4. Tap **ind-as115-android-apk** to download the ZIP file.

If there is no recent successful run, open **Build Android APK** in the left panel, tap **Run workflow**, choose the `main` branch and confirm. Wait for success, then download the artifact from that run.

## Install it

1. Open Downloads or the Files app on your phone.
2. Find the downloaded ZIP file and extract it.
3. Find `app-release.apk` in the extracted folder and tap it.
4. If Android blocks installation, follow its prompt to allow this file manager or browser to install unknown apps. Return to the APK and tap it again.
5. Review the Android installation prompt and install.

Only install APKs obtained from a repository or release source you trust.

## Update later

Download and install the newer APK using the same steps. Android will normally offer to update the existing app when the package identity and signing key match. If Android says it cannot install, do not uninstall immediately because uninstalling can remove app data. Ask for help first.

## If the download is missing

Workflow artifacts are temporary. This project's build workflow retains them for 14 days. Run the workflow again to create a fresh artifact.

## What you do not need

For ordinary app use, you do not need a computer, Flutter, Android Studio, a coding environment, or to edit repository files.

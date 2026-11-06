#!/usr/bin/env bash
# Needs: Node 18+, JDK 17, Android SDK (ANDROID_HOME set)
set -e
npm install
[ -d android ] || npx cap add android
M=android/app/src/main/AndroidManifest.xml
grep -q screenOrientation $M || sed -i 's/<activity /<activity android:screenOrientation="sensorLandscape" /' $M
npx cap sync android
cd android && ./gradlew assembleDebug
echo "APK: android/app/build/outputs/apk/debug/app-debug.apk"

#!/usr/bin/env bash
# usage: patch-manifest.sh <app-dir>   (adds rider background-location permissions)
set -e
M="$1/android/app/src/main/AndroidManifest.xml"
add() { grep -q "$1" "$M" || sed -i "s#<application#<uses-permission android:name=\"$1\" />\n    <application#" "$M"; }
add android.permission.ACCESS_COARSE_LOCATION
add android.permission.ACCESS_FINE_LOCATION
add android.permission.FOREGROUND_SERVICE
add android.permission.FOREGROUND_SERVICE_LOCATION
add android.permission.POST_NOTIFICATIONS
echo "Manifest patched:"; grep uses-permission "$M"

#!/usr/bin/env bash

backupFolder="./backup/" # Change this path to choose your own backup location
echo Make sure app icons have the same name as the application you\'re trying to replace
echo You have to restart applications inside your doc to see updates


if [[ ! -d $backupFolder ]]; then
  mkdir "$backupFolder"
fi

ls *.icns | while read newIcn; do
  appName="${newIcn%.icns*}"
  systemApp=""

  if [[ -d "/System/Applications/"$appName".app/Contents" ]]; then
    systemApp="/System/"
  elif [[ ! -d "/Applications/"$appName".app/Contents" ]]; then
    echo Skipped $appName because icon not found
    continue
  fi

  icn=`defaults read "$systemApp"/Applications/"$appName".app/Contents/info CFBundleIconFile`

  if [[ ! $icn == *".icn" ]]; then
    icn="$icn".icns
  fi

  if [[ ! -e "$backupFolder"/"$newIcn" ]]; then
    sudo mv "$systemApp"/Applications/"$appName".app/Contents/Resources/"$icn" "$backupFolder"/"$newIcn"
  else
    echo "Backup icon for $appName already exists"
  fi

  sudo cp "$newIcn" "$systemApp"/Applications/"$appName".app/Contents/Resources/
  sudo mv "$systemApp"/Applications/"$appName".app/Contents/Resources/"$newIcn" "$systemApp"/Applications/"$appName".app/Contents/Resources/"$icn"

  sudo touch "$systemApp"/Applications/"$appName".app

done

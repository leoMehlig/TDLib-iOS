#!/bin/sh

setup_git() {
  git config --global user.email "ci@leomehlig.com"
  git config --global user.name "ci-leomehlig"
}

commit_website_files() {
  git checkout master
  git pull
  git commit -m CI\ commit\ \[ci\ skip\] ./docs/\* ./TDLib/Info.plist ./TDLibTests/Info.plist ./TDLib.xcodeproj/project.pbxproj
}

upload_files() {
  git remote add origin-master git@github.com:leoMehlig/TDLib-iOS.git > /dev/null 2>&1
  git push origin-master master
}
cd ..
setup_git
commit_website_files
upload_files
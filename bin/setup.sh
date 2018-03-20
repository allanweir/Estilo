#!/bin/sh

echo "Setting-up Project Dependencies"

echo "Updating brew"
brew update

if which carthage >/dev/null; then
  echo "Carthage already installed"
else
  echo "Installing Carthage"
  brew install carthage
fi

if which swiftlint >/dev/null; then
  echo "Swiftlint already installed"
else
  echo "Installing Swiftlint"
  brew install swiftlint
fi

bin/prepare.sh
# Homebrew tap for GridBack

GridBack is a free menu-bar replacement for the classic macOS Launchpad.

## Install

You need an Apple silicon Mac running macOS 26 or later.

```
brew install --cask jimmythefallony/gridback/gridback
```

On Homebrew 6 or later, that full name trusts only this cask. It does not trust every future file in the tap.

The app is not notarized. The first time you open it, macOS says it cannot verify the developer. Use **System Settings > Privacy & Security > Open Anyway**. Homebrew does not remove that warning.

## Remove it

```
brew uninstall --cask --zap jimmythefallony/gridback/gridback
```

`--zap` also deletes GridBack's saved layout in `~/Library/Application Support/GridBack`. If Start at login is on, turn it off in GridBack's Settings before you uninstall, or remove GridBack from **System Settings > General > Login Items** afterwards. Uninstalling the app does not do that by itself.

## Updates

A GitHub Action in this repository checks the latest GridBack release once a day and updates the cask version and checksum. It uses this repository's own Actions token. It does not need a separate secret, and it does not change the GridBack releases. If that Action cannot push, open this repository's Settings, choose Actions, then General, and allow Actions to read and write. No new token is required.

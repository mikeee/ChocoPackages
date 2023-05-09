# ChocoPackages

[![AU-Updater](https://github.com/mikeee/ChocoPackages/actions/workflows/update.yaml/badge.svg?branch=master)](https://github.com/mikeee/ChocoPackages/actions)
[Update status](https://gist.github.com/mikeee/17b5a042cba1bd9da2bf21615aab4f0f)

This repo houses all the packages I maintain on [Chocolatey](https://chocolatey.org). Automatic package updates via GitHub Actions.

## Folder Structure

- automatic - packages that are automatically maintained using CI.
- icons - central image store for all the packages.
- manual - packages that are not automatically maintained/updated.
- \_scripts - miscellaneous scripts for helping with (automatic) packaging.
- setup - scripts for the packaging process.

## Requirements

- Chocolatey (choco.exe)

### AU

- PowerShell v5+.
- The [AU module](https://chocolatey.org/packages/au).

## Contributions / Suggestions

Happy to implement packaging for requested applications, please open an issue with your request. Any updates/pull requests also greatly appreciated.

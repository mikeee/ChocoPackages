# ChocoPackages

[![AppVeyor Badge](https://ci.appveyor.com/api/projects/status/github/mikeee/ChocoPackages?svg=true)](https://ci.appveyor.com/project/mikeee/ChocoPackages)
[Update status](https://gist.github.com/mikeee/17b5a042cba1bd9da2bf21615aab4f0f)

This repo houses all the packages I maintain on [Chocolatey](https://chocolatey.org). Automatic updates of packages are using [AppVeyor](https://www.appveyor.com/).

## Folder Structure

* automatic - packages that are automatically maintained using CI.
* icons - central image store for all the packages.
* _scripts - miscellaneous scripts for helping with (automatic) packaging.
* setup - scripts for the packaging process.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

## Requirements

* Chocolatey (choco.exe)

### AU

* PowerShell v5+.
* The [AU module](https://chocolatey.org/packages/au).

For daily operations check out the AU packages [template README](https://github.com/majkinetor/au-packages-template/blob/master/README.md).

## Contributions / Suggestions

Happy to implement packaging for requested applications, please open an issue with your request. Any updates/pull requests also greatly appreciated.

:globe_with_meridians:  **<u>english</u>**	[český](README.cz.md)	[русский](README.ru.md)

# Code of Steampunk Flutter Clock

## Table of content

* [Description](#Description)
* [Licenses](#Licenses)
* [Footage of real devices](#Footage-of-real-devices)
* [Changes](#Changes)
* [Releases](#Releases)
* [Tests](#Tests)

![Screenshot](screenshot.jpg)

## Description

Here you will find a code base of this Steampunk Flutter Clock project and it’s guided by the contest rules, you can read more about this rules here: [flutter.dev/clock](https://flutter.dev/clock).

## Licenses

Code is licensed under an appropriate open source license (BSD aka University of California license), assets in [assets](./assets) folder are licensed with CC BY 4.0 license and font in [third_party](./third_party) folder, contain OFL license. You can find file named LICENSE inside folders, that contains a copy of the license, with full text of that license.

## Footage of real devices

Here you can find a raw, untouched 4K footage from real devices, running iOS (iPhone, from year 2016) and Android (2-in-1 tablet, from year 2013) operating systems, with those steampunk clocks on it.

Checksums:

MD5: ```85112361007BD86664C871030E1D3D55```

SHA-1: ```0CFCDFE7EA241C304CA694CC376983F11B1C6E6D```

[![Video Preview](https://drive.google.com/thumbnail?authuser=0&sz=w3840&id=1MEvmXMpxN4UaGxbnPOzpHPvQ4rkUYXqv)](https://1drv.ms/u/s!Aoc8-1_hYIfGiFPEwgpoCKerXyNC?e=TLMM3v)

[Dropbox](https://www.dropbox.com/sh/artyk72v9tckws3/AAAc5q7e0c70HiCDLuuiNN9Ia?dl=0) |
[Google Drive](https://drive.google.com/open?id=1XkKovGk6c6a0NpMadtCMXMx6KAM61RPp) | [Mega.nz](https://mega.nz/#F!5UlUzKBT!NZLFHkueFZT_SJWvZf1yAQ) |
[OneDrive](https://1drv.ms/u/s!Aoc8-1_hYIfGiFPEwgpoCKerXyNC?e=TLMM3v) |
[Amazon Drive](https://www.amazon.com/clouddrive/share/gtEpUwtoJYL0UvYkvPirVcsCnrloKuaGbtxKqbrCWlr) |
[iCloud](https://www.icloud.com/iclouddrive/0BYofNXgp-nZoBJBiTW_gIJlg#20200121%5F143234)

## Changes

Main changes in original Google's example code:

* removed unused files and folders,
* this [root](./) folder:
  * edited [.gitignore](./.gitignore) file,
  * added lints to [analysis_options.yaml](./analysis_options.yaml) file,
  * added runners for all platforms,
  * tests have been added to the [test](./test) folder and their coverage to the [coverage](./coverage) folder,
  * added [README.md](./README.md) files in different languages,
  * [pubspec.yaml](./pubspec.yaml) — added [Rive](https://rive.app) (ex Flare) dependency, test and lint dependencies, changed description and increased SDK version to 2.16.0.
* [lib](./lib) folder:
  * [main.dart](./lib/main.dart) — added landscape and full-screen mode to app, caching animation files. Everything else is untouched.
  * [analog_clock.dart](./lib/analog_clock.dart) — removed unused variables, declared animation controller and changed two methods. Everything else is untouched,
  * added [time_animation_controller.dart](./lib/time_animation_controller.dart) and [temperature_converter.dart](./lib/temperature_converter.dart) files,
* [assets](./assets) folder — replaced unused assets with animation file,
* [ios](./ios) folder — setup iOS device to run in landscape mode, added unique name,
* [android](./android) folder — edited [build.gradle](./android/build.gradle) (see Known Issues),
* added [third_party](./third_party) folder, with font and it's license.

**Newly added/replaced code is commented**, so you can understand what's going on.

## Releases

You can find binaries in [Releases](https://github.com/tsinis/flutter_clock/releases) section of this GitHub repository.

## Tests

Clock has 100% unit/widget test coverage (can be found at [./coverage](./coverage/html/)) or run*:

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html'
```

> requires lcov installed*

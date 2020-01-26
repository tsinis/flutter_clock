:globe_with_meridians:  **<u>english</u>**	[český](README.cz.md)	[русский](README.ru.md)

# Code of Steampunk Flutter Clock

## Table of content:
* [Description](#Description)
* [Licenses](#Licenses)
* [Footage of real devices](#Footage-of-real-devices)
* [Changes](#Changes)
* [Know Issues](#Know-Issues)
  * [Building APK files](#Building-APK-Files)
  * [Poor performance on some devices](#Poor-Performance)
* [Technical Data](#Technical-Data)

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
  * added [README.md](./README.md) files in different languages,
  * [pubspec.yaml](./pubspec.yaml) — added [Rive](https://rive.app) (ex Flare) dependency, changed description and increased SDK version to 2.7.0.
* [lib](./lib) folder:
  * [main.dart](./lib/main.dart) — added landscape and full-screen mode to app, caching animation files. Everything else is untouched.
  * [analog_clock.dart](./lib/analog_clock.dart) — removed unused variables, declared animation controller and changed two methods. Everything else is untouched,
  * added [animation_controller.dart](./lib/animation_controller.dart) and [temperature_converter.dart](./lib/temperature_converter.dart) files,
* [assets](./assets) folder — replaced unused assets with animation file,
* [ios](./ios) folder — setup iOS device to run in landscape mode, added unique name,
* [android](./android) folder — edited [build.gradle](./android/build.gradle) (see Known Issues),
* added [third_party](./third_party) folder, with font and it's license.

**Newly added/replaced code is commented**, so you can understand what's going on.

## Know Issues

Android platform have technical issues with:
#### Building APK Files
Building any kind of APK files, is throwing errors in terminal. To fix it — please edit dependencies in buildscript, inside of [build.gradle](./android/build.gradle) file (in android folder). Last known good version is 3.4.2, so replace line number 9:
```markdown
classpath 'com.android.tools.build:gradle:3.5.0'
```
with:
```markdown
classpath 'com.android.tools.build:gradle:3.4.2'
```
Problem should be gone now.
#### Poor Performance
Animations are made to run in up to **25 FPS**, but some Android devices, sadly, cannot run animation smoothly at this moment (January 2020). There is few open [Issues](https://github.com/2d-inc/Flare-Flutter/issues) in flare_flutter repository related to this. Rive team is working on it, we may also receive Android runtime in this year (at least this is planned to do in their [Roadmap](https://portal.productboard.com/rive/1-roadmap/c/56-android-runtime)), so according to date you reading this, problem may, or may not occur. If FPS not satisfies you, please try [my fork of flare_flutter](https://github.com/tsinis/flare-flutter) 2.0.1, with anti-aliasing turned off instead of official flare_flutter package — inside of [pubspec.yaml](./pubspec.yaml) file (in this root folder), replace line:
```markdown
  flare_flutter: ^2.0.1
```
with:
````markdown
  flare_flutter:
    git:
      url: git://github.com/tsinis/Flare-Flutter.git
      ref: stable
      path: flare_flutter
````
> **Note:** this is clearly device-dependent issue, because I've had successfully launched, on device with Android OS running, without horrible lags or huge frame drops. As you can see at [Footage of real devices](#Footage-of-real-devices).

 I had **no problems on physical iOS devices (iPhones)**, anyway please report issues or advice how to fix them, on Issues section.

## Technical Data

| Name | Description |
| ---- | ----------- |
| **Framework name** | [Flutter](https://flutter.dev) |
| Framework version | [1.12.13+hotfix.5](https://github.com/flutter/flutter) |
| Framework channel | stable |
| **Language name** | [Dart](https://dart.dev) |
| Language version | [2.7.0](https://github.com/dart-lang) |
| Language channel | stable |
| **IDE name** | [Visual Studio Code](https://code.visualstudio.com/insiders/) |
| IDE version | [1.42.0](https://github.com/microsoft/vscode) |
| IDE channel | insider |
| **1st**-party Dependency name | Flutter Clock Helper |
| **1st**-party Dependency package | [flutter_clock_helper](../flutter_clock_helper) |
| 3rd-party Dependency name | [Rive](https://rive.app) (ex Flare) |
| 3rd-party Dependency package | [flare_flutter](https://pub.dev/packages/flare_flutter) |
| 3rd-party Dependency version | [2.0.1](https://github.com/2d-inc/Flare-Flutter) |
| 3rd-party Dependency channel | stable |
| Architecture | Default (listner) |
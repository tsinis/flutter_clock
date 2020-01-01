// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flare_flutter/flare_cache.dart';

import 'analog_clock.dart';

//Path to animations, that needs to be prechached
const _filesToWarmup = ["assets/FlutterClock.flr"];

//Function to cache animations
Future<void> _warmupFlare() async {
  for (final filename in _filesToWarmup) {
    await cachedActor(rootBundle, filename);
  }
}

void main() async {
  // Newer versions of Flutter require initializing widget-flutter
  // binding prior to warming up the animation cache.
  WidgetsFlutterBinding.ensureInitialized();

  // A temporary measure until Platform supports web and TargetPlatform supports
  // macOS.
  if (!kIsWeb && Platform.isMacOS) {
    // TODO(gspencergoog): Update this when TargetPlatform includes macOS.
    // https://github.com/flutter/flutter/issues/31366
    // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override.
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  // Don't prune the Flare cache, keep loaded animation
  // files warm and ready to be re-displayed.
  FlareCache.doesPrune = false;

  // Warm the animation cache up.
  _warmupFlare().then((_) {

    // Run in fullscreen mode
    SystemChrome.setEnabledSystemUIOverlays([]);

    // Run in landscape mode
    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft])
        .then((_) {

      // This creates a clock that enables you to customize it.
      //
      // The [ClockCustomizer] takes in a [ClockBuilder] that consists of:
      //  - A clock widget (in this case, [AnalogClock])
      //  - A model (provided to you by [ClockModel])
      // For more information, see the flutter_clock_helper package.
      //
      // Your job is to edit [AnalogClock], or replace it with your own clock
      // widget. (Look in analog_clock.dart for more details!)
      runApp(ClockCustomizer((ClockModel model) => AnalogClock(model)));
    });
  });
}

// Copyright 2020, Roman Cinis. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io' show Platform;

import 'package:flutter/services.dart'
    show rootBundle, SystemChrome, DeviceOrientation;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flare_flutter/flare_cache.dart';

import 'analog_clock.dart';

// Path to animations, that needs to be pre-cached.
const _filesToWarmup = ["assets/FlutterClock.flr"];

// Function to cache Rive (ex Flare) animations.
Future<void> _warmupAnimations() async {
  for (final filename in _filesToWarmup) {
    // await cachedActor(rootBundle, filename);
    print('done');
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

  // Don't prune the Rive (ex Flare) cache, keep loaded animation
  // files warm and ready to be re-displayed.
  FlareCache.doesPrune = false;

  // Warm the animation cache up.
  _warmupAnimations().then((_) {
    // Run clock in full-screen mode.
    SystemChrome.setEnabledSystemUIOverlays([]);
    // Run clock in landscape mode.
    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft])
        .then((_) {
      // This creates a clock that enables you to customize it.
      //
      // The [ClockCustomizer] takes in a [ClockBuilder] that consists of:
      //  - A clock widget (in this case, [AnalogClock])
      //  - A model (provided to you by [ClockModel])
      // For more information, see the flutter_clock_helper package
      runApp(ClockCustomizer((ClockModel model) => AnalogClock(model)));
    });
  });
}

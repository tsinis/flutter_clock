// Copyright 2022, Roman Cinis. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/flare_cache_asset.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/customizer.dart';

import 'analog_clock.dart';

/// Application entry point, default to all Dart/Flutter projects.
Future<FlareCacheAsset> main() async {
  /// Newer versions of Flutter require initializing widget-flutter
  /// binding prior to warming up the animation cache.
  WidgetsFlutterBinding.ensureInitialized();

  /// Don't prune the Rive (ex Flare) cache, keep loaded animation
  /// files warm and ready to be re-displayed.
  FlareCache.doesPrune = false;

  /// Warm the animation cache up so we can return it later,
  /// for testing purposes only.
  final cache = await cachedActor(assetProvider);

  /// Run clock in full-screen mode.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  /// Run clock in landscape mode.
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft],
  );

  /// This creates a clock that enables you to customize it.
  ///
  /// The [ClockCustomizer] takes in a [ClockBuilder] that consists of:
  ///  - A clock widget (in this case, [AnalogClock])
  ///  - A model (provided to you by [ClockModel])
  /// For more information, see the flutter_clock_helper package
  runApp(const ClockCustomizer(AnalogClock.new));

  return cache;
}

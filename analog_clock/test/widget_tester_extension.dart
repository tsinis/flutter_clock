import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {
  /// Helper method which tries to replace the earlier, and now missing
  /// FlutterDriver.waitFor method. Requires [Finder] according to
  /// which it tries to redraw the screen and search for the requested
  /// object in widget tree until the timer expires.
  Future<Finder> pumpUntilFound(
    /// Object to find which is also returned after timeout.
    Finder finder, {
    Duration? pumpDuration = const Duration(milliseconds: 100),
    int timeoutInSeconds = 24,

    /// If finder does not find the expected element: throws an TimeoutException
    /// after timeoutInSeconds ends. Default to false.
    bool throwExceptionWhenNotFound = false,
  }) async {
    var timerDone = false;
    final timer = Timer(Duration(seconds: timeoutInSeconds), () {
      if (throwExceptionWhenNotFound) {
        throw TimeoutException('Pump until has timed out');
      }
      timerDone = true;
    });
    while (!timerDone) {
      await pump(pumpDuration);
      try {
        if (any(finder)) {
          timerDone = true;
        }
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {}
    }
    timer.cancel();

    return finder;
  }
}

import 'package:analog_clock/analog_clock.dart';
import 'package:analog_clock/main.dart' as app;
import 'package:clock/clock.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_tester_extension.dart';

void main() {
  testWidgets(
    '$AnalogClock with cuckoo animation',
    (tester) async => await withClock(
      Clock.fixed(DateTime(1970)),
      () async => tester.runAsync<void>(() async {
        await tester.pumpWidget(const ClockCustomizer(AnalogClock.new));
        final progressIndicator = find.byType(CircularProgressIndicator);
        expect(progressIndicator, findsOneWidget);
        await app.main();
        final clock = await tester.pumpUntilFound(find.byType(FlareActor));
        expect(progressIndicator, findsNothing);
        expect(clock, findsOneWidget);
      }),
    ),
  );

  testWidgets(
    '$AnalogClock without cuckoo animation',
    (tester) async => await withClock(
      Clock.fixed(DateTime(1970, 1, 1, 1, 1)),
      () async => tester.runAsync<void>(() async {
        await tester.pumpWidget(const ClockCustomizer(AnalogClock.new));
        final clock = await tester.pumpUntilFound(find.byType(FlareActor));
        expect(clock, findsOneWidget);
      }),
    ),
  );
}

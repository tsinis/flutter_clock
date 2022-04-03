import 'package:analog_clock/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() => testWidgets(
      'main() returns cache',
      (tester) async => tester.runAsync<void>(
        () async {
          final cache = await app.main();
          expect(cache.isAvailable, true);
        },
      ),
    );

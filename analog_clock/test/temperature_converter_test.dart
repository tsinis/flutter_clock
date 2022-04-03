import 'package:analog_clock/temperature_converter.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('mercuryPosition', () {
      test('from ${TemperatureUnit.celsius}', () {
        final yCoordinate = mercuryPosition(0);
        expect(yCoordinate, 141.0);
      });

      test('from ${TemperatureUnit.fahrenheit}', () {
        final yCoordinate = mercuryPosition(0, TemperatureUnit.fahrenheit);
        expect(yCoordinate.round(), 183);
      });
    });

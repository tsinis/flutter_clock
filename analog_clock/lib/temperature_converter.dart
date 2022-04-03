// Copyright 2022, Roman Cinis. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' show max;

import 'package:flutter_clock_helper/model.dart' show TemperatureUnit;

/// Function will process temperature from Helper package in any unit
/// and return result as Y axis coordinate for mercury node on artboard.
double mercuryPosition(num temperature, [TemperatureUnit? unit]) {
  // Detect temperature unit, since Fahrenheit requires conversion.
  final isFahrenheit = unit == TemperatureUnit.fahrenheit;
  // Switching any temperature to Celsius and converting it to [double] value.
  final degrees = isFahrenheit ? (temperature - 32) * 5 / 9 : temperature;

  // Thermometer is physical device, so mercury is not infinity, it cannot go
  // bellow zero coordinate, let's limit it to zero. 60 = 60°C (highest shown
  // temperature on thermometer); 2.35 is simplified formula of this:
  // 223 (lowest coordinate of -40° bar) divided by sum of Celsius
  // temperature range (95). Coordinate should not be a negative number.
  return max(0, (degrees - 60) * -2.35);
}

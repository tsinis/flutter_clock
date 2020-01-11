// Copyright 2020, Roman Cinis. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' show max;

// Function will process temperature String from Helper package in any unit
// and return result as Y axis coordinate for mercury node on artboard.
double mercuryPosition(String _temperature) {
  String _degreesWOUnit;
  double _degreesCelsius;

  // Switching any temperature to Celsius and converting it to double value.
  if (_temperature.endsWith('F')) {
    _degreesWOUnit = _removeTemperatureUnit(_temperature);
    _degreesCelsius = (double.parse(_degreesWOUnit) - 32) * 5 / 9;
  } else {
    _degreesWOUnit = _removeTemperatureUnit(_temperature);
    _degreesCelsius = double.parse(_degreesWOUnit);
  }
  // Thermometer is physical device, so mercury is not infinity, it cannot go
  // bellow zero coordinate, let's limit it to zero. 60 = 60°C (highest shown
  // temperature on thermometer); 2.35 is simplified formula of this:
  // 223 (lowest coordinate of -40° bar) divided by sum of Celsius
  // temperature range (95). Coordinate should not be a negative number.
  _degreesCelsius = max(0, (_degreesCelsius - 60) * -2.35);
  return _degreesCelsius;
}

String _removeTemperatureUnit(String _temperature) {
// Removing last two symbols (so "°C" or "°F") from String.
  return _temperature.substring(0, _temperature.length - 2);
}

import 'dart:math' show max;

double mercuryPosition(String _temperatureFromHelper) {
  String _celsiusWOUnit;
  double _celsius;

  if (_temperatureFromHelper.endsWith('F')) {
    _celsiusWOUnit = _removeDegreesUnit(_temperatureFromHelper);
    _celsius = (double.parse(_celsiusWOUnit) - 32) * 5 / 9;
  } else {
    _celsiusWOUnit = _removeDegreesUnit(_temperatureFromHelper);
    _celsius = double.parse(_celsiusWOUnit);
  }
  _celsius = max(0, (_celsius - 60) * -2.35);
  return _celsius;
}

String _removeDegreesUnit(String _temperatureFromHelper) {
  return _temperatureFromHelper.substring(0, _temperatureFromHelper.length - 2);
}

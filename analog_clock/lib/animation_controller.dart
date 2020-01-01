import 'package:flare_dart/math/mat2d.dart' show Mat2D;

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

import 'temperature_converter.dart';

class RiveAnimationController extends FlareController {
  RiveAnimationController(
      {this.temperatureFromHelper, this.conditionFromHelper});

  String conditionFromHelper;
  String temperatureFromHelper;

  static const double _dontMixAnimations = 1.0;

  static ActorNode _temperature;

  static ActorAnimation _time;
  static ActorAnimation _condition;

  static FlareAnimationLayer _cuckoo;
  static FlareAnimationLayer _bubbles;

  static DateTime _now;

  @override
  void initialize(FlutterActorArtboard artboard) {
    _temperature = artboard.getNode('thermometer_mercury_position');

    _time = artboard.getAnimation('time');

    _cuckoo = FlareAnimationLayer()
      ..animation = artboard.getAnimation('cuckoo')
      ..mix = _dontMixAnimations;
    _bubbles = FlareAnimationLayer()
      ..animation = artboard.getAnimation('thermometer_bubbles')
      ..mix = _dontMixAnimations;
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _condition = artboard.getAnimation(conditionFromHelper);
    _condition.apply(0, artboard, _dontMixAnimations);

    _temperature.y = mercuryPosition(temperatureFromHelper);

    _now = DateTime.now();

    _bubbles.time = (_bubbles.time + elapsed) % _bubbles.duration;
    _bubbles.apply(artboard);

    if (_now.minute == 0) {
      _cuckoo.time = _cuckoo.time + elapsed;
      _cuckoo.apply(artboard);
    } else {
      _time.apply(_now.second / 60 + _now.minute + _now.hour * 60,
          artboard, _dontMixAnimations);
    }
    return true;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}

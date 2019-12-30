import 'package:flare_dart/math/mat2d.dart' show Mat2D;

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

class RiveAnimationController extends FlareController {
  RiveAnimationController(
      {this.temperatureFromHelper, this.conditionFromHelper});

  String conditionFromHelper;
  String temperatureFromHelper;

  static const double _dontMixAnimations = 1.0;

  static ActorNode _condition;
  static DateTime _now;
  static FlareAnimationLayer _cuckooAnimation;
  static FlareAnimationLayer _steam;
  static ActorNode _temperature;
  // static ActorNode _weather;
  static ActorAnimation _timeAnimation;

  @override
  void initialize(FlutterActorArtboard artboard) {
    _condition = artboard.getNode(conditionFromHelper);
    // _weather = artboard.getNode('weather');
    _temperature = artboard.getNode('thermometer_mercury_position');
    _timeAnimation = artboard.getAnimation('time');

    _cuckooAnimation = FlareAnimationLayer()
      ..animation = artboard.getAnimation('cuckoo')
      ..mix = _dontMixAnimations;
    _steam = FlareAnimationLayer()
      ..animation = artboard.getAnimation('steam')
      ..mix = _dontMixAnimations;
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _condition = artboard.getNode(conditionFromHelper);
    _condition.opacity = 1.0;

    _now = DateTime.now();

    _temperature.y = -(0).toDouble();

    _steam.time = (_steam.time + elapsed) % _steam.duration;
    _steam.apply(artboard);

    if (_now.minute == 0) {
      _cuckooAnimation.time = _cuckooAnimation.time + elapsed;
      _cuckooAnimation.apply(artboard);
    } else {
      _timeAnimation.apply(_now.second / 60 + _now.minute + _now.hour * 60,
          artboard, _dontMixAnimations);
    }
    return true;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}

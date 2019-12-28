import 'package:flare_dart/math/mat2d.dart' show Mat2D;

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

class RiveAnimationController extends FlareController {
  RiveAnimationController(String _temperature);

  static const double _dontMixAnimations = 1.0;
  static DateTime _now;
  static ActorNode _temperature;
  static ActorAnimation _timeAnimation;

  static FlareAnimationLayer _cuckooAnimation;
  static FlareAnimationLayer _steam;

  @override
  void initialize(FlutterActorArtboard artboard) {
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

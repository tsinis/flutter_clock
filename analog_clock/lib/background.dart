import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';

class RiveAnimationController extends FlareControls {
  static const double _dontMixAnimations = 1;
  static double _animationTime = 0;
  static DateTime _now;
  static ActorNode _temperature;
  static ActorAnimation _cuckooAnimation;
  static ActorAnimation _timeAnimation;

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    _temperature = artboard.getNode('thermometer_liquid');
    _timeAnimation = artboard.getAnimation('time');
    _cuckooAnimation = artboard.getAnimation('cuckoo');
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _now = DateTime.now();
    _temperature.y = -(0).toDouble();
    if (_now.minute == 0) {
      _animationTime += elapsed;
      _cuckooAnimation.apply(_animationTime, artboard, _dontMixAnimations);
    } else {
      _animationTime = 0;
      _timeAnimation.apply(_now.second / 60 + _now.minute + _now.hour * 60,
          artboard, _dontMixAnimations);
    }
    return true;
  }
}

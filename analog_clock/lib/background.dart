import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/widgets.dart';

const String _timeAnimationName = 'min_sec';
const String _dayNightAnimationName = 'hour_day';

class RiveAnimation extends StatefulWidget {
  @override
  _RiveAnimationState createState() => _RiveAnimationState();
}

class _RiveAnimationState extends State<RiveAnimation> {
  _AnimationController _animationController = _AnimationController();

  @override
  Widget build(BuildContext context) {
    return FlareActor('assets/FlutterClock.flr',
        animation: 'background', controller: _animationController);
  }
}

class _AnimationController extends FlareControls {
  static ActorAnimation _dayNightAnimation;
  static ActorAnimation _timeAnimation;

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    play('thermometer');
    _dayNightAnimation = artboard.getAnimation(_dayNightAnimationName);
    _timeAnimation = artboard.getAnimation(_timeAnimationName);
    play(_dayNightAnimationName);
    play(_timeAnimationName);
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    final DateTime _now = DateTime.now();
    _timeAnimation.apply(_now.second / 60 + _now.minute, artboard, 1.0);
    _dayNightAnimation.apply(_now.minute / 60 + _now.hour, artboard, 1.0);
    return true;
  }
}

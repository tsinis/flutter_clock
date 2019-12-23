import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/widgets.dart';

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
  static ActorAnimation _timeAnimation;
  ActorAnimation _cuckooAnimation;

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    _timeAnimation = artboard.getAnimation('time');
    _cuckooAnimation = artboard.getAnimation('cuckoo');
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    final DateTime _now = DateTime.now();
    (_now.minute == 0)
        ? _cuckooAnimation.apply(
            _now.millisecond / 1000 + _now.second, artboard, 1.0)
        : _timeAnimation.apply(
            _now.second / 60 + _now.minute + _now.hour * 60, artboard, 1.0);
    return true;
  }
}

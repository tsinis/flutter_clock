import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/widgets.dart';

// Define Rive time nimation name inside our .FLR file (60 min. long, in my case).
const String _timeAnimationName = 'min_sec';
// Define Rive day-night nimation name inside our .FLR file (23 sec. long, in my case).
const String _dayNightAnimationName = 'hour_day';

// Wrap animation with standart StatefulWidget so we can sync our animation with world time.
class BackgroundAnimation extends StatefulWidget {
  @override
  _BackgroundAnimationState createState() => _BackgroundAnimationState();
}

// Define path to animation file, animation name and of course controller,
// because all the magics with time sync. happens in that controller.
class _BackgroundAnimationState extends State<BackgroundAnimation> {
  _AnimationController _animationController = _AnimationController();

  @override
  Widget build(BuildContext context) {
    return FlareActor('assets/FlutterClock.flr',
        animation: _timeAnimationName, controller: _animationController);
  }
}

// Animation controller setup.
class _AnimationController extends FlareControls {
  ActorAnimation _dayNightAnimation; // To store day-nighy animation.
  ActorAnimation _timeAnimation; // To store time animation.
  // double _time; // To sync time in animation with with real time, once per hour

// Initialize our animation control.
  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    _dayNightAnimation = artboard.getAnimation(_dayNightAnimationName);
    play(_dayNightAnimationName);
    _timeAnimation = artboard.getAnimation(_timeAnimationName); // Store animation so we can controll it.
    // _time = (DateTime.now()).second + (DateTime.now().minute * 60) - 0.1; // Get real world time for syncing once per hour.
  }

// All control of animation state is running here, animation will not start at zero point
// as ussually, but from real world minute, second and millisecond via .apply.
  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    final DateTime _now = DateTime.now();
    // _time += elapsed; // Animation will start from point of real world minute and second.
    // If time is on the end (of 59min and 59sec) we will end animation
    // and initialize it again, so we can sync time.
    // if (_time > _timeAnimation.duration) {
    //   elapsed = 0.0;
    //   initialize(artboard);
    // }
    // Remove code below and uncomment code in Controller if you
    // need animation to sync time only once per hour.
    _timeAnimation.apply(_now.millisecond / 1000 + _now.second + _now.minute * 60,
        artboard, 1.0);
    _dayNightAnimation.apply(_now.minute / 60 + _now.hour,
        artboard, 1.0);
    // _timeAnimation.apply(_time, artboard, 1.0);
    return true;
  }
}

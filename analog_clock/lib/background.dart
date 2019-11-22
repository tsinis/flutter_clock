import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/widgets.dart';

// Define Flare animation name inside our .FLR file, that should be 60 min long.
const String _animationName = 'Untitled';

// Wrap animation with standart StatefulWidget so we can sync our animation from time to time.
// So it won't do much background work for syncing. Our actual time is synecd every second
// background is not that important and will be synced every hour. You may create a shorter
// animation and adapt your code in _AnimationController below.
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
    return FlareActor('assets/background.flr',
        animation: _animationName, controller: _animationController);
  }
}

// Animation controller setup.
class _AnimationController extends FlareControls {
  ActorAnimation _animation; // To store animation.
  double _time; // To sync time in animation with with real time.

// Initialize our animation control.
  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    _animation = artboard.getAnimation(_animationName); // Store animation so we can controll it.
    _time = (DateTime.now()).second + (DateTime.now().minute * 60) - 0.1; // Get real world time.
  }

// All control of animation state is running here, animation will not start at zero point
// as ussually, but from real world minute and second via .apply.
  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _time += elapsed; // Animation will start from point of real world minute and second.
    // If time is on the end (of 59min and 59sec) we will end animation
    // and initialize it again, so we can sync time.
    if (_time > _animation.duration) {
      elapsed = 0.0;
      initialize(artboard);
    }
    _animation.apply(_time, artboard, 1.0);
    return true;
  }
}

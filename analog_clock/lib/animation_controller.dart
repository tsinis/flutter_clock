// Copyright 2020, Roman Cinis. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flare_dart/math/mat2d.dart' show Mat2D;

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

import 'temperature_converter.dart' show mercuryPosition;

class TimeAnimationController extends FlareController {
  TimeAnimationController({this.temperature, this.weather});

  String weather, temperature;

  // Some animations are more complex then others, and need to be controlled
  // frame by frame (bubbles in thermometer and cuckoo bird) in another layer.
  static FlareAnimationLayer _bubbles, _cuckoo;

  // Other animations are pretty simple, we can control them by some real data.
  static ActorAnimation _weather, _time;

  // Animations not mixing together here. Declaring human readable variable.
  static const double _dontMixAnimations = 1.0;

  // Grabbing real world time from device same way as Google did in their code.
  static DateTime _now;

  // Mercury position in thermometer will not stay still, as temperature
  // changes, so we have it's Node on artboard, that can be moved up and down.
  static ActorNode _thermometer;

  @override
  void initialize(FlutterActorArtboard artboard) {
    _thermometer = artboard.getNode('thermometer_mercury_position');

    _time = artboard.getAnimation('time');

    _cuckoo = FlareAnimationLayer()
      ..animation = artboard.getAnimation('cuckoo')
      ..mix = _dontMixAnimations;

    _bubbles = FlareAnimationLayer()
      ..animation = artboard.getAnimation('thermometer_bubbles')
      ..mix = _dontMixAnimations;
  }

  @override
  // This method is called every time when frame is updated.
  // Elapsed is time passed from one frame to another.
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    // Weather animations just have 1 frame: show actual condition / hide other
    // condition icons. So it's ОК to pass zero as current time for animation.
    _weather = artboard.getAnimation(weather);
    _weather.apply(0, artboard, _dontMixAnimations);

    // Moving thermometer mercury in Y axis by temperature from Helper package.
    _thermometer.y = mercuryPosition(temperature);

    // Thermometer bubbles have short but very complex animation, we can't run
    // as background animation. Let's play it here in a loop (with % operator).
    _bubbles.time = (_bubbles.time + elapsed) % _bubbles.duration;
    _bubbles.apply(artboard);

    _now = DateTime.now();
    if (_now.minute == 0) {
      // Cuckoo bird animation is one minute long. It stops time animation,
      // and showing itself at beginning of every hour.
      _cuckoo.time = _cuckoo.time + elapsed;
      _cuckoo.apply(artboard);
    } else {
      // Time animation is 24 minutes long, and it's speed is just 1FPS.
      // It's enough for time: passing real second as animation millisecond,
      // real minute as animation's second and real hour as animation's minute.
      // Updating it every second, so time is accurate.
      _time.apply(_now.second / 60 + _now.minute + _now.hour * 60, artboard,
          _dontMixAnimations);
    }
    return true;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}

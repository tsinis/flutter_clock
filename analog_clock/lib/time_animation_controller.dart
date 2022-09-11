// Copyright 2022, Roman Cinis. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:clock/clock.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter_clock_helper/model.dart';

import 'temperature_converter.dart';

/// Main animation controller, that will manage states with default Rive tools.
class TimeAnimationController extends FlareController {
  final ClockModel _model;

  /// Some animations are more complex then others, and need to be controlled
  /// frame by frame (bubbles in thermometer and cuckoo bird) in another layer.
  late FlareAnimationLayer _bubbles;
  late FlareAnimationLayer _cuckoo;

  /// Other animations are pretty simple, we can control them by some real data.
  late final ActorAnimation? _time;
  // ignore: unused_field, because it's false positive.
  late ActorAnimation? _weather;

  /// Animations not mixing together here. Declaring human readable variable.
  static const double _dontMixAnimations = 1;

  /// Grabbing real world time from device same way as Google did in their code.
  DateTime _now = clock.now();

  /// Mercury position in thermometer will not stay still, as temperature
  /// changes, so we have it's Node on artboard, that can be moved up and down.
  late ActorNode? _thermometer;

  /// [ClockModel] temperature and units are required.
  TimeAnimationController(this._model);

  /// Initialize all the animations and layers here.
  @override
  void initialize(FlutterActorArtboard artboard) {
    final bubbles = artboard.getAnimation('thermometer_bubbles');
    final cuckoo = artboard.getAnimation('cuckoo');

    if (cuckoo == null || bubbles == null) {
      return;
    }

    _thermometer = artboard.getNode('thermometer_mercury_position');
    _time = artboard.getAnimation('time');

    _cuckoo = FlareAnimationLayer(cuckoo.name, cuckoo)
      ..mix = _dontMixAnimations;

    _bubbles = FlareAnimationLayer(bubbles.name, bubbles)
      ..mix = _dontMixAnimations;
  }

  /// This method is called every time when frame is updated.
  /// Elapsed is time passed from one frame to another.
  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    // Weather animations just have 1 frame: show actual condition / hide other
    // condition icons. So it's ОК to pass zero as current time for animation.
    _weather = artboard.getAnimation(
      _model.weatherString,
    )?..apply(0, artboard, _dontMixAnimations);

    /// Moving thermometer mercury in Y axis by temperature from Helper package.
    _thermometer?.y = mercuryPosition(_model.temperature, _model.unit);

    /// Thermometer bubbles have short but very complex animation, we can't run
    /// as background animation. Let's play it here in a loop (with % operator).
    _bubbles
      ..time = (_bubbles.time + elapsed) % _bubbles.duration
      ..apply(artboard);

    _now = clock.now();
    if (_now.minute == 0) {
      /// Cuckoo bird animation is one minute long. It stops time animation,
      /// and showing itself at beginning of every hour.
      _cuckoo
        ..time = (_cuckoo.time + elapsed) % _cuckoo.duration
        ..apply(artboard);
    } else {
      /// Time animation is 24 minutes long, and it's speed is just 1FPS.
      /// It's enough for time: passing real second as animation millisecond,
      /// real minute as animation's second and real hour as animation's minute.
      /// Updating it every second, so time is accurate.
      _time?.apply(
        _now.second / 60 + _now.minute + _now.hour * 60,
        artboard,
        _dontMixAnimations,
      );
    }

    return true;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}

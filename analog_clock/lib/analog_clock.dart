// Copyright 2020, Roman Cinis. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

import 'package:flare_flutter/flare_actor.dart';

import 'animation_controller.dart';

// Most code here comes as default Google code for analog clock and working
// with their helper package. Adding Rive (Flare) animation Controller, changes
// are just in those two methods: _updateModel (slightly) + build (completely).
class AnalogClock extends StatefulWidget {
  const AnalogClock(this.model);

  final ClockModel model;

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  // Removing unused variables and declare a Controller for Rive animations.
  static final TimeAnimationController _animationController =
      TimeAnimationController(temperature: '22.0°C', weather: 'sunny');

  @override
  void didUpdateWidget(AnalogClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    widget.model.removeListener(_updateModel);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateModel();
  }

  // Passes temperature and weather to animation controller directly.
  void _updateModel() {
    setState(
      () {
        _animationController.temperature = widget.model.temperatureString;
        _animationController.weather = widget.model.weatherString;
      },
    );
  }

  // Play background animation in loop, control other animations in Controller.
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFD1C6BD)
          : const Color(0xFF1A120D),
      child: FlareActor('assets/FlutterClock.flr',
          animation: 'background', controller: _animationController),
    );
  }
}

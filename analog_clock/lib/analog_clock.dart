// Copyright 2020, Roman Cinis. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';

import 'animation_controller.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock(this.model);

  final ClockModel model;

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  static String _condition = 'sunny';
  static String _temperature = '22.0°C';

  RiveAnimationController _animationController = RiveAnimationController(
      temperatureFromHelper: _temperature, conditionFromHelper: _condition);

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

  void _updateModel() {
    setState(
      () {
        _animationController.temperatureFromHelper =
            widget.model.temperatureString;
        _animationController.conditionFromHelper = widget.model.weatherString;
      },
    );
  }

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

// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';
// import 'package:intl/intl.dart';

import 'background.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock(this.model);
  final ClockModel model;

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  // var _temperature = '';
  // var _condition = '';

  // @override
  // void initState() {
  //   super.initState();
  // widget.model.addListener(_updateModel);
  // _updateModel();
  // }

  // @override
  // void didUpdateWidget(AnalogClock oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.model != oldWidget.model) {
  //     oldWidget.model.removeListener(_updateModel);
  //     widget.model.addListener(_updateModel);
  //   }
  // }

  // @override
  // void dispose() {
  //   widget.model.removeListener(_updateModel);
  //   super.dispose();
  // }

  // void _updateModel() {
  //   setState(() {
  //     _temperature = widget.model.temperatureString;
  //     _condition = widget.model.weatherString;
  //   });
  // }
  RiveAnimationController _animationController = RiveAnimationController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFD1C6BD)
          : const Color(0xFF1D130A),
      child: FlareActor('assets/FlutterClock.flr',
          animation: 'background', controller: _animationController),
    );
  }
}

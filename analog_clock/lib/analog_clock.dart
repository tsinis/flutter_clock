// Copyright 2020, Roman Cinis. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_clock_helper/model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'animation_controller.dart';

final AssetProvider assetProvider =
    AssetFlare(bundle: rootBundle, name: 'assets/FlutterClock.flr');

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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFD1C6BD)
          : const Color(0xFF291C13),
      child: FlareCacheBuilder(
        [assetProvider],
        builder: (context, bool _isWarm) {
          return !_isWarm
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                        backgroundColor: Colors.brown[200]),
                    SizedBox(height: 10.0),
                    Text(
                      'Loading animations...',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w200),
                    ),
                  ],
                )
              // Loop background animation & control others in Controller.
              : FlareActor('assets/FlutterClock.flr',
                  animation: 'background', controller: _animationController);
        },
      ),
    );
  }
}

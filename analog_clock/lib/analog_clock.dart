// Copyright 2022, Roman Cinis. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_clock_helper/model.dart';

import 'time_animation_controller.dart';

/// Animation asset to cache and pass into [FlareActor].
final AssetProvider assetProvider = AssetFlare(
  name: 'assets/FlutterClock.flr',
  bundle: rootBundle,
);

/// Most code here comes as default Google code for analog clock and working
/// with their helper package. Adding Rive (Flare) animation Controller, changes
/// are just in those two methods: _updateModel (slightly) + build (completely).
class AnalogClock extends StatelessWidget {
  final ClockModel _model;

  /// Requires selected [ClockModel] to pass in animation and manage it there.
  const AnalogClock(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Color(
          Theme.of(context).brightness == Brightness.light
              ? 0xFFD1C6BD
              : 0xFF291C13,
        ),
        child: FlareCacheBuilder(
          [assetProvider],
          builder: (_, isWarm) => !isWarm

              /// Show loading indicator if animation is not cached yet.
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.brown[200],
                  ),
                )

              /// Loop background animation & control others in Controller.
              : FlareActor(
                  'assets/FlutterClock.flr',
                  animation: 'background',
                  controller: TimeAnimationController(_model),
                ),
        ),
      );
}

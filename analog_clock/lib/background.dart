import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  @override
  _BackgroundState createState() => _BackgroundState();
}
class _BackgroundState extends State<Background> {

  @override
  Widget build(BuildContext context) {
    return FlareActor("assets/background.flr", animation: "Untitled");
  }
}

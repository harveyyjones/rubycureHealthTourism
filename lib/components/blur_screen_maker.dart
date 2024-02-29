import 'dart:ui';

import 'package:flutter/material.dart';

class BlueScreenMaker extends StatelessWidget {
  BlueScreenMaker(
      {Key? key,
      required this.xAxis,
      required this.yAxis,
      required this.height,
      required this.width,
      required this.child})
      : super(key: key);
  var xAxis;
  var yAxis;
  var height;
  var width;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: xAxis, sigmaY: yAxis),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.1),
          border: Border.all(
            color: Colors.white24,
            width: 2,
          ),
        ),
        padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        child: child,
      ),
    );
  }
}
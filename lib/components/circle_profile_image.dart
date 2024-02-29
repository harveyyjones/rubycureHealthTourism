import 'package:flutter/material.dart';
import 'package:oxford_travel_app/helpers.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage(this.number);
  int number;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth / 3.5,
        child: Center(child: Image.asset("lib/assets/doctor${number}.png")));
  }
}

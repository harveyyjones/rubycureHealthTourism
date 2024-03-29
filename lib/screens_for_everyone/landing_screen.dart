


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oxford_travel_app/helpers.dart';
import 'package:oxford_travel_app/screens_for_everyone/login_page.dart';
import 'package:oxford_travel_app/screens_for_everyone/register_%20page.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f9ff),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight / 4.5,
            ),
            Text(
              "Welcome to",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            Text(
              "rubycure.",
              style: GoogleFonts.playfairDisplay(
                  fontSize: 100.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight / 4,
            ),
            GeneralButton("Login", LoginPage()),
            SizedBox(
              height: screenHeight / 20,
              child: Center(
                child: Text(
                  "or",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            GeneralButton("Register", RegisterPage()),
          ],
        ),
      ),
    );
  }
}

class GeneralButton extends StatelessWidget {
  GeneralButton(this.text, this.route);
  String? text;
  var route;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => route,
      )),
      child: Container(
        child: Center(
          child: Text(text.toString(),
              style: GoogleFonts.poppins(
                  fontSize: 33.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            )),
        width: screenWidth / 2.5,
        height: screenHeight / 12,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers.dart';

class CarouselSliderItem extends StatelessWidget {
  CarouselSliderItem({required this.url, required this.text});
  String url;
  String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(
              width: screenWidth / 1.3,
              // height: screenHeight / 4.3,
              fit: BoxFit.cover,
              image: NetworkImage(url)),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(93, 0, 0, 0)),
          width: screenWidth / 1.3,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 18, top: screenHeight / 48),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        )
      ],
    );
  }
}

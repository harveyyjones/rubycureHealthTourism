import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../card_for_clinics_detail.dart';
import '../helpers.dart';

class CardForClinics extends StatefulWidget {
  CardForClinics(
      {this.imageURL,
      this.name,
      this.clinicName,
      this.title,
      this.uid,
      this.bio,
      this.clinicLocation});
  String? imageURL;
  String? name;
  String? clinicName;
  String? title;
  String? uid;
  String? bio;
  String? clinicLocation;

  @override
  State<CardForClinics> createState() => _CardForClinicsState();
}

class _CardForClinicsState extends State<CardForClinics> {
  var rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Color.fromARGB(63, 158, 158, 158),
              offset: Offset(10, 15),
            )
          ]),
      width: screenWidth / 2.5,
      height: screenHeight / 3.3,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(),
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CardForClinicsDetail(
                name: widget.name,
                clinicLocation: widget.clinicLocation,
                clinicName: widget.clinicName,
                profilePhotoURL: widget.imageURL,
                title: widget.title,
                uid: widget.uid,
                bio: widget.bio,
              ),
            )),
            child: Container(
              padding: EdgeInsets.only(top: screenHeight / 66),
              // color: Colors.blue,
              // width: 300,
              // height: screenHeight / 4,
              child: CircleAvatar(
                  radius: 90.sp,
                  backgroundImage: NetworkImage(widget.imageURL.toString())),
            ),
          ),
          SizedBox(
            height: screenHeight / 55,
          ),
          Container(
            width: screenWidth / 3,
            height: screenHeight / 17,
            // color: Colors.red,
            child: Text(widget.clinicName.toString(),
                softWrap: true,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    height: 1.2, fontSize: 30.sp, fontWeight: FontWeight.w400)),
          ),
          Text(widget.title.toString(),
              softWrap: true,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 20.sp, fontWeight: FontWeight.w500)),
          // Container(
          //   height: screenHeight / 21,
          //   width: screenWidth / 2,
          //   // color: Colors.red,
          //   //  color: Colors.purple,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Text(
          //         widget.clinicName.toString(),
          //         softWrap: true,
          //         textAlign: TextAlign.center,
          //         style: TextStyle(fontSize: 25.sp),
          //       )
          //     ],
          //   ),
          // )
          SizedBox(
            height: screenHeight / 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Contact",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 25.sp, fontWeight: FontWeight.w600)),
              Icon(
                Icons.arrow_back_ios,
                textDirection: TextDirection.rtl,
              )
            ],
          ),
        ],
      ),
    );
  }
}

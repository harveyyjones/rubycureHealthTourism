import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oxford_travel_app/Business_Logic/firestore_database_service.dart';
import 'package:oxford_travel_app/helpers.dart';
import 'package:oxford_travel_app/home_page.dart';
import 'package:oxford_travel_app/steppers_for_clients.dart';
import 'package:oxford_travel_app/steppers_for_clinic_owners.dart';


class YouAreAPage extends StatefulWidget {
  const YouAreAPage({Key? key}) : super(key: key);

  @override
  State<YouAreAPage> createState() => _YouAreAPageState();
}

class _YouAreAPageState extends State<YouAreAPage> {
  FirestoreDatabaseService _firestoreDatabaseService =
      FirestoreDatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight / 23,
          ),
          Text("You are a", style: TextStyle(fontSize: 50.sp)),
          SizedBox(
            height: screenHeight / 33,
          ),
          Center(
            child: InkWell(
              onTap: () {
                _firestoreDatabaseService.updateClinicOwnerStatus(true);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SteppersForClinicOwners(),
                ));
              },
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 223, 223),
                      borderRadius: BorderRadius.circular(13)),
                  width: screenWidth / 2,
                  height: screenHeight / 3,
                ),
                SizedBox(
                    width: screenWidth / 2,
                    child: const Image(
                        image: AssetImage("lib/assets/youareapagedoctor.png"))),
                Positioned(
                    bottom: screenHeight / 77,
                    left: screenWidth / 7.2,
                    child: Text(
                      "Clinic Owner",
                      style: TextStyle(fontSize: 30.sp),
                    ))
              ]),
            ),
          ),
          SizedBox(
            height: screenHeight / 22,
          ),
          Text(
            "Or",
            style: TextStyle(fontSize: 35.sp),
          ),
          SizedBox(
            height: screenHeight / 22,
          ),
          Center(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SteppersForClients(),
              )),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 223, 223),
                      borderRadius: BorderRadius.circular(13)),
                  width: screenWidth / 2,
                  height: screenHeight / 3,
                ),
                Container(
                    width: screenWidth / 2,
                    child: const Image(
                        image: AssetImage("lib/assets/youareapagegirl.png"))),
                Positioned(
                    bottom: screenHeight / 77,
                    left: screenWidth / 5.6,
                    child: Text(
                      "Patient",
                      style: TextStyle(fontSize: 30.sp),
                    ))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oxford_travel_app/Business_Logic/firestore_database_service.dart';
import 'package:oxford_travel_app/components/card_for_clinics.dart';
import 'package:oxford_travel_app/components/carousel_slider_item.dart';
import 'package:oxford_travel_app/components/shimmer.dart';
import 'package:oxford_travel_app/helpers.dart';
import 'package:shimmer/shimmer.dart';
import 'components/bottom_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

var anan;

class _HomePageState extends State<HomePage> {
  GlobalKey _globalKeyForCommercial = GlobalKey();
  var widthForCommercialFilter;
  var heightForCommercialFilter;
  FirestoreDatabaseService _firestoreDatabaseService =
      FirestoreDatabaseService();
  @override
  Widget build(BuildContext context) {
    List<Widget> _carouselSliderItems = [
      CarouselSliderItem(
          url:
              "https://i.pinimg.com/564x/5f/f7/b6/5ff7b6be0001b14c0fd87b976fc16a0e.jpg",
          text:
              "Istanbul, Turkey \nWith more than 10K experts, our choice. \nSee Now."),
      CarouselSliderItem(
          url:
              "https://i.pinimg.com/564x/a2/96/7c/a2967c8bff8b2ff5c890ce84af154753.jpg",
          text:
              "Fethiye, Turkey \nWith more than 10K experts, our choice. \nSee Now."),
      CarouselSliderItem(
        url:
            "https://i.pinimg.com/564x/c6/1c/49/c61c49db0c9e57895e90dcb72ebc893b.jpg",
        text:
            "Antalya, Turkey \nWith more than 10K experts, our choice. \nSee Now.",
      )
    ];
    return Material(
      child: FutureBuilder(
          future: _firestoreDatabaseService.getUserData(),
          builder: (context, snapshot2) => snapshot2.hasData
              ? Scaffold(
                  bottomNavigationBar: snapshot2.data!.clinicOwner ?? true
                      ? BottomBar(
                          selectedIndex: 0,
                        )
                      : BottomBar(selectedIndex: 0),
                  backgroundColor: Color(0xfff2f9ff),
                  body: FutureBuilder(
                    future: _firestoreDatabaseService.getAllUsersData(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenHeight / 9,
                                child: Center(
                                  child: Row(
                                    children: [
                                      SizedBox(width: screenWidth / 20),
                                      Text(
                                        "rubycure.",
                                        style: GoogleFonts.playfairDisplay(
                                            fontSize: 40.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: screenWidth / 10),
                                      Text(
                                        "Good ${_firestoreDatabaseService.greeting()} ${snapshot2.data!.name}",
                                        style: GoogleFonts.poppins(
                                            color:
                                                Color.fromARGB(255, 71, 70, 70),
                                            fontSize: 31.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: CarouselSlider(
                                    items: [..._carouselSliderItems],
                                    options: CarouselOptions(
                                        autoPlay: true,
                                        enableInfiniteScroll: true,
                                        enlargeCenterPage: true,
                                        autoPlayAnimationDuration:
                                            Duration(seconds: 2),
                                        autoPlayInterval:
                                            const Duration(seconds: 8),
                                        height: screenHeight / 5)),
                              ),
                              SizedBox(
                                height: screenHeight / 20 as double,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 25),
                                  child: Divider(
                                    endIndent: screenWidth / 9,
                                    indent: screenWidth / 9,
                                    height: screenWidth / 2,
                                    thickness: 1,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: screenWidth / 33,
                                  right: screenWidth / 33,
                                ),
                                child: Container(
                                  // color: Colors.amber,
                                  width: screenWidth / 1,
                                  height: allClinicOwnersList.length * 300,
                                  child: GridView.builder(
                                    primary: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Center(
                                          child: CardForClinics(
                                        clinicLocation:
                                            snapshot.data[index].clinicLocation,
                                        uid: snapshot.data[index].userId,
                                        clinicName:
                                            snapshot.data[index].clinicName,
                                        imageURL: snapshot
                                            .data[index].profilePhotoURL,
                                        name: snapshot.data[index].name,
                                        title: snapshot.data[index].majorInfo,
                                        bio: snapshot.data[index].biography,
                                      ));
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent:
                                          screenHeight / 3 as double,
                                      mainAxisSpacing: 0, //screenlHeight / 20,
                                      crossAxisCount: 2,
                                    ),
                                    itemCount: allClinicOwnersList.length,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          width: screenWidth,
                          height: screenHeight,
                          child: Expanded(
                            child: Column(children: [
                              SizedBox(
                                height: screenHeight / 22,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Shimmer.fromColors(
                                    baseColor:
                                        Color.fromARGB(255, 224, 224, 224),
                                    highlightColor: Colors.white,
                                    child: Container(
                                      width: screenWidth / 1.5,
                                      height: screenHeight / 8,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 224, 224, 224),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenHeight / 10,
                              ),
                              Expanded(
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(
                                      left: screenWidth / 22,
                                      right: screenHeight / 22),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: screenWidth / 33,
                                    mainAxisSpacing: screenHeight / 20,
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: 6,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Shimmer.fromColors(
                                      baseColor:
                                          Color.fromARGB(255, 224, 224, 224),
                                      highlightColor: Colors.white,
                                      child: Container(
                                        width: screenWidth / 4,
                                        height: screenHeight / 4,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 224, 224, 224),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ]),
                          ),
                        );
                      }
                    },
                  ))
              : ShimmerForHomePage()),
    );
  }
}

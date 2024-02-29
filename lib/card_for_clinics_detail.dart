import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oxford_travel_app/helpers.dart';
import 'package:oxford_travel_app/screens_for_everyone/chat_screen.dart';
import '../business_logic/firestore_database_service.dart';
import 'components/bottom_bar.dart';

class CardForClinicsDetail extends StatefulWidget {
  CardForClinicsDetail(
      {super.key,
      this.name,
      this.profilePhotoURL,
      this.clinicName,
      this.title,
      this.uid,
      this.bio,
      this.clinicLocation});
  String? name;
  String? uid;
  String? profilePhotoURL;

  String? clinicName;
  String? title;
  String? clinicLocation;
  String? bio;
  @override
  State<CardForClinicsDetail> createState() => _CardForClinicsDetailState();
}

class _CardForClinicsDetailState extends State<CardForClinicsDetail> {
  String get text => "Message";
  final FirestoreDatabaseService _serviceForSnapshot =
      FirestoreDatabaseService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _serviceForSnapshot.getUserData(),
        builder: (context, snapshot) => snapshot.hasData
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xfff2f9ff),
                  shadowColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                ),
                backgroundColor: const Color(0xfff2f9ff),
                bottomNavigationBar: snapshot.data!.clinicOwner ?? true
                    ? BottomBar(
                        selectedIndex: 0,
                      )
                    : null,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      FutureBuilder(
                          future: _serviceForSnapshot
                              .getUserDataForDetailPage(widget.uid),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                width: screenWidth,

                                // color: Color(0xffecfeff),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          //  color: Colors.amber,
                                          height: screenHeight / 2.4,
                                        ),
                                        // Container(
                                        //   child: Container(
                                        //     color: Colors.amber,
                                        //     child: ClipRRect(
                                        //       borderRadius:
                                        //           BorderRadius.circular(5),
                                        //       child: Image(
                                        //           width: screenWidth,
                                        //           height: screenHeight / 4,
                                        //           fit: BoxFit.cover,
                                        //           image: NetworkImage(
                                        //               "https://i.pinimg.com/564x/67/ed/fe/67edfe57c3c518ca158c35d4b9a77215.jpg")),
                                        //     ),
                                        //   ),
                                        // ),
                                        Positioned(
                                          top: screenHeight / 10,
                                          left: screenWidth / 3.7,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            child: Image(
                                                width: screenWidth / 2,
                                                fit: BoxFit.fill,
                                                image: NetworkImage(widget
                                                    .profilePhotoURL
                                                    .toString())),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight / 60,
                                    ),
                                    // ******************** isim ***********************
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(widget.name.toString(),
                                            style: GoogleFonts.poppins(
                                              color: Color(0xff415158),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 50.sp,
                                            )),
                                        Container(
                                          height: screenHeight / 13,
                                          child: InkWell(
                                            onTap: () => Navigator.of(context)
                                                .push(CupertinoPageRoute(
                                              builder: (context) => ChatScreen(
                                                  widget.uid.toString(),
                                                  widget.profilePhotoURL!, widget.name!),
                                            )),
                                            child: Stack(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              children: [
                                                AspectRatio(
                                                  aspectRatio: 1,
                                                  child: Container(
                                                    height: screenHeight / 12,
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              blurRadius: 12,
                                                              color: Color
                                                                  .fromARGB(
                                                                      37,
                                                                      174,
                                                                      174,
                                                                      174),
                                                              offset:
                                                                  Offset(2, 4),
                                                              spreadRadius: 4)
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: screenWidth / 100),
                                                  child: Image.asset(
                                                      scale: 1,
                                                      fit: BoxFit.fitWidth,
                                                      width: screenWidth / 11,
                                                      "lib/assets/paper_plane.png"),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight / 35,
                                    ),
                                    // ********** BİYOGRAFİ *********
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 55),
                                      child: Text(widget.bio.toString(),
                                          softWrap: true,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 26.sp,
                                          )),
                                    ),
                                    SizedBox(
                                      height: screenHeight / 122,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: screenWidth / 10,
                                          height: screenHeight / 44,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                right: screenWidth / 77,
                                                top: screenHeight / 30),
                                            //*********** Klinik İsmi *********************
                                            child: Text(
                                                widget.clinicName.toString(),
                                                softWrap: true,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 26.sp,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth / 17,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth / 10,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth / 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                right: screenWidth / 77),
                                            //   ****************** Unvan ************
                                            child: Text(widget.title.toString(),
                                                softWrap: true,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 26.sp,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth / 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                right: screenWidth / 77),
                                            //   color: Colors.black,
                                            child: Text(
                                                widget.clinicLocation
                                                    .toString(),
                                                softWrap: true,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 26.sp,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight / 22,
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
                      // ******************** Postlar burada başlıyor. **********************
                      StreamBuilder(
                          stream: _serviceForSnapshot
                              .getAllSharedPostsForCardDetails(widget.uid),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              QuerySnapshot querySnapshot =
                                  snapshot.data as QuerySnapshot;
                              return SizedBox(
                                // color: Colors.amber,
                                width: screenWidth / 1.4,
                                height: querySnapshot.docs.length * 760,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: querySnapshot.docs.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot documentSnapshot =
                                        querySnapshot.docs[index];
                                    return Column(
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          // color: Colors.red,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(16),
                                                    topLeft:
                                                        Radius.circular(16)),
                                            child: Expanded(
                                              child: Image(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    documentSnapshot[
                                                        "sharedPost"]),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          // color: Colors.red,
                                          height: screenHeight / 8,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 221, 219, 219),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(16),
                                                  bottomRight:
                                                      Radius.circular(16))),

                                          child: Padding(
                                            padding: const EdgeInsets.all(30),
                                            child: Center(
                                              child: Text(
                                                documentSnapshot["caption"],
                                                style:
                                                    TextStyle(fontSize: 25.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight / 16,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          })
                    ],
                  ),
                ),
              )
            : CircularProgressIndicator());
  }
}

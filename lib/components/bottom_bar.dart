import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oxford_travel_app/Business_Logic/firestore_database_service.dart';
import 'package:oxford_travel_app/client_specific_screens/own_profile_screens_for_clients.dart';
import 'package:oxford_travel_app/helpers.dart';
import 'package:oxford_travel_app/home_page.dart';
import 'package:oxford_travel_app/own_profile_screen.dart';
import 'package:oxford_travel_app/screens_for_everyone/message_box.dart';

class BottomBar extends StatefulWidget {
  int selectedIndex;

  BottomBar({super.key, required this.selectedIndex});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  FirestoreDatabaseService _firestoreDatabaseService =
      FirestoreDatabaseService();
  var _index = 0;

  final List _pagesToNavigateToForClinicOwners = [
    HomePage(),
    OwnProfileScreen(),
    MessageScreen()
  ];

  final List _pagesToNavigateToForClients = [
    // TODO: Bunlar zamanla artacak, müşterilerde kendi profillerini falan oluşturacak.
    HomePage(),
    OwnProfileScreenForClients(),
    MessageScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff2f9ff),
      height: screenHeight / 14,
      child: FutureBuilder(
        future: _firestoreDatabaseService.getUserData(),
        builder: (context, snapshot) => BottomNavigationBar(
            backgroundColor: Color(0xfff2f9ff),
            selectedItemColor: Colors.blue,
            selectedFontSize: 0,
            currentIndex: widget.selectedIndex,
            onTap: (value) {
              _index = value;
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                if (snapshot.data!.clinicOwner == false) {
                  return _pagesToNavigateToForClients[value];
                } else {
                  return _pagesToNavigateToForClinicOwners[value];
                }
              }), (route) => false);
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    size: 60.sp,
                  ),
                  label: "Home",
                  icon: Icon(
                    size: 50.sp,
                    Icons.home,
                    color: Colors.black,
                  )),
              // BottomNavigationBarItem(
              //     activeIcon: Icon(
              //       Icons.notifications_none_outlined,
              //       size: 60.sp,
              //     ),
              //     label: "Notifications",
              //     icon: Icon(
              //       size: 50.sp,
              //       Icons.notifications_none_outlined,
              //       color: Colors.black,
              //     )),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.person,
                    size: 60.sp,
                  ),
                  label: "Profile",
                  icon: Icon(
                    size: 50.sp,
                    Icons.person,
                    color: Colors.black,
                  )),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.message,
                    size: 60.sp,
                  ),
                  label: "Profile",
                  icon: Icon(
                    size: 50.sp,
                    Icons.message,
                    color: Colors.black,
                  )),
            ]),
      ),
    );
  }
}

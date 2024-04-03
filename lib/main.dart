import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oxford_travel_app/screens_for_everyone/landing_screen.dart';
import 'package:oxford_travel_app/steppers_for_clients.dart';

import 'home_page.dart';

// WARNING: This codebase were created for web. For If you are a mobile app developer please contact this e mail for more information. omergencbtf@gmail.com .
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAOFCClrhrqLflthWhyEh7dk13hXg0e3E8",
          appId: "1:405112698216:android:dc6ac63e009dd49482d2dd",
          messagingSenderId: "405112698216",
          projectId: "rubycure-db970",
          storageBucket: "gs://rubycure-db970.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(720, 1080),
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Rubycure',
            home: FutureBuilder<User?>(
                future: Future.value(getCurrentUser()),
                builder: (BuildContext context,
                    AsyncSnapshot<FutureOr<User?>> snapshot) {
                  if (snapshot.hasData) {
                    FutureOr<User?>? user =
                        snapshot.data; // bu senin kullanıcı örneğin.
                    /// burada kullanıcı oturum açmış.
                    print(
                        "************************************************************");
                    print("Şu anda bir oturum açık: ${currentUser?.uid}");

                    // return LoginPage();
//                     return ElevatedButton(
//                         onPressed: () {
// // Oturumu silme metodu.

//                           void deleteAccount() async {
//                             FirebaseAuth auth = FirebaseAuth.instance;

//                             try {
//                               // Mevcut oturum açmış kullanıcının hesabını sil
//                               await auth.currentUser!.delete();
//                               print('Hesap başarıyla silindi.');
//                             } catch (e) {
//                               print('Hesap silinirken bir hata oluştu: $e');
//                             }
//                           }

//                           deleteAccount();
//                         },
//                         child: Text("oturumu sil"));

                    return HomePage();
                  } else {
                    return LandingPage();
                  }

                  /// kullanıcı oturum açmamış.
                })));
  }
}

FutureOr<User?> getCurrentUser() async {
  var currentUser = await FirebaseAuth.instance.currentUser;
  return currentUser;
}

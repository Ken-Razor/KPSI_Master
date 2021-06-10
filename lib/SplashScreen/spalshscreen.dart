import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rpl_mobile/Pages/loginPage.dart';

// WARNING, NOTE BUAT TEMAN TEMAN HEHE
// BAKAL KETAUAN KALO COPY CODE PROGRAM
// KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA

class SplashScreenPage extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return LoginPage();
      }));
    });
  }

  void initState() {
    startSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  "assets/images/logo2.png",
//                  width: 500.0,
//                  height: 500.0,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "\n #RPL 2021\n \nSpecial Thanks to Ken Will Kris\n \n",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

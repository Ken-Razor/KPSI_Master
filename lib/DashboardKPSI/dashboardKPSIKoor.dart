import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rpl_mobile/CRUD/bimbinganDosen.dart';
import 'package:rpl_mobile/CRUD/jadwalBimbingan.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:rpl_mobile/CRUD/verifikasiBatasKp.dart';
import 'package:rpl_mobile/CRUD/verifikasiAjaran.dart';
import 'package:rpl_mobile/CRUD/verifikasiJadwal.dart';
import 'package:rpl_mobile/CRUD/verifikasiKp.dart';
import 'package:rpl_mobile/CRUD/verifikasiPraKp.dart';
import 'package:rpl_mobile/CRUD/verifikasiSK.dart';
import 'package:rpl_mobile/Colors/constant.dart';
import 'package:rpl_mobile/Pages/accountKoor.dart';
import 'package:rpl_mobile/Pages/loginPage.dart';
import 'package:rpl_mobile/model.dart';
import 'dart:convert';

import 'package:rpl_mobile/provider/google_sign_in.dart';

class KpsiDashboardKoor extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String nama_koor, email_koor, foto;
  // ignore: non_constant_identifier_names
  KpsiDashboardKoor(
      {Key key, this.title, this.nama_koor, this.email_koor, this.foto})
      : super(key: key);
  final String title;
  static const String id = 'dashboard';

  @override
  _KpsiDashboardKoorState createState() => _KpsiDashboardKoorState();
}

class _KpsiDashboardKoorState extends State<KpsiDashboardKoor> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final _formKey = GlobalKey<FormState>();
  Future<DashboardKen> futureDashboardKen;
  FirebaseUser user;

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi,';
    }
    if (hour < 17) {
      return 'Selamat Sore,';
    }
    return 'Selamat Malam,';
  }

  void click() {
    signInWithGoogle().then((user) => {
          this.user = user,
          if (user != null && user.email.contains("students.ukdw.ac.id"))
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountKoor(
                            nama_koor: user.displayName,
                            email_koor: user.email,
                            foto: user.photoUrl,
                          )))
            }
        });
  }

  void choiceAction(String choice) {
    setState(() {
      if (choice == Constants.Settings) {
        signInWithGoogle().then((user) => {
              this.user = user,
              if (user != null && user.email.contains("students.ukdw.ac.id"))
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountKoor(
                                nama_koor: user.displayName,
                                email_koor: user.email,
                                foto: user.photoUrl,
                              ))).then(onGoBack)
                }
            });
      } else if (choice == Constants.SignOut) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromRGBO(255, 255, 255, 5);
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 5),
      appBar: new AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/images/logo3.png",
              fit: BoxFit.cover,
              height: 60.0,
              width: 150.0,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Icon(Icons.settings, color: Colors.black),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KpsiDashboardKoor()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(5),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              greeting() + ' Koordinator',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '${widget.nama_koor}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Material(
                          elevation: 1.0,
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.blue[300],
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.red,
                            backgroundImage: NetworkImage(widget.foto),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 150.0, right: 25.0, left: 25.0),
                    child: Container(
                      width: double.infinity,
                      height: 300.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0.0, 3.0),
                                blurRadius: 15.0)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.purple.withOpacity(0.1),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.person),
                                        color: Colors.purple,
                                        iconSize: 30.0,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          VerifikasiSK()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Verifikasi SK KP',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.blue.withOpacity(0.1),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.web),
                                        color: Colors.blue,
                                        iconSize: 30.0,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          VerifikasiPraKp()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Verifikasi Pra KP',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.blue.withOpacity(0.1),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.web),
                                        color: Colors.blue,
                                        iconSize: 30.0,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          VerifikasiKp()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Verifikasi KP',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.pink.withOpacity(0.1),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.all_inbox_rounded),
                                        color: Colors.pink,
                                        iconSize: 30.0,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          VerifikasiJadwal()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Penjadwalan Ujian',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color:
                                          Colors.purpleAccent.withOpacity(0.1),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.work),
                                        color: Colors.purpleAccent,
                                        iconSize: 30.0,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          VerifikasiBatasKp()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Batas KP',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.deepPurple.withOpacity(0.1),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.notifications),
                                        color: Colors.deepPurple,
                                        iconSize: 30.0,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      VerifikasiDaftarRegis()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Daftar Regis KP',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class UpcomingCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  UpcomingCard({this.title, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: 200.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 30.0),
              // Text('$value',
              //     style: TextStyle(
              //         fontSize: 2.0,
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rpl_mobile/Colors/constant.dart';
import 'package:rpl_mobile/Pages/forgotPage.dart';
import 'package:rpl_mobile/Pages/loginPage.dart';
import 'package:rpl_mobile/provider/google_sign_in.dart';

// WARNING, NOTE BUAT TEMAN TEMAN HEHE
// BAKAL KETAUAN KALO COPY CODE PROGRAM
// KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA

class AccountDosen extends StatefulWidget {
  final String nama_dosen, email_dosen, foto;
  AccountDosen({
    Key key,
    this.str,
    this.nama_dosen,
    this.email_dosen,
    this.foto,
  }) : super(key: key);

  String str = "";

  @override
  _AccountDosenState createState() => _AccountDosenState();
}

class _AccountDosenState extends State<AccountDosen> {
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SafeArea(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(widget.foto),
                ),
                SizedBox(
                  height: 20.0,
                  width: 300.0,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${widget.nama_dosen}',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      color: kTitleTextColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'INFORMATIONS SYSTEM Lecture',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      color: kPrimaryColor,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold),
                ),
                Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.lightBlue,
                      ),
                      title: Text(
                        '${widget.email_dosen}',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                        ),
                      ),
                    )),
                Card(
                    color: Colors.green,
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                    child: new InkWell(
                      // onTap: () async {
                      //   setState(() {
                      //     showSpinner = true;
                      //   });
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) => ForgotPage(),
                      //   ));
                      // },
                      child: Container(
                        width: 400.0,
                        height: 55.0,
                        child: ListTile(
                            title: Text(
                          "Save",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kBackgroundColor,
                          ),
                        )),
                      ),
                    )),
                Card(
                    color: Colors.orange,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                    child: new InkWell(
                      onTap: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 400.0,
                        height: 55.0,
                        child: ListTile(
                            title: Text(
                          "Back",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kBackgroundColor,
                          ),
                        )),
                      ),
                    )),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

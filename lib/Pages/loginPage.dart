import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rpl_mobile/API/apiService.dart';
import 'package:rpl_mobile/Colors/constant.dart';
import 'package:rpl_mobile/Animation/fadeAnimation.dart';
import 'package:rpl_mobile/DashboardKPSI/dashboardKPSI.dart';
import 'package:rpl_mobile/DashboardKPSI/dashboardKPSIDosen.dart';
import 'package:rpl_mobile/DashboardKPSI/dashboardKPSIKoor.dart';
import 'package:rpl_mobile/Pages/forgotPage_test.dart';
import 'package:rpl_mobile/model.dart';
import 'package:rpl_mobile/provider/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forgotPage.dart';

// WARNING, NOTE BUAT TEMAN TEMAN HEHE
// BAKAL KETAUAN KALO COPY CODE PROGRAM
// KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA

SharedPreferences isLogin;

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';

  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState(title);
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  FirebaseUser user;
  // String username;
  // String password;
  final String title;
  _LoginPageState(this.title);

  bool _obscureText = true;
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  bool showPassword = false;
  LoginIn login = new LoginIn();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void click() {
    signInWithGoogle().then((user) => {
          this.user = user,
          if (user != null && user.email.contains("si.ukdw.ac.id"))
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KpsiDashboard(
                            nama_mhs: user.displayName,
                            email_mhs: user.email,
                            foto: user.photoUrl,
                          )))
            }
          else if (user != null && user.email.contains("gmail.com"))
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KpsiDashboardDosen(
                            nama_dosen: user.displayName,
                            email_dosen: user.email,
                            foto: user.photoUrl,
                          )))
            }
          else if (user != null && user.email.contains("students.ukdw.ac.id"))
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KpsiDashboardKoor(
                            nama_koor: user.displayName,
                            email_koor: user.email,
                            foto: user.photoUrl,
                          )))
            }
        });
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // resizeToAvoidBottomPadding: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeAnimation(
                  1.1,
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage('assets/images/logo2.png'),
                  ),
                ),
                FadeAnimation(
                  1.3,
                  Text(
                    'Hello There',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Text(
                    'Sign in to Continue',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: Colors.teal.shade100,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  width: 300.0,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                // FadeAnimation(
                //   1.7,
                //   Card(
                //       margin: EdgeInsets.symmetric(
                //           vertical: 10.0, horizontal: 25.0),
                //       child: ListTile(
                //         leading: Icon(
                //           Icons.person,
                //           color: Colors.lightBlue,
                //         ),
                //         title: TextFormField(
                //           validator: (value) {
                //             if (value.isEmpty && value.length == 0) {
                //               return "*NIM anda tidak boleh kosong";
                //             } else if (value.length < 8 || value.length > 8) {
                //               return "NIM Anda kurang dari 8";
                //             } else
                //               return null;
                //           },
                //           controller: myUsernameController,
                //           onSaved: (String value) {
                //             this.login.nimnik = value;
                //           },
                //           decoration: InputDecoration(
                //               border: InputBorder.none,
                //               hintText: 'Username',
                //               labelStyle: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.grey,
                //               )),
                //         ),
                //       )),
                // ),
                // FadeAnimation(
                //   1.9,
                //   Card(
                //       margin: EdgeInsets.symmetric(
                //           vertical: 10.0, horizontal: 25.0),
                //       child: ListTile(
                //         leading: Icon(
                //           Icons.lock,
                //           color: Colors.lightBlue,
                //         ),
                //         title: TextFormField(
                //           validator: (value) {
                //             if (value.isEmpty && value.length == 0) {
                //               return "*Password tidak boleh kosong gan";
                //             } else {
                //               return null;
                //             }
                //           },
                //           obscureText: _obscureText,
                //           controller: myPasswordController,
                //           onSaved: (String value) {
                //             this.login.password = value;
                //           },
                //           autofocus: false,
                //           // initialValue: '',
                //           keyboardType: TextInputType.text,
                //           decoration: InputDecoration(
                //             border: InputBorder.none,
                //             hintText: 'Password',
                //             suffixIcon: GestureDetector(
                //               onTap: () {
                //                 _toggle();
                //               },
                //               child: Icon(
                //                 _obscureText
                //                     ? Icons.visibility_off
                //                     : Icons.visibility,
                //                 color: _obscureText
                //                     ? Colors.grey
                //                     : Colors.lightGreen[600],
                //               ),
                //             ),
                //             labelStyle: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ),
                //       )),
                // ),
                // FadeAnimation(
                //   2.1,
                //   Container(
                //       alignment: Alignment.topRight,
                //       width: 350,
                //       child: GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => ForgotPage()));
                //         },
                //         child: Text(
                //           "Forgot Password?",
                //           style: TextStyle(
                //             color: kPrimaryColor,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       )),
                // ),
                // FadeAnimation(
                //   2.3,
                //   Card(
                //       color: Colors.lightBlue[600],
                //       margin: EdgeInsets.symmetric(
                //           vertical: 20.0, horizontal: 25.0),
                //       child: new InkWell(
                //         onTap: () async {
                //           if (_formKey.currentState.validate()) {
                //             _formKey.currentState.save();
                //             ApiServices()
                //                 .loginIn(this.login)
                //                 .then((isSuccess) async {
                //               if (isSuccess) {
                //                 //_displayDialogLogin(context);
                //                 SharedPreferences pref =
                //                     await SharedPreferences.getInstance();
                //                 await pref.setInt("is_login_progmob", 1);
                //                 Navigator.pushReplacement(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) =>
                //                           MyBottomNavigationBar(user)),
                //                 );
                //               } else {
                //                 _displayDialogCantLogin(context);
                //               }
                //             });
                //           }
                //         },
                //         child: Container(
                //           width: 400.0,
                //           height: 55.0,
                //           child: ListTile(
                //               title: Text(
                //             "LOGIN",
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //               color: kBackgroundColor,
                //             ),
                //           )),
                //         ),
                //       )),
                // ),
                FadeAnimation(
                  2.3,
                  Card(
                      color: Colors.green,
                      margin:
                          EdgeInsets.symmetric(vertical: 1.0, horizontal: 25.0),
                      child: InkWell(
                        onTap: () async {
                          try {
                            this.click();
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Container(
                          width: 400.0,
                          height: 55.0,
                          child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/google.png'),
                                backgroundColor: Colors.white,
                              ),
                              title: Text(
                                "Sign in With Google",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kBackgroundColor,
                                ),
                              )),
                        ),
                      )),
                ),
                SizedBox(
                  height: 25.0,
                ),
                FadeAnimation(
                  2.3,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an Account?',
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => ForgotPage()));
                        // },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_displayDialogCantLogin(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 2,
          title: Text(
            "Anda Tidak Bisa Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF03A9F4), fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Coba Cek Kembali Datamu",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF03A9F4),
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text(
                "Exit",
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      });
}

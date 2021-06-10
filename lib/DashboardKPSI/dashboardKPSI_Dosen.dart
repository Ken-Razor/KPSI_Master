// import 'package:flutter/material.dart';
// import 'package:rpl_mobile/API/apiService.dart';
// import 'package:rpl_mobile/Animation/fadeAnimation.dart';
// import 'package:rpl_mobile/CRUD/pengajuan_surat_kp.dart';
// import 'package:rpl_mobile/CRUD/jadwalCRUD.dart';
// import 'package:rpl_mobile/CRUD/pengajuan_prakp.dart';
// import 'package:rpl_mobile/CRUD/pengajuan_kp.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:rpl_mobile/Colors/constant.dart';
// import 'package:double_back_to_close_app/double_back_to_close_app.dart';
// import 'package:rpl_mobile/Pages/forgotPage.dart';
// import 'package:rpl_mobile/model.dart';
// import 'dart:convert';

// class KpsiDashboardDosen extends StatefulWidget {
//   KpsiDashboardDosen({Key key, this.title}) : super(key: key);
//   final String title;
//   static const String id = 'dashboard';

//   @override
//   _KpsiDashboardDosenState createState() => _KpsiDashboardDosenState();
// }

// // WARNING, NOTE BUAT TEMAN TEMAN HEHE
// // BAKAL KETAUAN KALO COPY CODE PROGRAM
// // KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// // COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA

// class _KpsiDashboardDosenState extends State<KpsiDashboardDosen> {
//   final _formKey = GlobalKey<FormState>();
//   Future<DashboardKen> futureDashboardKen;

//   FutureOr onGoBack(dynamic value) {
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     futureDashboardKen = fetchDashboard();
//   }

//   String greeting() {
//     var hour = DateTime.now().hour;
//     if (hour < 12) {
//       return 'Selamat Pagi,';
//     }
//     if (hour < 17) {
//       return 'Selamat Sore,';
//     }
//     return 'Selamat Malam,';
//   }

//   @override
//   Widget build(BuildContext context) {
//     Color primaryColor = Color.fromRGBO(3, 155, 229, 1);
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(255, 255, 255, 255),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Stack(
//                 children: <Widget>[
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               greeting(),
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14.0,
//                               ),
//                             ),
//                             SizedBox(height: 5.0),
//                             Text(
//                               'Ken Sanio',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 30.0,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         Material(
//                           elevation: 1.0,
//                           borderRadius: BorderRadius.circular(100.0),
//                           color: Colors.blue[300],
//                           child: CircleAvatar(
//                             radius: 40.0,
//                             backgroundColor: Colors.red,
//                             backgroundImage: AssetImage("assets/images/0.jpg"),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.only(top: 120.0, right: 25.0, left: 25.0),
//                     child: Container(
//                       width: double.infinity,
//                       height: 300.0,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 offset: Offset(0.0, 3.0),
//                                 blurRadius: 15.0)
//                           ]),
//                       child: Column(
//                         children: <Widget>[
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 40.0, vertical: 40.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Column(
//                                   children: <Widget>[
//                                     Material(
//                                       borderRadius:
//                                           BorderRadius.circular(100.0),
//                                       color: Colors.purple.withOpacity(0.1),
//                                       child: IconButton(
//                                         padding: EdgeInsets.all(15.0),
//                                         icon: Icon(Icons.person),
//                                         color: Colors.purple,
//                                         iconSize: 30.0,
//                                         onPressed: () {
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder:
//                                                       (BuildContext context) =>
//                                                           SuratCRUD()));
//                                         },
//                                       ),
//                                     ),
//                                     SizedBox(height: 8.0),
//                                     Text('Daftar Bimbingan',
//                                         style: TextStyle(
//                                             color: Colors.black54,
//                                             fontSize: 13,
//                                             fontWeight: FontWeight.bold))
//                                   ],
//                                 ),
//                                 Column(
//                                   children: <Widget>[
//                                     Material(
//                                       borderRadius:
//                                           BorderRadius.circular(100.0),
//                                       color: Colors.blue.withOpacity(0.1),
//                                       child: IconButton(
//                                         padding: EdgeInsets.all(15.0),
//                                         icon: Icon(Icons.web),
//                                         color: Colors.blue,
//                                         iconSize: 30.0,
//                                         onPressed: () {
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder:
//                                                       (BuildContext context) =>
//                                                           PrakpCRUD()));
//                                         },
//                                       ),
//                                     ),
//                                     SizedBox(height: 8.0),
//                                     Text('Jadwal Ujian',
//                                         style: TextStyle(
//                                             color: Colors.black54,
//                                             fontSize: 13,
//                                             fontWeight: FontWeight.bold))
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
//                 child: Text(
//                   'Status Pengajuan Anda',
//                   style: TextStyle(
//                       color: Colors.black.withOpacity(0.7),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.0),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 35.0, bottom: 25.0),
//                 child: Container(
//                   height: 180.0,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: <Widget>[
//                       UpcomingCard(
//                         title: 'PT. Membangun Bangsa',
//                         value: 280.0,
//                         color: Colors.green,
//                       ),
//                       UpcomingCard(
//                         title:
//                             "Pra-KP: Analisis Flutter dan Laravel PT Membangun Bangsa",
//                         value: 260.0,
//                         color: Colors.red,
//                       ),
//                       UpcomingCard(
//                         title: "KP : Analisis Laravel",
//                         value: 260.0,
//                         color: Colors.yellow,
//                       ),
//                       UpcomingCard(
//                         title: "Masih Proses",
//                         value: 260.0,
//                         color: Colors.pink,
//                       ),
//                       // UpcomingCard(
//                       //   title: 'Cred Card Text Two',
//                       //   value: 210.0,
//                       //   color: Colors.orange,
//                       // ),
//                       // UpcomingCard(
//                       //   title: 'Cred Card Text Two',
//                       //   value: 110.0,
//                       //   color: Colors.pink,
//                       // ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<DashboardKen> fetchDashboard() async {
//     final response = await http.get(
//         'https://argouchiha.000webhostapp.com/api/progmob/dashboard/72180234');
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       return DashboardKen.fromJson(jsonDecode(response.body));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//   }
// }

// class CustomShapeClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();

//     path.lineTo(0.0, 390.0 - 200);
//     path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
//     path.lineTo(size.width, 0.0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }

// class UpcomingCard extends StatelessWidget {
//   final String title;
//   final double value;
//   final Color color;

//   UpcomingCard({this.title, this.value, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(right: 15.0),
//       child: Container(
//         width: 200.0,
//         decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.all(Radius.circular(25.0))),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(title,
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold)),
//               SizedBox(height: 30.0),
//               // Text('$value',
//               //     style: TextStyle(
//               //         fontSize: 2.0,
//               //         color: Colors.white,
//               //         fontWeight: FontWeight.bold))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

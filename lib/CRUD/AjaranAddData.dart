import 'dart:convert';

import 'package:documents_picker/documents_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:rpl_mobile/CRUD/PengajuanKP.dart';
import 'package:rpl_mobile/CRUD/PengajuanPraKP.dart';
import 'package:rpl_mobile/CRUD/verifikasiAjaran.dart';
import 'package:rpl_mobile/CRUD/verifikasiBatasKp.dart';

class AjaranAddData extends StatefulWidget {
  @override
  _AjaranAddDataState createState() => new _AjaranAddDataState();
}

class _AjaranAddDataState extends State<AjaranAddData> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  DateTime _selectedDate;
  DateTime _selectedDate1;
  // add file
  ///batas

  TextEditingController controllerSemester = TextEditingController();
  TextEditingController controllerTahun = TextEditingController();

  void addData() {
    var url = "http://okenih.rapidserver.my.id/api/koor/set/ajaran/ubah";

    http.put(url, body: {
      "semester": controllerSemester.text,
      "tahun": controllerTahun.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Update Ajaran"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Form(
                key: _formState,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Semester",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                        enabled: true,
                        controller: controllerSemester,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Semester'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Tahun",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                        enabled: true,
                        controller: controllerTahun,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Tahun'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.green,
                      onPressed: () {
                        addData();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                VerifikasiDaftarRegis()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

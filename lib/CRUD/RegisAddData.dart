import 'dart:convert';

import 'package:documents_picker/documents_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:rpl_mobile/CRUD/PengajuanKP.dart';
import 'package:rpl_mobile/CRUD/PengajuanPraKP.dart';
import 'package:rpl_mobile/CRUD/verifikasiBatasKp.dart';

class BatasAddData extends StatefulWidget {
  @override
  _BatasAddDataState createState() => new _BatasAddDataState();
}

class _BatasAddDataState extends State<BatasAddData> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  DateTime _selectedDate;
  DateTime _selectedDate1;
  // add file
  ///batas

  TextEditingController controllerMulai = TextEditingController();
  TextEditingController controllerBatas = TextEditingController();

  void addData() {
    var url =
        "http://okenih.rapidserver.my.id/api/koor/ubah/batas/pelaksaan/kp";

    http.post(url, body: {
      "mulai": controllerMulai.text,
      "batas": controllerBatas.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Data KP MU"),
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
                        "Set Mulai KP",
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
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: controllerMulai,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Tanggal Mulai KP'),
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Set Batas KP",
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
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: controllerBatas,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Tanggal Batas KP'),
                        onTap: () {
                          _selectDate1(context);
                        },
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
                                VerifikasiBatasKp()));
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

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      controllerMulai
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: controllerMulai.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  _selectDate1(BuildContext context) async {
    DateTime newSelectedDate1 = await showDatePicker(
        context: context,
        initialDate: _selectedDate1 != null ? _selectedDate1 : DateTime(2025),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate1 != null) {
      _selectedDate1 = newSelectedDate1;
      controllerBatas
        ..text = DateFormat.yMMMd().format(_selectedDate1)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: controllerMulai.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

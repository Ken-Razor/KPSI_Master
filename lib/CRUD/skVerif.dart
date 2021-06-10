import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rpl_mobile/CRUD/verifikasiSK.dart';

class DetailVerifikasiSK extends StatefulWidget {
  List list;
  int index;
  DetailVerifikasiSK({this.index, this.list});
  @override
  _DetailVerifikasiSKState createState() => new _DetailVerifikasiSKState();
}

class _DetailVerifikasiSKState extends State<DetailVerifikasiSK> {
  void updateStatus() {
    var url =
        "http://okenih.rapidserver.my.id/api/koor/verifikasi/sk/status/update";
    http.put(url, body: {
      "id": widget.list[widget.index]['id'],
      "semester": controllerSemester.text,
      "tahun": controllerTahun.text,
      "nim": controllerNim.text,
      "lembaga": controllerLembaga.text,
      "pimpinan": controllerPimpinan.text,
      "alamat": controllerAlamat.text,
      "no_telp": controllerNoTelp.text,
      "fax": controllerFax.text,
      "dokumen": controllerDokumen.text,
      "status": controllerStatus.text,
      "status_ok": controllerStatus1.text
    });
  }

  TextEditingController controllerSemester = new TextEditingController();
  TextEditingController controllerTahun = new TextEditingController();
  TextEditingController controllerNim = new TextEditingController();
  TextEditingController controllerLembaga = new TextEditingController();
  TextEditingController controllerPimpinan = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerNoTelp = new TextEditingController();
  TextEditingController controllerFax = new TextEditingController();
  TextEditingController controllerDokumen = new TextEditingController();
  TextEditingController controllerStatus = new TextEditingController(text: '1');
  TextEditingController controllerStatus1 =
      new TextEditingController(text: '0');

  void initState() {
    super.initState();
    setState(() {
      controllerSemester = new TextEditingController(
          text: widget.list[widget.index]['semester']);
      controllerTahun =
          new TextEditingController(text: widget.list[widget.index]['tahun']);
      controllerNim =
          new TextEditingController(text: widget.list[widget.index]['nim']);
      controllerLembaga =
          new TextEditingController(text: widget.list[widget.index]['lembaga']);
      controllerPimpinan = new TextEditingController(
          text: widget.list[widget.index]['pimpinan']);
      controllerAlamat =
          new TextEditingController(text: widget.list[widget.index]['alamat']);
      controllerNoTelp =
          new TextEditingController(text: widget.list[widget.index]['no_telp']);
      controllerFax =
          new TextEditingController(text: widget.list[widget.index]['fax']);
      controllerDokumen =
          new TextEditingController(text: widget.list[widget.index]['dokumen']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Detail KP")),
      body: SingleChildScrollView(
        child: new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Card(
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Semester : ${widget.list[widget.index]['semester']}",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Tahun : ${widget.list[widget.index]['tahun']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Nim : ${widget.list[widget.index]['nim']}",
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Lembaga : ${widget.list[widget.index]['lembaga']}",
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "pimpinan : ${widget.list[widget.index]['pimpinan']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "No telepon : ${widget.list[widget.index]['no_telp']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "alamat : ${widget.list[widget.index]['alamat']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "fax : ${widget.list[widget.index]['fax']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Dokumen : ${widget.list[widget.index]['dokumen']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Status : ${widget.list[widget.index]['status_ok']}",
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    color: Colors.blue,
                    // onPressed: () async {
                    //   final status = await Permission.storage.request();

                    //   // if (status.isGranted) {
                    //   //   final externalDir = await getExternalStorageDirectory();

                    //   //   final id = await FlutterDownloader.enqueue(
                    //   //     url:
                    //   //         "http://okenih.rapidserver.my.id/api/mahasiswa/sk/3",
                    //   //     savedDir: externalDir.path,
                    //   //     fileName: "download",
                    //   //     showNotification: true,
                    //   //     openFileFromNotification: true,
                    //   //   );
                    //   // } else {
                    //   //   print("Permission deined");
                    //   // }
                    // },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.picture_as_pdf,
                          color: Colors.white,
                        ),
                        Text(
                          "Download PDF",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),

                  // new Text(
                  //   "Price : ${widget.list[widget.index]['semester']}",
                  //   style: new TextStyle(fontSize: 18.0),
                  // ),
                  // new Text(
                  //   "Stock : ${widget.list[widget.index]['tahun']}",
                  //   style: new TextStyle(fontSize: 18.0),
                  // ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerSemester,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerTahun,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerNim,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerLembaga,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerPimpinan,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerNoTelp,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerAlamat,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerFax,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerDokumen,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerStatus,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
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
                      updateStatus();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new VerifikasiSK()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Setuju",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    color: Colors.red,
                    onPressed: () async {
                      if (controllerStatus1.text == "") {
                      } else {
                        var url =
                            "http://okenih.rapidserver.my.id/api/koor/verifikasi/sk/status/update";
                        http.put(url, body: {
                          "id": widget.list[widget.index]['id'],
                          "status": widget.list[widget.index]['status'],
                        });
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new VerifikasiSK()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Tolak",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

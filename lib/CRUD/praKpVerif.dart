import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rpl_mobile/CRUD/verifikasiPraKp.dart';
import 'package:rpl_mobile/CRUD/verifikasiSK.dart';

class DetailVerifikasiPraKp extends StatefulWidget {
  List list;
  int index;
  DetailVerifikasiPraKp({this.index, this.list});
  @override
  _DetailVerifikasiPraKpState createState() =>
      new _DetailVerifikasiPraKpState();
}

class _DetailVerifikasiPraKpState extends State<DetailVerifikasiPraKp> {
  void updateStatus() {
    var url =
        "http://okenih.rapidserver.my.id/api/koor/verifikasi/pra/status/update";
    http.put(url, body: {
      "id": widget.list[widget.index]['id'],
      "semester": controllerSemester.text,
      "tahun": controllerTahun.text,
      "nim": controllerNim.text,
      "nik": controllerNik.text,
      "tools": controllerTools.text,
      "spesifikasi": controllerSpesifikasi.text,
      "penguji": controllerPenguji.text,
      "ruang": controllerRuang.text,
      "lembaga": controllerLembaga.text,
      "pimpinan": controllerPimpinan.text,
      "no_telp": controllerNotelp.text,
      "alamat": controllerAlamat.text,
      "dokumen": controllerDokumen.text,
      "status": controllerStatus.text,
    });
  }

  TextEditingController controllerSemester = new TextEditingController();
  TextEditingController controllerTahun = new TextEditingController();
  TextEditingController controllerNim = new TextEditingController();
  TextEditingController controllerNik = new TextEditingController();
  TextEditingController controllerTools = new TextEditingController();
  TextEditingController controllerSpesifikasi = new TextEditingController();
  TextEditingController controllerPenguji = new TextEditingController();
  TextEditingController controllerRuang = new TextEditingController();
  TextEditingController controllerLembaga = new TextEditingController();
  TextEditingController controllerPimpinan = new TextEditingController();
  TextEditingController controllerNotelp = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerDokumen = new TextEditingController();
  TextEditingController controllerStatus = new TextEditingController(text: '1');

  void initState() {
    super.initState();
    setState(() {
      controllerSemester = new TextEditingController(
          text: widget.list[widget.index]['semester']);
      controllerTahun =
          new TextEditingController(text: widget.list[widget.index]['tahun']);
      controllerNim =
          new TextEditingController(text: widget.list[widget.index]['nim']);
      controllerNik =
          new TextEditingController(text: widget.list[widget.index]['nik']);
      controllerTools =
          new TextEditingController(text: widget.list[widget.index]['tools']);
      controllerSpesifikasi = new TextEditingController(
          text: widget.list[widget.index]['spesifikasi']);
      controllerPenguji =
          new TextEditingController(text: widget.list[widget.index]['penguji']);
      controllerRuang =
          new TextEditingController(text: widget.list[widget.index]['ruang']);
      controllerLembaga =
          new TextEditingController(text: widget.list[widget.index]['lembaga']);
      controllerPimpinan = new TextEditingController(
          text: widget.list[widget.index]['pimpinan']);
      controllerNotelp =
          new TextEditingController(text: widget.list[widget.index]['no_telp']);
      controllerAlamat =
          new TextEditingController(text: widget.list[widget.index]['alamat']);
      controllerDokumen =
          new TextEditingController(text: widget.list[widget.index]['dokumen']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Detail Pra KP")),
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
                      "nik : ${widget.list[widget.index]['nik']}",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "tools : ${widget.list[widget.index]['tools']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "spesifikasi : ${widget.list[widget.index]['spesifikasi']}",
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "penguji : ${widget.list[widget.index]['penguji']}",
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "ruang : ${widget.list[widget.index]['ruang']}",
                      style: new TextStyle(fontSize: 18.0),
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
                      controller: controllerNik,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerTools,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerSpesifikasi,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerPenguji,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Semester anda'),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      enabled: false,
                      controller: controllerRuang,
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
                      controller: controllerNotelp,
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
                              new VerifikasiPraKp()));
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
                      // if (controllerStatus1.text == "") {
                      // } else {
                      //   var url =
                      //       "http://okenih.rapidserver.my.id/api/koor/verifikasi/sk/status/update";
                      //   http.put(url, body: {
                      //     "id": widget.list[widget.index]['id'],
                      //     "status": widget.list[widget.index]['status'],
                      //   });
                      //   Navigator.of(context).push(new MaterialPageRoute(
                      //       builder: (BuildContext context) =>
                      //           new VerifikasiSK()));
                      // }
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

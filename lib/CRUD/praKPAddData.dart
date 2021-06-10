import 'dart:convert';

import 'package:documents_picker/documents_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:rpl_mobile/CRUD/PengajuanPraKP.dart';

class PraKPAddData extends StatefulWidget {
  @override
  _PraKPAddDataState createState() => new _PraKPAddDataState();
}

class _PraKPAddDataState extends State<PraKPAddData> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  Future<List> getData() async {
    final response =
        await http.get("http://okenih.rapidserver.my.id/api/ajaran");
    return json.decode(response.body.toString());
  }

  // add file
  static const MethodChannel _channel = const MethodChannel('documents_picker');

  static Future<List<String>> get pickDocuments async {
    final List<dynamic> docsPaths =
        await _channel.invokeMethod('pickDocuments');
    if (docsPaths != null && docsPaths.isEmpty) return [];
    return docsPaths?.cast<String>();
  }

  ///batas

  TextEditingController controllerSemester =
      new TextEditingController(text: 'Gasal');
  TextEditingController controllerTahun = new TextEditingController();
  TextEditingController controllerNim = new TextEditingController();
  TextEditingController controllerNik = new TextEditingController();
  TextEditingController controllerTools = new TextEditingController();
  TextEditingController controllerSpesifikasi = new TextEditingController();
  TextEditingController controllerPenguji = new TextEditingController();
  TextEditingController controllerRuang = new TextEditingController();
  TextEditingController controllerLembaga = new TextEditingController();
  TextEditingController controllerPimpinan = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerNoTelp = new TextEditingController();
  TextEditingController controllerFax = new TextEditingController();
  TextEditingController controllerDokumen =
      new TextEditingController(text: "null.pdf");

  void addData() {
    var url = "http://okenih.rapidserver.my.id/api/mahasiswa/tambah/pra/3";

    http.post(url, body: {
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
      "alamat": controllerAlamat.text,
      "no_telp": controllerNoTelp.text,
      "fax": controllerFax.text,
      "dokumen": controllerDokumen.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Data Pra-KP MU"),
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
                        enabled: false,
                        controller: controllerSemester,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukan Semester anda'),
                      ),
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8),
                    //       border: Border.all(color: Colors.black)),
                    //   child: DropdownButton(
                    //       isExpanded: true,
                    //       underline: SizedBox(),
                    //       items: [
                    //         DropdownMenuItem(
                    //             child: Text(
                    //           'Gasal',
                    //         )),
                    //         DropdownMenuItem(
                    //             child: Text(
                    //           'Genap',
                    //         )),
                    //       ],
                    //       onChanged: (item) {}),
                    // ),
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
                        controller: controllerTahun,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Tahun anda KP'),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "NIM",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                        controller: controllerNim,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Nim Anda'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Lembaga",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                        controller: controllerLembaga,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Lembaga Anda KP'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Pimpinan",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                        controller: controllerPimpinan,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Nama Pimpinan Lembaga KP anda'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "No. Telepon",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                        controller: controllerNoTelp,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Nomer Telepon Anda'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Alamat",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                        controller: controllerAlamat,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Alamat Anda KP'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Fax",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                        controller: controllerFax,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Fax Lembaga Anda (Jika Ada)'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Visibility(
                      visible: false,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black)),
                        child: TextField(
                          controller: controllerDokumen,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'Masukkan Dokumen Lembaga Anda (Jika Ada)'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // _imageFile == null
                    //     ? Text("Silahkan memilih gambar terlebih dahulu")
                    //     : Image.file(
                    //         _imageFile,
                    //         fit: BoxFit.cover,
                    //         height: 300.0,
                    //         alignment: Alignment.topCenter,
                    //         width: MediaQuery.of(context).size.width,
                    //       ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.blue,
                      onPressed: () {
                        pickDocuments;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.picture_as_pdf,
                            color: Colors.white,
                          ),
                          Text(
                            "Upload PDF (Permohonan Surat Pra KP)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
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
                                PengajuanPraKP()));
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(new MaterialApp(
    title: "Detail SK",
    home: new PraKpDetailSK(),
  ));
}

class PraKpDetailSK extends StatefulWidget {
  List list;
  int index;
  PraKpDetailSK({this.index, this.list});

  @override
  _PraKpDetailSKState createState() => new _PraKpDetailSKState();
}

class _PraKpDetailSKState extends State<PraKpDetailSK> {
  Future<List> getData() async {
    final response =
        await http.get("http://okenih.rapidserver.my.id/api/mahasiswa/pra/3");
    return json.decode(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Detail Pra KP mu"),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
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
                      "Semester : ${list[i]['semester']}",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Tahun : ${list[i]['tahun']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Nim : ${list[i]['nim']}",
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "NIK : ${list[i]['nik']}",
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Tools : ${list[i]['tools']}",
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Spesifikasi : ${list[i]['spesifikasi']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Dosen Penguji : ${list[i]['penguji']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Ruang : ${list[i]['ruang']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Lembaga : ${list[i]['lembaga']}",
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "pimpinan : ${list[i]['pimpinan']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "no telepon : ${list[i]['no_telp']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "alamat : ${list[i]['alamat']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "fax : ${list[i]['fax']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Dokumen : ${list[i]['dokumen']}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Status : ${list[i]['status_ok']}",
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
                    color: Colors.green,
                    // onPressed: () async {
                    //   final status = await Permission.storage.request();

                    //   if (status.isGranted) {
                    //     final externalDir = await getExternalStorageDirectory();

                    //     final id = await FlutterDownloader.enqueue(
                    //       url:
                    //           "http://okenih.rapidserver.my.id/api/mahasiswa/sk/3",
                    //       savedDir: externalDir.path,
                    //       fileName: "download",
                    //       showNotification: true,
                    //       openFileFromNotification: true,
                    //     );
                    //   } else {
                    //     print("Permission deined");
                    //   }
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rpl_mobile/CRUD/kpVerif.dart';
import 'package:rpl_mobile/CRUD/praKpVerif.dart';
import 'package:rpl_mobile/CRUD/skVerif.dart';
import 'package:rpl_mobile/CRUD/verifJadwal.dart';
import 'skDetail.dart';
import 'skAddData.dart';

void main() {
  runApp(new MaterialApp(
    title: "Lihat Verifikasi KP",
    home: new VerifikasiJadwal(),
  ));
}

class VerifikasiJadwal extends StatefulWidget {
  @override
  _VerifikasiJadwalState createState() => new _VerifikasiJadwalState();
}

class _VerifikasiJadwalState extends State<VerifikasiJadwal> {
  TextEditingController textController = TextEditingController();
  Future<List> getData() async {
    final response =
        await http.get("http://okenih.rapidserver.my.id/api/koor/jadwal/kp");
    return json.decode(response.body.toString());
  }

  // TextEditingController textDataController = TextEditingController();
  // Future<List> getData2() async {
  //   final response =
  //       await http.get("http://okenih.rapidserver.my.id/api/mahasiswa/kp/3");
  //   return json.decode(response.body.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lihat Verifikasi Jadwal"),
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
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetilJadwal(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text('Judul : ' + list[i]['judul']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Tools : ${list[i]['nim']} \n" +
                    "Lembaga : ${list[i]['lembaga']} \n" +
                    "Pimpinan : ${list[i]['pimpinan']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

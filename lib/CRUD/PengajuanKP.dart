import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rpl_mobile/CRUD/KPAddData.dart';
import 'package:rpl_mobile/CRUD/KpDetail.dart';
import 'package:rpl_mobile/CRUD/praKPAddData.dart';
import 'package:rpl_mobile/CRUD/praKpDetail.dart';
import 'skDetail.dart';
import 'skAddData.dart';

void main() {
  runApp(new MaterialApp(
    title: "Pengajuan KP",
    home: new PengajuanKP(),
  ));
}

class PengajuanKP extends StatefulWidget {
  @override
  _PengajuanKPState createState() => new _PengajuanKPState();
}

class _PengajuanKPState extends State<PengajuanKP> {
  TextEditingController textController = TextEditingController();
  Future<List> getData() async {
    final response =
        await http.get("http://okenih.rapidserver.my.id/api/mahasiswa/kp/3");
    return json.decode(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pengajuan KP"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new KPAddData(),
        )),
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
                builder: (BuildContext context) => new KpDetailSK(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text('Judul : ' + list[i]['judul']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Status : ${list[i]['status_ok']} \n" +
                    "Lembaga / Perusahaan : ${list[i]['lembaga']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

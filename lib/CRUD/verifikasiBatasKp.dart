import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rpl_mobile/CRUD/BatasAddData.dart';
import 'package:rpl_mobile/CRUD/skVerif.dart';
import 'skDetail.dart';
import 'skAddData.dart';

void main() {
  runApp(new MaterialApp(
    title: "Lihat Jadwal",
    home: new VerifikasiBatasKp(),
  ));
}

class VerifikasiBatasKp extends StatefulWidget {
  @override
  _VerifikasiBatasKpState createState() => new _VerifikasiBatasKpState();
}

class _VerifikasiBatasKpState extends State<VerifikasiBatasKp> {
  TextEditingController textController = TextEditingController();
  Future<List> getData() async {
    final response =
        await http.get("http://okenih.rapidserver.my.id/api/koor/batas/kp");
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
        title: new Text("Lihat Batas Pelaksanaan"),
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
                builder: (BuildContext context) => new BatasAddData())),
            child: new Card(
              child: new ListTile(
                title: new Text('Mulai : ' + list[i]['mulai']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Batas : ${list[i]['batas']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

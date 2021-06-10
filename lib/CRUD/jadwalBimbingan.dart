import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rpl_mobile/CRUD/detilBimbinganDosen.dart';

void main() {
  runApp(new MaterialApp(
    title: "My Store",
    home: new JadwalBimbingan(),
  ));
}

class JadwalBimbingan extends StatefulWidget {
  @override
  _JadwalBimbinganState createState() => new _JadwalBimbinganState();
}

class _JadwalBimbinganState extends State<JadwalBimbingan> {
  Future<List> getData() async {
    final response = await http
        .get("http://okenih.rapidserver.my.id/api/dosen/ujian/ken%20thea");
    return json.decode(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Jadwal Bimbingan"),
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
                builder: (BuildContext context) => new DetilBimbinganDosen(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nim']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Tanggal : ${list[i]['tanggal']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

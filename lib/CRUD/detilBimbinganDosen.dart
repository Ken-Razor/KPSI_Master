import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetilBimbinganDosen extends StatefulWidget {
  List list;
  int index;
  DetilBimbinganDosen({this.index, this.list});

  @override
  _DetilBimbinganDosenState createState() => new _DetilBimbinganDosenState();
}

class _DetilBimbinganDosenState extends State<DetilBimbinganDosen> {
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
          child: new Card(
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  new Text(
                    "NIM : ${list[i]['nim']}",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  new Text(
                    "Dosen Pembimbing : ${list[i]['dosbing']}",
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    "Dosen Penguji : ${list[i]['dosuji']}",
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    "Tanggal : ${list[i]['tanggal']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  new Text(
                    "Tanggal : ${list[i]['tanggal']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  new Text(
                    "Jam Pelaksanaan : ${list[i]['jam']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  new Text(
                    "Ruangan : ${list[i]['ruangan']}",
                    style: new TextStyle(fontSize: 18.0),
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

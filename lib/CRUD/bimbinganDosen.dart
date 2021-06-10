import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: "My Store",
    home: new BimbinganDosen(),
  ));
}

class BimbinganDosen extends StatefulWidget {
  @override
  _BimbinganDosenState createState() => new _BimbinganDosenState();
}

class _BimbinganDosenState extends State<BimbinganDosen> {
  Future<List> getData() async {
    final response = await http
        .get("http://okenih.rapidserver.my.id/api/dosen/bimbingan/ken%20thea");
    return json.decode(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Daftar Bimbingan Dosen"),
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
            child: new Card(
              child: new ListTile(
                title: new Text("Nim Mahasiswa : ${list[i]['nim']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

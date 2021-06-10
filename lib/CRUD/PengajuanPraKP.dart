import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rpl_mobile/CRUD/praKPAddData.dart';
import 'package:rpl_mobile/CRUD/praKpDetail.dart';
import 'skDetail.dart';
import 'skAddData.dart';

void main() {
  runApp(new MaterialApp(
    title: "Pengajuan Pra KP",
    home: new PengajuanPraKP(),
  ));
}

class PengajuanPraKP extends StatefulWidget {
  @override
  _PengajuanPraKPState createState() => new _PengajuanPraKPState();
}

class _PengajuanPraKPState extends State<PengajuanPraKP> {
  TextEditingController textController = TextEditingController();
  Future<List> getData() async {
    final response =
        await http.get("http://okenih.rapidserver.my.id/api/mahasiswa/pra/3");
    return json.decode(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pengajuan Pra-KP"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new PraKPAddData(),
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
                builder: (BuildContext context) => new PraKpDetailSK(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['lembaga']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Status : ${list[i]['status_ok']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

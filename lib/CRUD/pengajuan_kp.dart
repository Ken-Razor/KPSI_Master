import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rpl_mobile/API/apiService.dart';
import 'package:rpl_mobile/CRUD/tambahMatakuliah.dart';
import 'package:rpl_mobile/CRUD/updateMatakuliah.dart';
import 'package:rpl_mobile/model.dart';

class KPCRUD extends StatefulWidget {
  KPCRUD({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _KPCRUDState createState() => _KPCRUDState();
}

class _KPCRUDState extends State<KPCRUD> {
  final _formKey = GlobalKey<FormState>();

  List<Matakuliah> listMatkul;

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengajuan KP"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TambahMatakuliah(
                          title: "Input Data Pengajuan KP"))).then(onGoBack);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMatkul(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Ada sesuatu yang janggal: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            listMatkul = snapshot.data;

            return ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Container(
                    child: ListTile(
                      title: Text(listMatkul[position].kode +
                          " - " +
                          listMatkul[position].nama),
                      subtitle: Text("Hari " +
                          listMatkul[position].hari.toString() +
                          " - Sesi " +
                          listMatkul[position].sesi.toString() +
                          " - " +
                          listMatkul[position].sks.toString()),
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateMatakuliah(
                                                            title:
                                                                "Update Data Matakuliah",
                                                            matkul: listMatkul[
                                                                position],
                                                            kodecari: listMatkul[
                                                                    position]
                                                                .kode))).then(
                                                onGoBack);
                                          },
                                          child: Text("Update")),
                                      Divider(
                                        color: Colors.black,
                                        height: 20,
                                      ),
                                      FlatButton(
                                          onPressed: () async {
                                            ApiServices().deleteMatkul(
                                                listMatkul[position].kode);
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Text("Delete")),
                                    ],
                                  ),
                                ));
                      },
                    ),
                  ),
                );
              },
              itemCount: listMatkul.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

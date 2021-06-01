import 'package:flutter/material.dart';
import 'package:rpl_mobile/API/apiService.dart';
import 'package:rpl_mobile/Colors/constant.dart';
import 'package:rpl_mobile/model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class TambahPrakp extends StatefulWidget {
  TambahPrakp({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _TambahPrakpState createState() => _TambahPrakpState(title);
}

class _TambahPrakpState extends State<TambahPrakp> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _TambahPrakpState(this.title);
  bool isLoading = false;
  Dosen dosen = new Dosen();
  File _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  TextEditingController nimController = TextEditingController();
  TextEditingController tahunController = TextEditingController();
  TextEditingController judulController = TextEditingController();
  TextEditingController toolsController = TextEditingController();
  TextEditingController spesifikasiController = TextEditingController();
  TextEditingController lembagaController = TextEditingController();
  TextEditingController pimpinanController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController faxNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
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
                        child: DropdownButton(
                            isExpanded: true,
                            underline: SizedBox(),
                            items: [
                              DropdownMenuItem(
                                  child: Text(
                                'Gasal',
                              )),
                              DropdownMenuItem(
                                  child: Text(
                                'Genap',
                              )),
                            ],
                            onChanged: (item) {}),
                      ),
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
                          controller: tahunController,
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
                          controller: nimController,
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
                          "Judul Kerja Praktik",
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black)),
                        child: TextField(
                          controller: judulController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Masukkan judul KP anda'),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Tools",
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black)),
                        child: TextField(
                          controller: toolsController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Masukkan tools KP Anda'),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Spesifikasi Peranglat Lunak/ Pekerjaan KP",
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black)),
                        child: TextField(
                          controller: spesifikasiController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Tuliskan Spesifikasi Perangkat Lunak'),
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
                          controller: lembagaController,
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
                          controller: pimpinanController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'Masukkan Nama Pimpinan Lembaga KP anda'),
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
                          controller: phoneNumController,
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
                          controller: alamatController,
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
                          controller: faxNumController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Masukkan Fax Lembaga Anda (Jika Ada)'),
                        ),
                      ),

                      // SizedBox(
                      //   height: 15,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       labelText: "Tahun",
                      //       hintText: "Masukan Tahun anda KP",
                      //       border: OutlineInputBorder(),
                      //       contentPadding:
                      //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
                      //   keyboardType: TextInputType.number,
                      //   onSaved: (String value) {
                      //     this.dosen.nidn = value;
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       labelText: "NIM",
                      //       hintText: "Tulis NIM anda",
                      //       border: OutlineInputBorder(),
                      //       contentPadding:
                      //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
                      //   keyboardType: TextInputType.number,
                      //   onSaved: (String value) {
                      //     this.dosen.nama = value;
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       labelText: "Alamat",
                      //       hintText: "Alamat Dosen",
                      //       border: OutlineInputBorder(),
                      //       contentPadding:
                      //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
                      //   onSaved: (String value) {
                      //     this.dosen.alamat = value;
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       labelText: "Email",
                      //       hintText: "Email Dosen",
                      //       border: OutlineInputBorder(),
                      //       contentPadding:
                      //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
                      //   keyboardType: TextInputType.emailAddress,
                      //   onSaved: (String value) {
                      //     this.dosen.email = value;
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       labelText: "Gelar",
                      //       hintText: "Gelar Dosen",
                      //       border: OutlineInputBorder(),
                      //       contentPadding:
                      //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
                      //   keyboardType: TextInputType.emailAddress,
                      //   onSaved: (String value) {
                      //     this.dosen.gelar = value;
                      //   },
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      _imageFile == null
                          ? Text("*Silahkan upload pdf terlebih dahulu")
                          : Image.file(
                              _imageFile,
                              fit: BoxFit.cover,
                              height: 300.0,
                              alignment: Alignment.topCenter,
                              width: MediaQuery.of(context).size.width,
                            ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.blue,
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.picture_as_pdf,
                              color: Colors.white,
                            ),
                            Text(
                              "Upload PDF (Permohonan Surat Keterangan)",
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
                        color: Colors.orange,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Simpan Data"),
                                content: Text(
                                    "Apakah Anda akan menyimpan data ini?"),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () async {
                                        _formState.currentState.save();
                                        setState(() => isLoading = true);
                                        this.dosen.nim_progmob = "72180234";
                                        ApiServices()
                                            .createDosenWithFoto(this.dosen,
                                                _imageFile, _imageFile.path)
                                            .then((isSuccess) {
                                          setState(() => isLoading = false);
                                          if (isSuccess) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                      child: Text("Ya")),
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Tidak"))
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Simpan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                // Center(
                //   child: CircularProgressIndicator(),
                // )
                isLoading
                    ? Stack(
                        children: <Widget>[
                          // Opacity(
                          //   opacity: 0.3,
                          //   child: ModalBarrier(
                          //     dismissible: false,
                          //     color: Colors.grey,
                          //   ),
                          // ),
                          Center(
                            child: CircularProgressIndicator(),
                          )
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

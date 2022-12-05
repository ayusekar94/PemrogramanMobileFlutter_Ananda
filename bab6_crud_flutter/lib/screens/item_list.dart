import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bab6_crud_flutter/model/item.dart';
import 'package:bab6_crud_flutter/database/db_helper.dart';
import 'package:bab6_crud_flutter/screens/item_detail.dart';
import 'package:sqflite/sqflite.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({Key? key}) : super(key: key);

  @override
  _ListItemPageState createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  List<Item> listItem = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    // Menjalankan fungsi getAllItem() ketika aplikasi pertama kali dijalankan
    _getAllItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Kontak App"),
        ),
      ),
      body: ListView.builder(
        itemCount: listKontak.length,
        itemBuilder: (context, index) {
          Kontak kontak = listKontak[index];
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              leading: const Icon(
                Icons.person,
                size: 50,
              ),
              title: Text('${kontak.name}'),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Email: ${kontak.email}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Phone: ${kontak.mobileNo}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Company: ${kontak.company}"),
                  ),
                ],
              ),
              trailing: FittedBox(
                fit: BoxFit.fill,
                child: Row(
                  children: [
                    // button edit
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _openFormEdit(kontak);
                      },
                    ),

                    // button hapus
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Membuat dialog konfirmasi hapus
                        AlertDialog hapus = AlertDialog(
                          title: Text("Information"),
                          content: Container(
                            height: 100,
                            child: Column(
                              children: [
                                Text(
                                  "Yakin ingin menghapus data ${kontak.name}?",
                                )
                              ],
                            ),
                          ),
                          // Terdapat 2 button
                          // Jika ya maka jalankan _deleteKontak() dan tutup dialog
                          // Jika tidak maka tutup dialog
                          actions: [
                            TextButton(
                              onPressed: () {
                                _deleteKontak(kontak, index);
                                Navigator.pop(context);
                              },
                              child: Text("Ya"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Tidak"),
                            ),
                          ],
                        );
                        showDialog(
                            context: context, builder: (context) => hapus);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // Membuat button mengapung di bagian bawah kanan layar
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _openFormCreate();
        },
      ),
    );
  }

  // Mengambil semua data kontak dari database
  Future<void> _getAllItem() async {
    // list menampung data dari database
    var list = await db.getAllKontak();

    // Ada perubahan State
    setState(() {
      // hapus data pada listKontak
      listKontak.clear();

      // lakukan perulangan pada variabel list
      list!.forEach((kontak) {
        // masukkan data ke listKontak
        listKontak.add(Kontak.fromMap(kontak));
      });
    });
  }

  // Menghapus data kontak
  Future<void> _deleteKontak(Kontak kontak, int position) async {
    // hapus data kontak dari database
    await db.deleteKontak(kontak.id!);

    // Ada perubahan State
    setState(() {
      // hapus data kontak dari listKontak
      listKontak.removeAt(position);
    });
  }

  // Membuka halaman tambah kontak
  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormKontak(),
      ),
    );
    if (result == "save") {
      _getAllItem();
    }
  }

  // Membuka halaman edit kontak
  Future<void> _openFormEdit(Kontak kontak) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormKontak(
          kontak: kontak,
        ),
      ),
    );
    if (result == "update") {
      _getAllItem();
    }
  }
}
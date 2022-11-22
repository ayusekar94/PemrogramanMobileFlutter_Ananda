import 'package:flutter/material.dart';
import 'package:bab5_navigasi_rute/widgets/listview.dart';
import 'package:bab5_navigasi_rute/models/item.dart';


// digunakan untuk menampilkan halaman kesatu
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // sumber dari list view ini mengambil dari models item
  final List<Item> items = [
    Item(name: 'Gula', price: 26000, weight: 2),
    Item(name: 'Tepung', price: 12000, weight: 1),
    Item(name: 'Beras', price: 59000, weight: 5),
    Item(name: 'Almond', price: 108000, weight: 1),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List - ANANDA AYU SEKAR"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: MyListView(
          items: items,
          page: '/item',
        ),
      ));
  }
}
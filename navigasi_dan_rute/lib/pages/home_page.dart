import 'package:flutter/material.dart';
import 'package:navigasi_dan_rute/widgets/listview.dart';
import 'package:navigasi_dan_rute/models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item(name: 'Gula', price: 13000, weight: 5),
    Item(name: 'Garam', price: 3000, weight: 4),
    Item(name: 'Minyak', price: 17000, weight: 4),
    Item(name: 'Kecap', price: 5000, weight: 2),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List 'ANANDA'"),
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
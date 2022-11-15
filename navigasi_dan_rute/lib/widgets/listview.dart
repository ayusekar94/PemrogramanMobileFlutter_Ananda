import 'package:flutter/material.dart';
import 'package:navigasi_dan_rute/models/item.dart';
import 'package:navigasi_dan_rute/pages/item_page.dart';
import 'package:navigasi_dan_rute/widgets/card.dart';
import '../pages/item_page.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    Key? key,
    required this.items,
    required this.page,
  }) : super(key: key);

  final List<Item> items;
  final String page;

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index){
        final item = items[index];
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context, ItemPage.routeName, arguments: item);
          },
          child: MyCard(
            name: item.name,
            price: item.price,
            weight: item.weight,
          ),
        );
      },
    );
  }
}
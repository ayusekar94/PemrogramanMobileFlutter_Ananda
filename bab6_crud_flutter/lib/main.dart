import 'package:flutter/material.dart';
import 'package:bab6_crud_flutter/screens/item_detail.dart';
import 'package:bab6_crud_flutter/screens/item_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemList(),
    );
  }
}



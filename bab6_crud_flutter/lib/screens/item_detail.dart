import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bab6_crud_flutter/model/item.dart';
import 'package:bab6_crud_flutter/database/db_helper.dart';

class FormItem extends StatefulWidget {
  final Item? item;

  FormItem({this.item});

  @override
  _FormItemState createState() => _FormItemState();
}

class _FormItemState extends State<FormItem> {
  DbHelper db = DbHelper();

  TextEditingController? name;
  TextEditingController? price;

  @override
  void initState() {
    name = TextEditingController(
        text: widget.item == null ? '' : widget.item!.name);
    price = TextEditingController(
        text: widget.item == null ? '' : widget.item!.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Kontak'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: price,
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: ElevatedButton(
              child: (widget.item == null)
                  ? const Text(
                      'Add',
                      style: const TextStyle(color: Colors.white),
                    )
                  : const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
              onPressed: () {
                upsertItem();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> upsertItem() async {
    if (widget.item != null) {
      // update
      await db.updateItem(Item(
        id: widget.item!.id,
        name: name!.text,
        price: price!.text,
      ));
      Navigator.pop(context, 'update');
    } else {
      // insert
      await db.saveItem(Item(
        name: name!.text,
        price: price!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
import 'package:flutter/material.dart';

class riwayatSuhu extends StatelessWidget {
  const riwayatSuhu({
    Key? key,
    required this.listHasil,
  }) : super(key: key);

  final List<String> listHasil;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listHasil.length,
        itemBuilder: (context, index) {
          return Text(listHasil[index], textAlign: TextAlign.center,);
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

class hasilKonversiSuhu extends StatelessWidget {
  const hasilKonversiSuhu({
    Key? key,
    required this.hasilPerhitungan,
  }) : super(key: key);

  final int hasilPerhitungan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Hasil",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '$hasilPerhitungan',
            style: TextStyle(fontSize: 32),
          ),
        ],
      ),
    );
  }
}
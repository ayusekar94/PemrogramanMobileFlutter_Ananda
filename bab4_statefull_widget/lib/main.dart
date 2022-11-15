import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bab4_statefull_widget/widgets/hasilKonversiSuhu.dart';
import 'package:bab4_statefull_widget/widgets/input.dart';
import 'package:bab4_statefull_widget/widgets/riwayatSuhu.dart';
import 'package:bab4_statefull_widget/widgets/targetKonversiSuhu.dart';
import 'package:bab4_statefull_widget/widgets/tombolKonversiSuhu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BAB 4 Konverter Suhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Fahrenheit'];
  String selectedDropDown = 'Kelvin';
  int hasilPerhitungan = 0;
  List<String> listHasil = <String>[];

  void onDropDownChanged(Object? value) {
    return setState(() {
      selectedDropDown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
       if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case 'Kelvin':
            hasilPerhitungan = int.parse(etInput.text) + 273;
            break;
          case 'Reamur':
            hasilPerhitungan = (4 * int.parse(etInput.text) / 5) as int;
            break;
          case 'Fahrenheit':
            hasilPerhitungan = (9 * int.parse(etInput.text) / 5) as int;
            break;
          default:
        }
        listHasil.add(selectedDropDown + " : " + hasilPerhitungan.toString());
      }
    
    });
  }

  double _current = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'konversi suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bab 4 - Konverter Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Slider(
                value: _current,
                min: 0,
                max: 200,
                divisions: 200,
                label: _current.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _current = value;
                    etInput.text = _current.toString();
                  });
              }),
              targetKonversiSuhu(
                selectedDropDown: selectedDropDown,
                listSatuanSuhu: listSatuanSuhu,
                onDropDownChanged: onDropDownChanged,
                konversiSuhu: konversiSuhu,
              ),
              hasilKonversiSuhu(hasilPerhitungan: hasilPerhitungan),
              tombolKonversiSuhu(
                konversiSuhu: konversiSuhu,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Riwayat Konversi',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              riwayatSuhu(listHasil: listHasil)
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:quran_api/controller/theme_controller.dart';
import 'package:quran_api/utils/curdex.dart';
import 'package:quran_api/views/details/detail_juz_view.dart';
import 'package:quran_api/views/details/detail_surah_view.dart';
import 'package:quran_api/views/home/home_view.dart';
import 'package:quran_api/views/introduction/introduction_view.dart';
import 'package:flutter/material.dart';

void main() async {
  // pengait fremework dan flutter
  WidgetsFlutterBinding.ensureInitialized();
  ThemeController.themePref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ThemeController.isDark,
        builder: (_, value, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: curdex,
            title: 'Al-Quran',
            theme: ThemeController.getTheme(),
            initialRoute: '/',
            routes: {
              '/': (context) => const IntroductionView(),
              '/home': (context) => const HomeView(),
              '/detail-surah': (context) => const DetailSurahView(),
              '/detail-juz': (context) => const DetailJuzView(),
            },
          );
        });
  }
}

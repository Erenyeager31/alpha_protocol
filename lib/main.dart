import 'package:alpha_protocol/options.dart';
import 'package:flutter/material.dart';
// import 'package:hunt/homePage.dart';
// import 'package:hunt/quizPage.dart';
// import 'package:hunt/startPage.dart';
// import 'package:hunt/testPage.dart';
import 'package:alpha_protocol/home_page.dart';
import 'package:alpha_protocol/quiz_page.dart';
import 'package:alpha_protocol/start_page.dart';
// ignore: library_prefixes
import 'package:alpha_protocol/themes.dart' as Theme;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.CommonMethod().themedata,
      debugShowCheckedModeBanner: false,
      title: 'Treasure Hunt',
      initialRoute: '/',
      routes: {
        '/': (context) => home_page(),
        // '/': (context) => options(),
        // '/test' : (context) => testPage(),
        // '/intro': (context) => start_page(),
        '/quiz_page': (context) => quiz_page(otp: '1',),
        // '/master_clue': (context) => master_clue(),
      },
    );
  }
}

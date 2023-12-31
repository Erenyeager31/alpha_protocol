// ignore_for_file: unused_import

import 'package:alpha_protocol/errorPage.dart';
import 'package:alpha_protocol/finalPage.dart';
import 'package:alpha_protocol/master_clue.dart';
import 'package:alpha_protocol/options.dart';
import 'package:alpha_protocol/quiz_state.dart';
import 'package:flutter/material.dart';
// import 'package:hunt/homePage.dart';
// import 'package:hunt/quizPage.dart';
// import 'package:hunt/startPage.dart';
// import 'package:hunt/testPage.dart';
import 'package:alpha_protocol/quiz_page.dart';
// ignore: library_prefixes
import 'package:alpha_protocol/themes.dart' as Theme;
import 'package:provider/provider.dart';
import 'start_page.dart';
import 'home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => quiz_state(1800,0),
    child: MyApp(),
    ),
  );
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
        '/quiz_page': (context) => quiz_page(otp: '1',),
        // '/': (context) => quiz_page(otp: '123453'),
        // '/': (context) => options(i: 0, ms_clue: 0, timerController: 0, onIndexChanged: (int){}, ontimechanged: (int){}),
        // '/': (context) => errorPage(otp: "111111", level: 14, time: "12.32"),
        // '/':(context) => finalPage(sec:3, otp: "111111", index: 10,quizIndex: 2,)
        // '/': (context) => master_clue(quizIndex: 0, ms_clue: 1, sec: 30, index: 0, onIndexChanged: (int){}, ontimechanged: (int){}, mode: "0" )
      },
    );
  }
}

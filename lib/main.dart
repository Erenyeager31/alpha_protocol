import 'package:alpha_protocol/finalPage.dart';
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
        // '/': (context) => home_page(),
        '/': (context) => quiz_page(otp: '1',email: '',),
        // '/test' : (context) => testPage(),
        // '/intro': (context) => start_page(),
        '/quiz_page': (context) => quiz_page(otp: '1',email:'',),
        // '/master_clue': (context) => master_clue(),
        // '/': (context) => finalPage(),
      },
    );
  }
}

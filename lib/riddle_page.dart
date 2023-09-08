// ignore_for_file: use_build_context_synchronously, unused_import

import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'quiz_page.dart';
import 'themes.dart' as Theme;

// ignore: camel_case_types
class riddle_page extends StatefulWidget {
  @override
  _riddle_pageState createState() => _riddle_pageState();
}

class _riddle_pageState extends State<riddle_page> {
  // variables
  late String resp;
  final otp = TextEditingController();
  bool isLoading = false;

  //Snackbar
  void showSnackBar(BuildContext context, text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(
            color: const Color(0xff181920),
            fontFamily: GoogleFonts.varela().fontFamily),
      ),
      backgroundColor: const Color(0xff64E54C),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(50),
      elevation: 20,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(height: 180, image: AssetImage('assets/codex.png')),
            const Text('ALPHA PROTOCOL',
                style: TextStyle(color: Color(0xff656b7c))),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText('Into the shoes of a sleeper agent...',
                    textStyle: const TextStyle(fontSize: 20),
                    cursor: '|',
                    speed: const Duration(milliseconds: 90)),
              ],
            ),
            const SizedBox(height: 55),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xff282c34),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  style: const TextStyle(color: Colors.green, fontSize: 18),
                  controller: otp,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Enter Code",
                    hintStyle: TextStyle(color: Color(0xff656b7c)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: Theme.button1,
              child: const Text("Start"),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                setState(() {
                  isLoading = false;
                });
              },
            )
          ],
        )),
      ),
    );
  }
}
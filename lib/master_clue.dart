import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart' as Data;

class master_clue extends StatefulWidget {
  int ms_clue;
  master_clue({required this.ms_clue});

  @override
  _master_clueState createState() => _master_clueState();
}

class _master_clueState extends State<master_clue> {
  void showSnackBar(BuildContext context, text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(
          color: Color(0xff181920),
          fontFamily: GoogleFonts.varela().fontFamily,
        ),
      ),
      backgroundColor: Color(0xff64E54C),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(50),
      elevation: 20,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> scanBarCode() async {
    try {
      final ScanResult = await FlutterBarcodeScanner.scanBarcode(
          '#FFF44336', "Cancel", true, ScanMode.BARCODE);
      // if (!mounted) return;
      if (ScanResult == Data.quizItems[3][0].answer) {
          // showSnackBar(context, "Correct");
          
      } else if (ScanResult == '-1') {
        print('test bro');
      } else {
      }
    } on FormatException {
      print('back');
    } on PlatformException {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Master Clue ${widget.ms_clue + 1}'),
          foregroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image.network(widget.ms_clue),
                      Text("Master Clue"),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16, // Adjust the bottom margin as needed
              right: 16, // Adjust the right margin as needed
              child: FloatingActionButton(
                onPressed: scanBarCode,
                child: Icon(Icons.qr_code_scanner),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: unused_import

import 'package:alpha_protocol/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image/network.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart' as Data;

class TimerController {
  late Timer timer;
  int remainingTime;
  BuildContext context;
  Function() NavigationFunction;
  TimerController(this.remainingTime, this.context, this.NavigationFunction);

  void startTimer(void Function() onTimerTick) {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime <= 0) {
        timer.cancel();
        // showupSnackbar(context);
        NavigationFunction();
      } else {
        remainingTime--;
        onTimerTick();
      }
    });
  }

  void cancelTimer() {
    timer.cancel();
  }
}

class master_clue extends StatefulWidget {
  int quizIndex;
  int ms_clue;
  int sec;
  final int index;
  final Function(int) onIndexChanged;
  final Function(int) ontimechanged;
  String mode;
  master_clue(
      {
      required this.quizIndex,
      required this.ms_clue,
      required this.sec,
      required this.index,
      required this.onIndexChanged,
      required this.ontimechanged,
      required this.mode}) {
    print("master_clue");
  }
  @override
  _master_clueState createState() => _master_clueState();
}

class _master_clueState extends State<master_clue> {
  int m_sec = 300;
  late TimerController timerController;

  formatedTime(time) {
    int m_sec = time % 60;
    int min = (time / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = m_sec.toString().length <= 1 ? "0$m_sec" : "$m_sec";
    return "$minute min $second sec";
  }

  // Time to return for API post
  returnTime(time) {
    int m_sec = time % 60;
    int min = (time / 60).floor();
    return "$min.$m_sec";
  }

  // countdown timer function
  void countTimer() {
    timerController.startTimer(() {
      setState(() {
        m_sec = timerController.remainingTime;
      });
    });
  }

  // reduce time by 30 sec
  void reduceTime() {
    if (m_sec <= 30) {
      setState(() {
        m_sec = 2;
      });
    } else {
      setState(() {
        m_sec -= 30;
      });
    }
  }

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
      // final quizstate = Provider.of<quiz_state>(context);
      if (ScanResult == Data.quizItems[widget.quizIndex + widget.ms_clue][int.parse(widget.mode)].answer) {
        showSnackBar(context, "Correct");

        if (widget.mode == "0") {
          widget.onIndexChanged(widget.index + 3);
          // widget.ontimechanged(widget.sec + 240);
        } else if (widget.mode == "1") {
          widget.onIndexChanged(widget.index + 2);
          final newtimer = widget.sec + 240;
          widget.ontimechanged(newtimer);
        }

        Navigator.of(context).pop();
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => quiz_page(
        //           otp: '',
        //         )));
      } else if (ScanResult == '-1') {
        print('test bro');
        showSnackBar(context, "Incorrect");
      } else {}
    } on FormatException {
      print('back');
    } on PlatformException {
      print("error");
    }
  }

  @override
  void initState() {
    super.initState();
    timerController = TimerController(m_sec, context, () {
      showSnackBar(context, "Timer Finished! Redirecting Back to Quiz Page");

      Timer(Duration(seconds: 3), () {
        widget.onIndexChanged(widget.index + 1);
        widget.ontimechanged(widget.sec - 120);
        Navigator.of(context).pop();
      });
    });
    countTimer();
    print('timer worked');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.qr_code_scanner),
            onPressed: scanBarCode,
        ),
        appBar: AppBar(
          leading: Icon(
            Icons.timer,
          ),
          title: Text(formatedTime(m_sec)),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Vector has sent you a lead...'),
                ),
                InteractiveViewer(
                    child: Padding(
                  padding: EdgeInsets.all(12.0),
                  // child : Image.network(Data.quizItems[0][index].link)
                  child: new Image(
                    image: new NetworkImageWithRetry(
                        Data.quizItems[widget.quizIndex + widget.ms_clue][int.parse(widget.mode)].link),
                  ),
                  // child: CachedNetworkImage(
                  //   imageUrl: Data.quizItems[quizIndex][index].link,
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                )),
                SizedBox(height: 75)
              ],
            ))),
          )
      ),
    );
  }
}

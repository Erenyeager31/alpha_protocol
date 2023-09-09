// // ignore_for_file: unused_import

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart';
// import 'themes.dart' as Theme;
// import 'dart:convert';
// import 'dart:io';
// import 'package:alpha_protocol/options.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter_image/network.dart';
// import 'package:flutter_windowmanager/flutter_windowmanager.dart';
// import 'errorPage.dart';
// import 'finalPage.dart';
// import 'main.dart';
// import 'package:http/http.dart' as http;
// import 'data.dart' as Data;

// class TimerController {
//   late Timer timer;
//   int remainingTime;
//   BuildContext context;
//   Function() TimerFinished_close;
//   TimerController(this.remainingTime, this.context, this.TimerFinished_close);

//   void startTimer(void Function() onTimerTick) {
//     timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (remainingTime <= 0) {
//         timer.cancel();
//         TimerFinished_close();
//         // Handle timer completion if needed
//       } else {
//         remainingTime--;
//         onTimerTick();
//       }
//     });
//   }

//   void cancelTimer() {
//     timer.cancel();
//   }
// }

// class finalPage extends StatefulWidget {
//   // String img;
//   // finalPage({required this.img}) ;
//   int remainingTime;
//   String otp;
//   int index;
//   finalPage(
//       {required this.remainingTime, required this.otp, required this.index});

//   @override
//   _finalPageState createState() => _finalPageState();
// }

// class _finalPageState extends State<finalPage> {
//   final riddle_answer = TextEditingController();
//   int remainingTime = 30;
//   late TimerController timerController;

//   Future<void> add_score() async {
//     showSnackBar(context, formatedTime(remainingTime));
//     final time_in_string = formatedTime(remainingTime).toString();
//     final time = time_in_string.split(" ");
//     final time_final = time[0] + "." + time[2];

//     // showSnackBar(context, "$widget.otp");
//     // final otp_value = widget.otp.toString();
//     // showSnackBar(context, otp_value);
//     try {
//       http.Response resp = await http.post(
//         Uri.parse('https://1b6c-139-5-239-162.ngrok-free.app/ap/addscr'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode([
//           {
//             "otp": widget.otp,
//             // "otp":"123456",
//             "level": widget.index,
//             // "time": double.parse(returnTime(mainSec - sec)),
//             "time": time_final
//           }
//         ]),
//       );

//       showSnackBar(context, "$resp.status");
//     } on SocketException catch (e) {
//       // Navigator.of(context).push(MaterialPageRoute(
//       //     builder: (context) => errorPage(
//       //         otp: widget.otp,
//       //         level: widget.index,
//       //         time: double.parse())));
//     }
//   }

//   formatedTime(time) {
//     int sec = time % 60;
//     int min = (time / 60).floor();
//     String minute = min.toString().length <= 1 ? "0$min" : "$min";
//     String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
//     return "$minute min $second sec";
//   }

//   returnTime(time) {
//     int sec = time % 60;
//     int min = (time / 60).floor();
//     return "$min.$sec";
//   }

//   // countdown timer function
//   void countTimer() {
//     timerController.startTimer(() {
//       setState(() {
//         remainingTime = timerController.remainingTime;
//       });
//     });
//   }

//   // reduce time by 30 sec
//   void reduceTime() {
//     if (remainingTime <= 30) {
//       setState(() {
//         remainingTime = 2;
//       });
//     } else {
//       setState(() {
//         remainingTime -= 30;
//       });
//     }
//   }

//   void showSnackBar(BuildContext context, text) {
//     final snackBar = SnackBar(
//       content: Text(
//         text,
//         style: TextStyle(
//             color: Color(0xff181920),
//             fontFamily: GoogleFonts.varela().fontFamily),
//       ),
//       backgroundColor: Color(0xff64E54C),
//       behavior: SnackBarBehavior.floating,
//       margin: EdgeInsets.all(50),
//       elevation: 20,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

//    @override
//   void initState() {
//     int sec = widget.remainingTime;
//     timerController = TimerController(sec, context, () {
//       showSnackBar(context, "Timer Finished! Closing the App");

//       //!API call
//       add_score();
//       Timer(Duration(seconds: 3), () {
//         // Navigator.of(context).pop();
//         showSnackBar(context, "Score Added");
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(formatedTime(remainingTime)),
//           foregroundColor: Colors.black,
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//               child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10, right: 10),
//                   child: Center(
//                     child: Container(
//                         decoration: BoxDecoration(
//                             // color: Colors.white
//                             ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 10, right: 10),
//                           child: Text(
//                               style: TextStyle(fontSize: 25),
//                               "Solve the Riddle and Enter the Answer to Achieve your Final Objective"),
//                         )),
//                   ),
//                 ),
//                 const SizedBox(height: 55),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Container(
//                     width: 300,
//                     height: 50,
//                     decoration: BoxDecoration(
//                         color: const Color(0xff282c34),
//                         borderRadius: BorderRadius.circular(12)),
//                     child: TextField(
//                       style: const TextStyle(color: Colors.green, fontSize: 18),
//                       controller: riddle_answer,
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.question_mark_rounded),
//                         hintText: "Enter the Answer to Riddle",
//                         hintStyle: TextStyle(color: Color(0xff656b7c)),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: ElevatedButton(
//                       style: Theme.button1,
//                       onPressed: () {
//                         showSnackBar(context, riddle_answer.text);
//                         final value = widget.remainingTime.toString();
//                         showSnackBar(context, value);
//                       },
//                       child: Text("SUBMIT")),
//                 )
//               ],
//             ),
//           )),
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';
import 'package:alpha_protocol/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'data.dart' as Data;
import 'themes.dart' as Theme;
import 'package:alpha_protocol/options.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_image/network.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'errorPage.dart';
import 'finalPage.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
// late finalPage masterclue;
// late _finalPageState mastercluestate;

// void showupSnackbar(BuildContext context){
//   final snackBar = SnackBar(
//     content: Text(
//       "Timer is over! you will be redirected back to quiz page",
//       style: TextStyle(
//         color: Color(0xff181920),
//         fontFamily: GoogleFonts.varela().fontFamily,
//       ),
//     ),
//     backgroundColor: Color(0xff64E54C),
//     behavior: SnackBarBehavior.floating,
//     margin: EdgeInsets.all(50),
//     elevation: 20,
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }

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

class finalPage extends StatefulWidget {
  // int ms_clue;
  // int sec;
  // final int index;
  // final Function(int) onIndexChanged;
  // final Function(int) ontimechanged;

  int sec;
  String otp;
  int index;
  // String mode;
  finalPage(
      {
      required this.sec,
      required this.otp,
      required this.index,
      }) {
    print("finalPage");
  }
  @override
  _finalPageState createState() => _finalPageState();
}

class _finalPageState extends State<finalPage> {
  final riddle_answer = TextEditingController();
  int m_sec = 240;
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
        widget.sec = timerController.remainingTime;
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

  // Future<void> scanBarCode() async {
  //   try {
  //     final ScanResult = await FlutterBarcodeScanner.scanBarcode(
  //         '#FFF44336', "Cancel", true, ScanMode.BARCODE);
  //     // if (!mounted) return;
  //     // final quizstate = Provider.of<quiz_state>(context);
  //     if (ScanResult == Data.quizItems[4][widget.ms_clue].answer) {
  //       showSnackBar(context, "Correct");

  //       if (widget.mode == "0") {
  //         widget.onIndexChanged(widget.index + 3);
  //         // widget.ontimechanged(widget.sec + 240);
  //       } else if (widget.mode == "1") {
  //         widget.onIndexChanged(widget.index + 2);
  //         final newtimer = widget.sec + 240;
  //         widget.ontimechanged(newtimer);
  //       }

  //       Navigator.of(context).pop();
  //       // Navigator.of(context).push(MaterialPageRoute(
  //       //     builder: (context) => quiz_page(
  //       //           otp: '',
  //       //         )));
  //     } else if (ScanResult == '-1') {
  //       print('test bro');
  //       showSnackBar(context, "Incorrect");
  //     } else {}
  //   } on FormatException {
  //     print('back');
  //   } on PlatformException {
  //     print("error");
  //   }
  // }
  Future<void> add_score() async {
    showSnackBar(context, formatedTime(widget.sec));
    final time_in_string = formatedTime(widget.sec).toString();
    final time = time_in_string.split(" ");
    final time_final = time[0]+"."+time[2];


    // showSnackBar(context, "$widget.otp");
    // final otp_value = widget.otp.toString();
    // showSnackBar(context, otp_value);
    try {
      http.Response resp = await http.post(
        Uri.parse('https://1b6c-139-5-239-162.ngrok-free.app/ap/addscr'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode([
          {
            // "otp": widget.otp,
            "otp": "523060",
            // "otp":"123456",
            "level": 15,
            // "time": double.parse(returnTime(mainSec - sec)),
            "time": time_final
          }
        ]),
      );

      showSnackBar(context, "$resp.status");
    } on SocketException catch (e) {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => errorPage(
      //         otp: widget.otp,
      //         level: 15,
      //         time: double.parse(returnTime(mainSec - sec)))));
    }
  }


  @override
  void initState() {
    super.initState();
    timerController = TimerController(widget.sec, context, () {
      showSnackBar(context, "Timer Finished! Redirecting Back to Quiz Page");

      Timer(Duration(seconds: 3), () {
        // widget.onIndexChanged(widget.index + 1);
        // widget.ontimechanged(widget.sec - 240);
        // Navigator.of(context).pop();
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
        appBar: AppBar(
          title: Text(formatedTime(widget.sec)),
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.white
                            ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                              style: TextStyle(fontSize: 25),
                              "Solve the Riddle and Enter the Answer to Achieve your Final Objective"),
                        )),
                  ),
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
                      controller: riddle_answer,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.question_mark_rounded),
                        hintText: "Enter the Answer to Riddle",
                        hintStyle: TextStyle(color: Color(0xff656b7c)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                      style: Theme.button1,
                      onPressed: () {
                        showSnackBar(context, riddle_answer.text);

                        if (riddle_answer.text == "123456"){
                          add_score();
                        }
                      },
                      child: Text("SUBMIT")),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:alpha_protocol/options.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_image/network.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'errorPage.dart';
import 'finalPage.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'data.dart' as Data;
import 'themes.dart' as Theme;

class TimerController {
  late Timer timer;
  int remainingTime;
  BuildContext context;
  Function() TimerFinished_close;
  TimerController(this.remainingTime, this.context, this.TimerFinished_close);

  void startTimer(void Function() onTimerTick) {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime <= 0) {
        timer.cancel();
        TimerFinished_close();
        // Handle timer completion if needed
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

class quiz_page extends StatefulWidget {
  String otp;
  // int i;
  int ms_clue = 0;
  // String email;
  quiz_page({
    required this.otp,
    // required this.email
  });
  @override
  _quiz_pageState createState() => _quiz_pageState();
}

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        margin: EdgeInsets.all(8.0), // Add margin between Radio buttons
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white, // Color for unselected Radio button
            width: 2.0,
          ),
        ),
        child: Center(
          child: groupValue == value
              ? Container(
                  width: 12.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // Color for selected Radio button
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class _quiz_pageState extends State<quiz_page> {
  // Clues indexing
  // List? story_index = List.filled(3, null, growable: false);
  var story_index = [0,3,6];
  String _selectedValue = "None";
  int index = 0;
  int noQuiz = 10; //length -1
  late int quizIndex;
  late TimerController timerController;
  //timer
  int mainSec = 1800; //1800
  int sec = 2100;
  late Timer timer;

  void onIndexChanged(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void ontimechanged(int sec_updated) {
    setState(() {
      timerController.remainingTime = sec_updated;
    });
  }

  //Snackbar
  void showSnackBar(BuildContext context, text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(
            color: Color(0xff181920),
            fontFamily: GoogleFonts.varela().fontFamily),
      ),
      backgroundColor: Color(0xff64E54C),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(50),
      elevation: 20,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //Countdown timer to display on Appbar
  formatedTime(time) {
    int sec = time % 60;
    int min = (time / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute min $second sec";
  }

  // Time to return for API post
  returnTime(time) {
    int sec = time % 60;
    int min = (time / 60).floor();
    return "$min.$sec";
  }

  // countdown timer function
  void countTimer() {
    // timer = Timer.periodic(Duration(seconds: 1), (_) {
    //   if (sec == 1) {
    //     timer.cancel();
    //     // test2();
    //     Navigator.of(context).pop();
    //     showSnackBar(context, "Time over !");
    //   }
    //   setState(() {
    //     sec--;
    //   });
    // });
    timerController.startTimer(() {
      setState(() {
        sec = timerController.remainingTime;
      });
    });
  }

  // reduce time by 30 sec
  void reduceTime() {
    if (timerController.remainingTime <= 30) {
      setState(() {
        timerController.remainingTime = 2;
      });
    } else {
      setState(() {
        timerController.remainingTime -= 30;
      });
    }
  }

  void navigateToOptions(int ms_clue_index) async {
    final selectedRemainingTime = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (context) => options(
          i: index,
          quizIndex:quizIndex,
          ms_clue: ms_clue_index,
          timerController: sec,
          onIndexChanged: onIndexChanged,
          ontimechanged: ontimechanged,
        ),
      ),
    );
    if (selectedRemainingTime != null) {
      // showSnackBar(context, "$selectedRemainingTime");
      setState(() {
        timerController.remainingTime = selectedRemainingTime;
      });
      // showSnackBar(context, "$sec");
    }

    // ... Rest of your code ...
  }

  // BarCode scanning Function
  Future<void> scanBarCode() async {
    // showSnackBar(context, "$index");
    try {
      final ScanResult = await FlutterBarcodeScanner.scanBarcode(
          '#FFF44336', "Cancel", true, ScanMode.BARCODE);
      if (!mounted) return;
      if (ScanResult == Data.quizItems[quizIndex][index + 1].answer) {
        // showSnackBar(context, index);
        print(index);
        if (index == 1) {
          showSnackBar(context,
              "Congrats you have solved ${index + 1} clues and are now Eligible for Alternatives");
          Timer(Duration(seconds: 1), () {
            //!This functions works such that when context is popped from the options or other pages the value of
            //! index is updated by using the function onIndexChanges as defined above
            //! and the remaining time is returned as it is or can be modified within the master_clue page
            navigateToOptions(1);
          });
        } else if (index == 5) {
          showSnackBar(context,
              "Congrats you have solved ${index + 1} clues and are now Eligible for Alternatives");
          Timer(Duration(seconds: 1), () {
            //!This functions works such that when context is popped from the options or other pages the value of
            //! index is updated by using the function onIndexChanges as defined above
            //! and the remaining time is returned as it is or can be modified within the master_clue page
            navigateToOptions(2);
          });
        } else {
          showSnackBar(context, 'Clue Obtained !');
          setState(() {
            index += 1;
          });
          // showSnackBar(context, "$index");
        }

        // add logic for the options page here
        if (index == noQuiz) {
            showSnackBar(context, "Final Page");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    // finalPage(img: Data.quizItems[quizIndex][index].link)));
                    finalPage(sec: timerController.remainingTime,otp: widget.otp,index: index+1,quizIndex: quizIndex,)));
        }
      } else if (ScanResult == '-1') {
        print('test bro');
      } else {
        print(ScanResult);
        print(ScanResult.runtimeType);
        reduceTime();
        showSnackBar(context, 'Wrong Lead ! Time deducted by 30 seconds ');
      }
    } on FormatException {
      print('back');
    } on PlatformException {
      print("error");
    }
  }

  // testing function nothing imp
  // Future<void> test2() async {
  //   try {
  //     http.Response resp = await http.post(
  //       Uri.parse('https://alphaprotocol.herokuapp.com/ap/addscr'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode([
  //         {
  //           "otp": widget.otp,
  //           "level": index,
  //           "time": double.parse(returnTime(mainSec - sec)),
  //         }
  //       ]),
  //     );
  //   } on SocketException catch (e) {
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => errorPage(
  //             otp: widget.otp,
  //             level: index,
  //             time: double.parse(returnTime(mainSec - sec)))));
  //   }
  // }

  //disable screenshots
  Future<void> add_score() async {
    showSnackBar(context, formatedTime(sec));
    final time_in_string = formatedTime(sec).toString();
    final time = time_in_string.split(" ");
    final time_final = time[0]+"."+time[2];


    // showSnackBar(context, "$widget.otp");
    // final otp_value = widget.otp.toString();
    // showSnackBar(context, otp_value);
    try {
      http.Response resp = await http.post(
        //?temp link
        Uri.parse('http://ec2-16-171-144-143.eu-north-1.compute.amazonaws.com:8000/ap/addscr'),
        //?old link
        // Uri.parse('https://1b6c-139-5-239-162.ngrok-free.app/ap/addscr'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode([
          {
            "otp": widget.otp,
            // "otp":"123456",
            "level": index,
            // "time": double.parse(returnTime(mainSec - sec)),
            "time": time_final
          }
        ]),
      );

      showSnackBar(context, "$resp.status");
    } on SocketException catch (e) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => errorPage(
              otp: widget.otp,
              level: index,
              time: time_final)));
    }
  }


  Future<void> disableCapture() async {
    //disable screenshots and record screen in current screen
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  // actual app code
  @override
  void initState() {
    // showSnackBar(context, "$widget.otp");
    disableCapture();
    // countTimer();
    timerController = TimerController(sec, context, () {
      showSnackBar(context, "Timer Finished! Closing the App");

      //!API call
      add_score();
      Timer(Duration(seconds: 3), () {
        // Navigator.of(context).pop();
        showSnackBar(context, "Score Added ! CLosing the App");
      });
      Timer(Duration(seconds: 2), () {
        // Navigator.of(context).pop();
        exit(0);
      });
    });
    countTimer();
    print(widget.otp);
    // quizIndex = int.parse(widget.otp[3]) -1 ;

    //! commented the above line and added the below code
    //! with error handling using chatgpt
    try {
      // if (widget.otp.length >= 4) {
      //   // quizIndex = int.parse(widget.otp[3]);
      //   quizIndex = 0;
      //   if (quizIndex < 0 || quizIndex > 3) {
      //     // Handle out-of-range values if needed
      //     quizIndex = 0; // Set a default value
      //   }
      // } else {
      //   // Handle cases where widget.otp doesn't have enough characters
      //   quizIndex = 0; // Set a default value
      // }
      // final random = Random();
      // int min = 0;
      // int max = 2;
      // // quizIndex = min + random.nextInt(max - min + 1);
      // final random_index = min + random.nextInt(max-min + 2);
      // quizIndex = story_index[random_index];
    // quizIndex = int.parse(widget.otp[3]) -1 ;
      final value = int.parse(widget.otp[5]);
      print(value);
      quizIndex = value;
      print(quizIndex);
    } catch (e) {
      // Handle parsing errors or other exceptions here
      quizIndex = 0; // Set a default value
    }

    // quizIndex =1;
    print(quizIndex);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // showSnackBar(context, index);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.qr_code_scanner),
            onPressed: scanBarCode,

            //onPressed: test2,
          ),
          appBar: AppBar(
            leading: Icon(
              Icons.timer,
            ),
            title: Text(formatedTime(sec)),
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
                        Data.quizItems[quizIndex][index].link),
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
          )),
    );
  }
}

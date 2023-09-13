import 'dart:convert';
import 'dart:io';
import 'package:alpha_protocol/data.dart';
import 'package:alpha_protocol/errorPage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'themes.dart' as Theme;
import 'package:http/http.dart' as http;
import 'data.dart' as data;

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
  int sec;
  String otp;
  int index;
  int quizIndex;
  // String mode;
  finalPage(
      {required this.sec,
      required this.otp,
      required this.index,
      required this.quizIndex}) {
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
      backgroundColor: Color.fromARGB(255, 65, 215, 27),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(50),
      elevation: 20,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> add_score(int difference) async {
    // showSnackBar(context, formatedTime(widget.sec));
    final time_in_string = formatedTime(widget.sec).toString();
    final time = time_in_string.split(" ");
    final time_final = time[0] + "." + time[2];
    // showSnackBar(context, widget.otp);
    final otp_value = widget.otp.toString();
    try {
      http.Response resp = await http.post(
        Uri.parse('https://codexsfit.pythonanywhere.com/ap/addscr'),
        // Uri.parse('https://1b6c-139-5-239-162.ngrok-free.app/ap/addscr'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode([
          {"otp": otp_value,
          "level": 10-difference,
          "time": time_final}
        ]),
      );

      // showSnackBar(context, "$resp.status");
    } on SocketException catch (e) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => errorPage(
              otp: otp_value,
              level: 15-difference,
              time: time_final)));
    }
        // Navigator.of(context).pop();
        exit(0);
  }

  @override
  void initState() {
    super.initState();
    timerController = TimerController(widget.sec, context, () {
      showSnackBar(context, "Timer Finished! Redirecting Submitting the Score");
      add_score(1);
      Timer(Duration(seconds: 5), () {
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
                        // showSnackBar(context, riddle_answer.text);
                        // showSnackBar(context, widget.index.toString());
                        // showSnackBar(context, widget.quizIndex.toString());
                        // showSnackBar(context, data.quizItems[widget.quizIndex][widget.index].answer);
                        if (riddle_answer.text ==
                            data.quizItems[widget.quizIndex][widget.index]
                                .answer) {
                                  showSnackBar(context, "Congratulations you have solved the Riddle !");
                          add_score(0);
                          // showSnackBar(context, "hi");
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

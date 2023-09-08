import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'themes.dart' as Theme;

class finalPage extends StatefulWidget {
  // String img;
  // finalPage({required this.img}) ;
  @override
  _finalPageState createState() => _finalPageState();
}

class _finalPageState extends State<finalPage> {
  final riddle_answer = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Final Stage'),
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
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Text(
                          style: TextStyle(
                            fontSize: 25
                          ),
                          "Solve the Riddle and Enter the Answer to Achieve your Final Objective"),
                      )),
                  ),
                ),
                const SizedBox(height: 55),
                Padding(
                  padding: const EdgeInsets.all(
                      20.0),
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
                    onPressed: (){
                      showSnackBar(context, riddle_answer.text);
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

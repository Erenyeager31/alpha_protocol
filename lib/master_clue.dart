import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class master_clue extends StatelessWidget {

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
    // TODO: implement build

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Skip CLue"),
                    Radio(value: "Skip Clue", groupValue: "toggle", onChanged: (value){
                      showSnackBar(context, value);
                    }),
                  ],
                    
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Add Timer"),
                    Radio(value: "Add Timer", groupValue: "toggle", onChanged: (value){
                      showSnackBar(context, value);
                    }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                //     Align(
                //   alignment: Alignment.bottomCenter,
                //   child: 
                //       ElevatedButton(onPressed: (){
                //         print("object");
                //       }, child: Text("hi"))
                // ),
                  ],
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,child: Text("hi"),),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ));
  }
}

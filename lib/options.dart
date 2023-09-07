import 'package:alpha_protocol/master_clue.dart';
import 'package:alpha_protocol/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'themes.dart' as Theme;

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

// ignore: must_be_immutable
class options extends StatefulWidget {
  int i;
  int ms_clue;
  final int timerController;
  final Function(int) onIndexChanged;
  final Function(int) ontimechanged;
  options(
      {required this.i,
      required this.ms_clue,
      required this.timerController,
      required this.onIndexChanged,
      required this.ontimechanged});
  @override
  _optionsState createState() => _optionsState();
}

class _optionsState extends State<options> {
  String _selectedValue = "None";

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 100, top: 100),
                child: Text("Please Select an Option")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Skip 2 Clues"),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: CustomRadio<String>(
                    value: "0",
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                      // showSnackBar(context, value!);
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Add Timer"),
                CustomRadio<String>(
                  value: "1",
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                    // showSnackBar(context, value!);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("None"),
                Container(
                  margin: EdgeInsets.only(left: 55),
                  child: CustomRadio<String>(
                    value: "2",
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                      // showSnackBar(context, value!);
                    },
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 200),
              child: ElevatedButton(
                style: Theme.button1,
                onPressed: () {
                  // showSnackBar(context, _selectedValue);
                  if (_selectedValue == '0') {
                    
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => master_clue(
                            ms_clue: widget.ms_clue,
                            sec: widget.timerController,
                            index: widget.i,
                            onIndexChanged: widget.onIndexChanged,
                            ontimechanged:widget.ontimechanged)));
                  } else if (_selectedValue == '1') {
                    // showSnackBar(context, 'the time is ${widget.timerController}');
                  } else {
                    widget.onIndexChanged(widget.i + 1);
                    Navigator.of(context).pop(widget.timerController + 300);
                    // Navigator.of(context).pop(widget.timerController);
                  }
                },
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

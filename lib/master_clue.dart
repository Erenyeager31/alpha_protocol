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

class master_clue extends StatefulWidget {
  @override
  _master_clueState createState() => _master_clueState();
}

class _master_clueState extends State<master_clue> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Skip Clue"),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: CustomRadio<String>(
                  value: "Skip Clue",
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                    showSnackBar(context, value!);
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
                  value: "Add Timer",
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                    showSnackBar(context, value!);
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
                  value: "None",
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                    showSnackBar(context, value!);
                  },
                ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 400),
              child: ElevatedButton(
                style: Theme.button1,
                onPressed: () {
                  showSnackBar(context, "HI");
                },
                child: Text("Hi"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

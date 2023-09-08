import 'package:flutter/material.dart';
import 'themes.dart' as Theme;

class finalPage extends StatefulWidget {
  // String img;
  // finalPage({required this.img}) ;
  @override
  _finalPageState createState() => _finalPageState();
}

class _finalPageState extends State<finalPage> {
  final riddle_answer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Final Riddle'),
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Solve the Riddle to Accomplish your Objective"),
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

                // Image.network(widget.img),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class quiz_state extends ChangeNotifier{
  int? sec;
  int? index;

  quiz_state(int i, int j);

  void setValues(sec,index){
    this.sec = sec;
    this.index = index;
    notifyListeners();
  }
}
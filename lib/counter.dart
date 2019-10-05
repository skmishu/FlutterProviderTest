


import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier{


  int _count = 0;
  get count =>_count;

  increment(){
    _count++;
    notifyListeners();
  }
  decrement(){
    _count--;
    notifyListeners();
  }


}
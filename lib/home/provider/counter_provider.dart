import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count=0;
  DateTime dateTime=DateTime.now();
  CupertinoTabController tabController=CupertinoTabController();


  void increment(){
    count++;
    notifyListeners();
  }

  void decrement(){
    count--;
    notifyListeners();
  }
  void change(double val){
    count=val.toInt();
    notifyListeners();
  }

  void changeDate(DateTime dateTime){
    this.dateTime=dateTime;
    notifyListeners();
  }

}
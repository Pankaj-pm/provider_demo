import 'dart:async';

import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  PageController pcontroller = PageController();
  int cIndex = 0;

  void changeIndex(int i) {
    cIndex = i;
    notifyListeners();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      cIndex++;
      if (cIndex > 5) {
        cIndex = 0;
      }

      pcontroller.animateToPage(cIndex, duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }
}

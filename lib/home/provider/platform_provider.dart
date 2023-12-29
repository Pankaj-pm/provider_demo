import 'package:flutter/material.dart';

class PlatformProvider extends ChangeNotifier{
  bool isAndroid=true;


  void changePlatform(){
    isAndroid=!isAndroid;
    notifyListeners();
  }


}
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDarkeTheme = false;
  Color get getBGColor{
    return isDarkeTheme ? Colors.amber : Colors.blue;
  }
  Color get getAppBarColor{
    return isDarkeTheme ? Colors.red : Colors.green;
  }

  void changeTheme(){
    isDarkeTheme =!isDarkeTheme;
    notifyListeners(); //отслеживать изменение
  }
}
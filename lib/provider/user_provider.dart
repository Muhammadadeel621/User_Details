import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = '';
  int _age = 0;

  String get name => _name;
  int get age => _age;

  void updateUser(String userName, int userAge) {
    _name = userName;
    _age = userAge;
    notifyListeners();
  }
}

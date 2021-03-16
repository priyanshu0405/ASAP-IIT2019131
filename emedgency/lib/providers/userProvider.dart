import 'package:emedgency/model/userModel.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = new UserModel();

  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}

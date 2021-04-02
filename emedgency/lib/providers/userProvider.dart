import 'dart:convert';

import 'package:emedgency/constants/StringConstant.dart';
import 'package:emedgency/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  UserModel _user = new UserModel();

  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<UserModel> getUpdatedUser() async {
    print("${URL}patient/${user.id}");
    await http.get(Uri.parse("${URL}patient/${user.id}")).then((val) {
      print(val.body);
      var userJson = jsonDecode(val.body)["user"];
      var userModel = jsonEncode(userJson);
      setUser(userModelFromJson(userModel));
      return _user;
    });
  }
}

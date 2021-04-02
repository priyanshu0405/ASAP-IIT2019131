import 'dart:async';
import 'dart:convert';

import 'package:emedgency/constants/StringConstant.dart';
import 'package:emedgency/model/userModel.dart';
import 'package:emedgency/util/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(
      String username, String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      "email": email,
      "password": password,
      "username": username
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    http.Response response = await http.post(
      Uri.parse(URL + LOGIN),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print(responseData);
      //var userData = responseData['data'];

      UserModel authUser = UserModel.fromJson(responseData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> loginDoctor(
      String username, String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      "email": email,
      "password": password,
      "username": username
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    http.Response response = await http.post(
      Uri.parse(URL + LOGIN_DOC),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print(responseData);
      //var userData = responseData['data'];

      UserModel authUser = UserModel.fromJson(responseData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> signUp(
      {String username,
      String email,
      String name,
      String password,
      String role,
      String dob,
      String phone,
      String address,
      String bp,
      int fever,
      int oxylvl,
      int heartrate,
      int sugarlevel}) async {
    final Map<String, dynamic> registerData = {
      "username": username,
      "email": email,
      "name": name,
      "password": password,
      "role": role,
      "dob": dob,
      "phone": phone,
      "address": address,
      "history": {
        "bp": bp,
        "fever": fever,
        "oxylvl": oxylvl,
        "heartrate": heartrate,
        "sugarlevel": sugarlevel
      }
    };
    print(jsonEncode(registerData));
    return await http
        .post(Uri.parse(URL + REGISTER),
            body: json.encode(registerData
                // "username": username,
                // "email": email,
                // "name": name,
                // "password": password,
                // "role": role,
                // "dob": dob,
                // "phone": phone,
                // "address": address,
                // "history": {
                //   "bp": bp,
                //   "fever": fever,
                //   "oxylvl": oxylvl,
                //   "heartrate": heartrate,
                //   "sugarlevel": sugarlevel
                // }
                ),
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(http.Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    print(response.statusCode);
    if (response.statusCode == 200) {
      UserModel authUser = UserModel.fromJson(responseData);

      UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
//      if (response.statusCode == 401) Get.toNamed("/login");
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }

    return result;
  }

  logOut() {
    _loggedInStatus = Status.NotLoggedIn;
    notifyListeners();
    UserPreferences().removeUser();
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}

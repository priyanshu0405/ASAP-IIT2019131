import 'package:emedgency/constants/StringConstant.dart';
import 'package:emedgency/model/userModel.dart';
import 'package:http/http.dart' as http;

class Api {
  Future signUp(
      {String username,
      String email,
      String password,
      String role,
      String dob,
      String phone,
      String address,
      History hist}) async {
    var res = await http.post(Uri.parse(URL + REGISTER), body: {
      "username": username,
      "email": email,
      "password": password,
      "role": role,
      "dob": dob,
      "phone": phone,
      "address": address,
      "history": hist.toJson()
    });
  }
}

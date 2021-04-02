import 'dart:convert';

import 'package:emedgency/constants/StringConstant.dart';
import 'package:emedgency/model/DoctorModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DocProvider extends ChangeNotifier {
  List<DoctorModel> _doctorModel;

  List<DoctorModel> get doctorModel => _doctorModel;

  Future<List<DoctorModel>> getPatients() async {
    await http.get(Uri.parse(URL + DOC)).then((value) {
      print(value.body);
      _doctorModel = doctorModelFromJson(value.body);
      notifyListeners();
      return _doctorModel;
    }).catchError((err) {
      print(err.toString());
    });
  }

  Future postPrescription(String id, String prescription) async {
    print(URL + id + "/prescribe");
    await http
        .post(Uri.parse(URL + DOC + "/" + id + "/prescribe"),
            body: jsonEncode({"prescription": prescription}))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
      } else {
        print('erroer');
      }
    });
  }
}

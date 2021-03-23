import 'dart:convert';

import 'package:emedgency/constants/StringConstant.dart';
import 'package:emedgency/model/updateModel.dart';
import 'package:emedgency/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  Future<UpdateModel> sendUpdateRequest(String id) async {
    try {
      print("${URL}patient/${id}/$UPDATE");
      var response = await http.post(Uri.parse("${URL}patient/${id}$UPDATE"),
          body: json.encode({
            "bp": bp.text,
            "sugarlevel": int.parse(sugarLevel.text),
            "oxylvl": int.parse(oxyLevel.text),
            "fever": int.parse(fever.text),
            "heartrate": int.parse(heartRate.text)
          }),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        print("lolllllllllllllll");
        return updateModelFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  TextEditingController bp = TextEditingController();
  TextEditingController oxyLevel = TextEditingController();
  TextEditingController heartRate = TextEditingController();
  TextEditingController sugarLevel = TextEditingController();
  TextEditingController fever = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Emedgency',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Consumer<UserProvider>(
          builder: (_, user, child) {
            return ListView(
              padding: const EdgeInsets.all(30),
              children: [
                Text(
                  'Current Medical records',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: fever,
                  decoration: InputDecoration(
                    labelText: 'Body Temperature',
                    labelStyle: TextStyle(color: Colors.redAccent),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: oxyLevel,
                  decoration: InputDecoration(
                    labelText: 'Oxygen Level',
                    labelStyle: TextStyle(color: Colors.redAccent),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: bp,
                  decoration: InputDecoration(
                    labelText: 'Blood Pressure',
                    labelStyle: TextStyle(color: Colors.redAccent),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: sugarLevel,
                  decoration: InputDecoration(
                    labelText: 'Sugar Level',
                    labelStyle: TextStyle(color: Colors.redAccent),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: heartRate,
                  decoration: InputDecoration(
                    labelText: 'Heart Rate',
                    labelStyle: TextStyle(color: Colors.redAccent),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await sendUpdateRequest(user.user.id);
                      context.read<UserProvider>().getUpdatedUser();
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent)),
                    child: Text('Update'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

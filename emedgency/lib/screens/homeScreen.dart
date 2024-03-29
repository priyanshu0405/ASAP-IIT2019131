import 'dart:convert';

import 'package:emedgency/constants/StringConstant.dart';
import 'package:emedgency/model/userModel.dart';
import 'package:emedgency/providers/authProvider.dart';
import 'package:emedgency/providers/userProvider.dart';
import 'package:emedgency/screens/History.dart';
import 'package:emedgency/screens/categoryScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'updateScreen.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  HomeScreen({this.user});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    return StreamBuilder(
      stream: context.read<UserProvider>().getUpdatedUser().asStream(),
      builder: (_, snap) {
        return Consumer<UserProvider>(
          builder: (_, user, child) {
            if (user.user == null) {
              return CircularProgressIndicator();
            }
            return SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/bg.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    title: Text(
                      'Emedgency',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                  drawer: Drawer(
                    child: ListView(
                      children: [
                        Material(
                          elevation: 20,
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  '${user.user.name}',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  '${user.user.email}',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          tileColor: Colors.redAccent,
                          leading: Icon(Icons.dangerous),
                          title: Text(
                            'Emergency',
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.arrow_forward_outlined),
                            onPressed: () async {
                              print(URL + user.user.id + "/emergency");
                              Navigator.pop(context);
                              await http
                                  .post(Uri.parse(URL +
                                      "patient/" +
                                      user.user.id +
                                      "/emergency"))
                                  .then((value) {
                                if (value.statusCode == 200) {
                                  print(value.body);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text(jsonDecode(value.body))));
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.update_outlined),
                          title: Text(
                            'Update',
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.arrow_forward_outlined),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateScreen()));
                            },
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.history_outlined),
                          title: Text(
                            'History',
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.arrow_forward_outlined),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HistoryScreen()));
                            },
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.login_outlined),
                          title: Text(
                            'Logout',
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.arrow_forward_outlined),
                            onPressed: () async {
                              await auth.logOut();
                              var prefs = await SharedPreferences.getInstance();
                              print(
                                  "${prefs.getString("name")}++++++++++++++++++++++++++++++++++++++");
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CategoryScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: ListView(
                    padding: const EdgeInsets.all(30),
                    children: [
                      Material(
                        elevation: 20,
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Problem",
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                    user.user.history.last.message == null
                                        ? "You are fine"
                                        : user.user.history.last.message,
                                    style: TextStyle(fontSize: 15)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Material(
                        elevation: 20,
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Prescription",
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                    user.user.prescription == null
                                        ? "No prescription yet"
                                        : user.user.prescription,
                                    style: TextStyle(fontSize: 15)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Material(
                        elevation: 20,
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Medical Parameters',
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Body Temperature : ${user.user.history.last.fever}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Oxygen Level : ${user.user.history.last.oxylvl}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Blood Pressure : ${user.user.history.last.bp}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Sugar Level : ${user.user.history.last.sugarlevel}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Heart Rate : ${user.user.history.last.heartrate}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateScreen()));
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.redAccent)),
                                child: Text('Update'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

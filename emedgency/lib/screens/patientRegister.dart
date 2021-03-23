import 'package:emedgency/model/userModel.dart';
import 'package:emedgency/providers/authProvider.dart';
import 'package:emedgency/providers/userProvider.dart';
import 'package:emedgency/screens/homeScreen.dart';
import 'package:emedgency/screens/patientLogin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientRegister extends StatefulWidget {
  @override
  _PatientRegisterState createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegister> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController bp = TextEditingController();
  TextEditingController oxyLevel = TextEditingController();
  TextEditingController heartRate = TextEditingController();
  TextEditingController sugarLevel = TextEditingController();
  TextEditingController fever = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'SignUp',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              height: 60,
            ),
            TextFormField(
              controller: username,
              decoration: InputDecoration(
                labelText: 'Username',
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
              controller: name,
              decoration: InputDecoration(
                labelText: 'Full Name',
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
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email id',
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
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
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
              controller: address,
              decoration: InputDecoration(
                labelText: 'Address',
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
              controller: dob,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
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
              controller: phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
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
            Text(
              'Current Medical records',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
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
              height: 50,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already registered? ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.w800),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PatientLogin()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                print(username.text);
                final Future<Map<String, dynamic>> msg = auth.signUp(
                    username: username.text,
                    email: email.text,
                    address: address.text,
                    dob: dob.text,
                    name: name.text,
                    password: password.text,
                    phone: phone.text,
                    role: "patient",
                    bp: bp.text,
                    sugarlevel: int.parse(sugarLevel.text),
                    oxylvl: int.parse(oxyLevel.text),
                    fever: int.parse(fever.text),
                    heartrate: int.parse(heartRate.text));
                msg.then((value) {
                  if (value["status"]) {
                    UserModel user = value["user"];
                    print(user);
                    Provider.of<UserProvider>(context, listen: false)
                        .setUser(user);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => PatientLogin()));
                  } else {
                    print("fucked");
                  }
                });
              },
              color: Colors.redAccent,
              child: Text('Register'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

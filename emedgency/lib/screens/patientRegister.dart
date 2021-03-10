import 'package:emedgency/screens/patientLogin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PatientRegister extends StatefulWidget {
  @override
  _PatientRegisterState createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegister> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              color: Colors.redAccent,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

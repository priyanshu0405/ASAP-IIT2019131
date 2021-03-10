import 'package:emedgency/screens/doctorRegister.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DoctorLogin extends StatefulWidget {
  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
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
              'Login',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              height: 60,
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
              height: 150,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Not already registered? ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'SignUp',
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.w800),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorRegister()),
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
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

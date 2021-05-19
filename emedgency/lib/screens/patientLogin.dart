import 'package:emedgency/model/userModel.dart';
import 'package:emedgency/providers/authProvider.dart';
import 'package:emedgency/providers/userProvider.dart';
import 'package:emedgency/screens/homeScreen.dart';
import 'package:emedgency/screens/patientRegister.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientLogin extends StatefulWidget {
  @override
  _PatientLoginState createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/p.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                controller: username,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
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
                  labelStyle: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
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
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
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
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'SignUp',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w800),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PatientRegister()),
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
              ElevatedButton(
                onPressed: () {
                  final Future<Map<String, dynamic>> msg =
                      auth.login(username.text, email.text, password.text);
                  msg.then((value) {
                    if (value["status"]) {
                      UserModel user = value["user"];
                      Provider.of<UserProvider>(context, listen: false)
                          .setUser(user);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => HomeScreen(
                                    user: user,
                                  )));
                    } else {
                      print("fucked");
                    }
                  });
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent)),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

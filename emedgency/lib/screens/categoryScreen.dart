import 'package:emedgency/screens/DoctorLogin.dart';
import 'package:flutter/material.dart';
import 'patientLogin.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image(
              image: AssetImage('images/c.jpeg'),
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PatientLogin()),
                      );
                    },
                    color: Colors.redAccent,
                    child: Text('Patient Login'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorLogin()),
                    );
                  },
                  color: Colors.redAccent,
                  child: Text('Doctor Login'),
                ),
                SizedBox(
                  height: 250,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

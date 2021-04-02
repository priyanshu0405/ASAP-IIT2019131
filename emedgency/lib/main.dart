import 'package:emedgency/providers/authProvider.dart';
import 'package:emedgency/providers/docProvider.dart';
import 'package:emedgency/providers/userProvider.dart';
import 'package:emedgency/screens/homeScreen.dart';
import 'package:emedgency/screens/patientLogin.dart';
import 'package:emedgency/screens/patientRegister.dart';
import 'package:emedgency/util/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/userModel.dart';
import 'screens/categoryScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<UserModel> getUserData() => UserPreferences().getUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DocProvider()),
      ],
      child: MaterialApp(
          home: StreamBuilder(
              stream: getUserData().asStream(),
              builder: (context, snapshot) {
                print(snapshot.data);
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else if (snapshot.data.salt == null)
                      return CategoryScreen();
                    else
                      UserPreferences().removeUser();
                    return HomeScreen(user: snapshot.data);
                }
              }),
          routes: {
            '/dashboard': (context) => HomeScreen(),
            '/login': (context) => PatientLogin(),
            '/register': (context) => PatientRegister(),
          }),
    );
  }
}

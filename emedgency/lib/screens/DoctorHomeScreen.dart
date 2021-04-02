import 'package:emedgency/providers/authProvider.dart';
import 'package:emedgency/providers/docProvider.dart';
import 'package:emedgency/screens/PatientDetailPage.dart';
import 'package:emedgency/screens/categoryScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorHomeScreen extends StatefulWidget {
  @override
  _DoctorHomeScreenState createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DocProvider>().getPatients();
  }

  @override
  Widget build(BuildContext context) {
    context.read<DocProvider>().getPatients();
    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Consumer<DocProvider>(
      builder: (_, docProvider, child) {
        if (docProvider.doctorModel == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Emedgency',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.redAccent,
            leading: Container(),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                  await auth.logOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => CategoryScreen()));
                },
              )
            ],
          ),
          body: docProvider.doctorModel.length > 0
              ? ListView.builder(
                  itemCount: docProvider.doctorModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Material(
                        elevation: 20,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PatientDetailPage(
                                          patient: docProvider
                                              .doctorModel[index].patients,
                                        )));
                          },
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              docProvider.doctorModel[index].patients.name,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              docProvider.doctorModel[index].patients.history
                                  .last.message,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No patients',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
        );
      },
    );
  }
}

import 'package:emedgency/model/DoctorModel.dart';
import 'package:emedgency/providers/docProvider.dart';
import 'package:emedgency/screens/DoctorHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientDetailPage extends StatefulWidget {
  Patients patient;
  PatientDetailPage({this.patient});
  @override
  _PatientDetailPageState createState() => _PatientDetailPageState();
}

class _PatientDetailPageState extends State<PatientDetailPage> {
  TextEditingController _prescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              title: Text(widget.patient.name),
              backgroundColor: Colors.redAccent,
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 10),
                    child: Material(
                        elevation: 20,
                        child: Container(
                            child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Problem with patient',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(widget.patient.history.last.message,
                                    style: TextStyle(fontSize: 15))),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ))),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((_, index) {
                    var revhist = List.from(widget.patient.history.reversed);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Material(
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
                                    'Date and time : ${revhist[index].timestamp}',
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
                                    'Body Temperature : ${revhist[index].fever}',
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
                                    'Oxygen Level : ${revhist[index].oxylvl}',
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
                                    'Blood Pressure : ${revhist[index].bp}',
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
                                    'Sugar Level : ${revhist[index].sugarlevel}',
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
                                    'Heart Rate : ${revhist[index].heartrate}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, childCount: widget.patient.history.length),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: TextFormField(
                          controller: _prescription,
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: 'Add prescription',
                            labelStyle: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
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
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<DocProvider>()
                                .postPrescription(
                                    widget.patient.id, _prescription.text)
                                .then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DoctorHomeScreen()));
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.redAccent)),
                          child: Text("Prescribe"))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

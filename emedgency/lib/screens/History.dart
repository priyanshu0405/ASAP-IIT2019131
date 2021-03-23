import 'package:emedgency/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<UserProvider>().getUpdatedUser();
    return Consumer<UserProvider>(builder: (_, user, child) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Emedgency',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.redAccent,
            ),
            body: ListView.builder(
              itemCount: user.user.history.length,
              itemBuilder: (context, index) {
                var revhist = List.from(user.user.history.reversed);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
              },
            )),
      );
    });
  }
}

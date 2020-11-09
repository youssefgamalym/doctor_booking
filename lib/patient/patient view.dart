import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/dorctor/doctor%20information.dart';
import 'package:doctor_booking/dorctor/doctor%20view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home.dart';
import '../methods.dart';
import '../widgets.dart';

// ignore: must_be_immutable
class PatientView extends StatefulWidget {
  String doctorId;
  PatientView(this.doctorId);
  @override
  _PatientViewState createState() => _PatientViewState(doctorId);
}

class _PatientViewState extends State<PatientView> {
  String doctorId;
  _PatientViewState(this.doctorId);

  final CollectionReference patientUpdates =
      FirebaseFirestore.instance.collection('patient Updates');

  final CollectionReference patientInformation =
      FirebaseFirestore.instance.collection('patient');

  final CollectionReference doctorProfileCollection =
      FirebaseFirestore.instance.collection('doctor profile');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context, 'Waiting Room'),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Center(
                  child: SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: Image.asset('Images/drowerHeader/iconView.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.info_outline,
                          color: Colors.orange,
                        ),
                        title: Text(
                          'doctor information',
                          style: simpleTextStyle(),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      doctorInformations(doctorId.toString())));
                        },
                      ),
                      StreamBuilder(
                          stream: doctorProfileCollection
                              .doc(doctorId.toString())
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              Map<String, dynamic> data = snapshot.data.data();
                              return ListTile(
                                leading: Icon(
                                  Icons.call,
                                  color: Colors.orange,
                                ),
                                title: Text(
                                  'Call Doctor',
                                  style: simpleTextStyle(),
                                ),
                                onTap: () {
                                  launch("tel://${data['Phone Number']}");
                                },
                              );
                              // ];
                            }
                            return Center(child: CircularProgressIndicator());
                          }),
                      ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.orange,
                        ),
                        title: Text(
                          'LogOut',
                          style: simpleTextStyle(),
                        ),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                          //  Navigator.pushNamed(context, MyApp.DOCTOR_INFORMATION);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                  stream:
                      patientInformation.doc(getCurrentUserId()).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      Map<String, dynamic> data = snapshot.data.data();
                      return Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your Current Number :',
                              style: simpleTextStyle(),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 60,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  color: Colors.deepOrange,
                                  child: Center(
                                    child: Text(
                                      '${data['patient number']}',
                                      style: simpleNo_Style(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]);
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
              StreamBuilder(
                  stream: patientUpdates.doc(doctorId.toString()).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      Map<String, dynamic> data = snapshot.data.data();
                      return Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Current patient Number:',
                              style: simpleTextStyle(),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 60,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  color: Colors.deepOrange,
                                  child: Center(
                                    child: Text(
                                      '${data[DoctorView.CURRENT_PATIENT_NO]}',
                                      style: simpleNo_Style(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pending :',
                              style: simpleTextStyle(),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 60,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  color: Colors.deepOrange,
                                  child: Center(
                                    child: Text(
                                      '${data['pending']}',
                                      style: simpleNo_Style(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Status : ${data['dropdownValue']} ',
                              style: simpleTextStyle(),
                            ),
                          ],
                        )
                      ]);
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

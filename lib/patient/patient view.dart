import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/dorctor/doctor%20information.dart';
import 'package:doctor_booking/dorctor/doctor%20view.dart';
import 'package:doctor_booking/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../methods.dart';
import '../widgets.dart';

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
                      // StreamBuilder(
                      //     stream: doctorProfileCollection
                      //         .doc(doctorId.toString())
                      //         .snapshots(),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.data != null) {
                      //         Map<String, dynamic> data = snapshot.data.data();
                      //         print("PatientView: $data");
                      //         return Column(children: [
                      //           Padding(
                      //             padding: const EdgeInsets.only(
                      //                 top: 20, bottom: 10, left: 10),
                      //             child: Row(
                      //               children: [
                      //                 Text(
                      //                   'Doctor Name\'s : \n       ${data['First Name']} ${data['Last Name']}',
                      //                   style: simpleTextStyle(),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.only(
                      //                 top: 20, bottom: 10, left: 10),
                      //             child: Row(
                      //               children: [
                      //                 Text(
                      //                   'Specialization Name\'s : \n      ${data['Specialization']}',
                      //                   style: simpleTextStyle(),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.only(
                      //                 top: 20, bottom: 10, left: 10),
                      //             child: Row(
                      //               children: [
                      //                 Text(
                      //                   'Phone Number :  \n      ${data['Phone Number']}',
                      //                   style: simpleTextStyle(),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.only(
                      //                 top: 30, bottom: 10, left: 10),
                      //             child: Row(
                      //               children: [
                      //                 Text(
                      //                   'Phone Number : ${data['Phone Number']}',
                      //                   style: simpleTextStyle(),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ]);
                      //       }
                      //       return CircularProgressIndicator();
                      //     }),
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
                      // String currentPatientNo = data[DoctorView.CURRENT_PATIENT_NO];
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
                      print('her1');
                      Map<String, dynamic> data = snapshot.data.data();
                      print('her2');
                      // String currentPatientNo = data[DoctorView.CURRENT_PATIENT_NO];
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
                              // currentPatientNo,
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

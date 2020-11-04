import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/dorctor/doctor%20view.dart';
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

  final CollectionReference doctorProfileCollection =
      FirebaseFirestore.instance.collection('doctor profile');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context, 'Waiting Room'),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(top: 20, bottom: 20),
      //         child: Center(
      //           child: Column(
      //             children: [
      //               Text(
      //                 'information about your doctor',
      //                 style: simpleTextStyle(),
      //               ),
      //
      //               // StreamBuilder(
      //               //   stream: doctor_profile_Collection.snapshots(),
      //               //
      //               StreamBuilder(
      //                   stream: doctor_profile_Collection
      //                       .doc(getUserId())
      //                       .snapshots(),
      //                   builder: (context, snapshot) {
      //                     if (snapshot.data != null) {
      //                       Map<String, dynamic> data = snapshot.data.data();
      //                       print("PatientView: $data");
      //                       return Column(children: [
      //                         Padding(
      //                           padding: const EdgeInsets.only(
      //                               top: 30, bottom: 10, left: 10),
      //                           child: Row(
      //                             children: [
      //                               Text(
      //                                 'Doctor Name\'s : ${data['First Name']} ${data['Last Name']}',
      //                                 style: simpleTextStyle(),
      //                               )
      //                             ],
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.only(
      //                               top: 30, bottom: 10, left: 10),
      //                           child: Row(
      //                             children: [
      //                               Text(
      //                                 'Specialization Name\'s : ${data['Specialization']}',
      //                                 style: simpleTextStyle(),
      //                               )
      //                             ],
      //                           ),
      //                         ),
      //                       ]);
      //                     }
      //                     return CircularProgressIndicator();
      //                   })
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                          'Current patient No.',
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
    );
  }
}

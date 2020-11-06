import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../methods.dart';

// ignore: camel_case_types, must_be_immutable
class doctorInformations extends StatefulWidget {
  String doctorId;
  doctorInformations(this.doctorId);
  @override
  _doctorInformationsState createState() => _doctorInformationsState(doctorId);
}

class _doctorInformationsState extends State<doctorInformations> {
  final CollectionReference doctorProfileCollection =
      FirebaseFirestore.instance.collection('doctor profile');
  String doctorId;
  _doctorInformationsState(this.doctorId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context, 'Doctor Information'),
      body: StreamBuilder(
          stream: doctorProfileCollection.doc(doctorId.toString()).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              Map<String, dynamic> data = snapshot.data.data();
              print("PatientView: $data");
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.deepOrange,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Doctor Name\'s : ${data['First Name']} ${data['Last Name']}',
                              style: simpleNo_Style(),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Specialization : ${data['Specialization']}',
                              style: simpleNo_Style(),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Phone Number : ${data['Phone Number']}',
                              style: simpleNo_Style(),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, bottom: 10, left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Start at  ${data['Time Start Hours']}: ${data['Time Start Minute ']}',
                              style: simpleNo_Style(),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, bottom: 10, left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Close at  ${data['Time End Hours']}: ${data['Time End Minute']}',
                              style: simpleNo_Style(),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

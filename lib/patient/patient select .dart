import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/patient/patient%20enter%20id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../methods.dart';
import '../widgets.dart';

class PatientSelect extends StatefulWidget {
  @override
  _PatientSelectState createState() => _PatientSelectState();
}

class _PatientSelectState extends State<PatientSelect> {
  final CollectionReference patient_updates =
      FirebaseFirestore.instance.collection('patient Updates');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference doctorProfileCollection =
      FirebaseFirestore.instance.collection('doctor profile');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context, 'Select your doctor'),
      body: Column(
        children: [
          StreamBuilder(
              stream: doctorProfileCollection.snapshots(),
              builder: (context, snapShot) {
                if (snapShot.data == null) return CircularProgressIndicator();
                return Expanded(
                  child: ListView(
                    children: snapShot.data.docs.map<Widget>((document) {
                      String doctorName = document.data()['First Name'];
                      String doctorNameLast = document.data()['Last Name'];
                      String specialization = document.data()['Specialization'];
                      int doctorcode = document.data()['Doctor Id'];
                      print(
                          "from patient select(screen)=> Doctor code: $doctorcode");
                      String doctorId = document.documentID;
                      print('from patient select(screen)=> Id: $doctorId');
                      return Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: Card(
                          color: Colors.orange,
                          child: ListTile(
                              isThreeLine: true,
                              focusColor: Colors.deepOrange,
                              tileColor: Colors.orange,
                              onTap: () {
                                // get the selected doctor id
                                // int doctorId = document(_auth.currentUser.uid)
                                //     .data()['Doctor Id'];
                                // int doctorcode = document.data()['Doctor Id'];
                                print(
                                    "from Patient select (screen) Doctor Id: $doctorcode");
                                print('from Patient select (screen) on tap');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PatientEnterId(
                                            doctorcode.toString(),
                                            doctorId.toString())));
                                // Navigator.pushNamed(
                                //     context, 'patient enter id');
                              },
                              trailing: Icon(Icons.person_search),
                              title: Text(
                                ('doctor : ' +
                                    doctorName +
                                    ' ' +
                                    doctorNameLast),
                                style: styleForPatientSelect(),
                              ),
                              subtitle: Text(
                                ('Specialization : ' + specialization),
                                style: styleForPatientSelect(),
                              )),
                        ),
                      );
                    }).toList(),
                  ),
                );
              })
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientView extends StatefulWidget {
  @override
  _PatientViewState createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  final CollectionReference doctor_profile_Collection =
      FirebaseFirestore.instance.collection('doctor profile');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: doctor_profile_Collection.snapshots(),
        builder: (context, snapShot) {
          // if (snapShot.data == null) return CircularProgressIndicator();
          return Expanded(
            child: ListView(
              children: snapShot.data.docs.map<Widget>((document) {
                String currentPatientNo = document.data()['currentPatientNo'];
                String pending = document.data()['pending'];
                String dropdownValue = document.data()['dropdownValue'];

                print("map: " + document.data().toString());
                return Column(
                  children: [
                    Text('$currentPatientNo'),
                    Text('$pending'),
                    Text('$dropdownValue'),
                  ],
                );
              }).toList(),
            ),
          );
        });
  }
}

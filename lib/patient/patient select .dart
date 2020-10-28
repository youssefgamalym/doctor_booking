import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets.dart';

class PatientSelect extends StatefulWidget {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  _PatientSelectState createState() => _PatientSelectState();
}

class _PatientSelectState extends State<PatientSelect> {
  final CollectionReference doctor_profile_Collection =
      FirebaseFirestore.instance.collection('doctor profile');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context, 'Select your doctor'),
      body: Column(
        children: [
          StreamBuilder(
              stream: doctor_profile_Collection.snapshots(),
              builder: (context, snapShot) {
                // if (snapShot.data == null) return CircularProgressIndicator();
                return Expanded(
                  child: ListView(
                    children: snapShot.data.docs.map<Widget>((document) {
                      String doctorName = document.data()['First Name'];
                      String doctorNameLast = document.data()['Last Name'];
                      String specialization = document.data()['Specialization'];

                      print("map: " + document.data().toString());
                      return Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: Card(
                          color: Colors.orange,
                          child: ListTile(
                              tileColor: Colors.orange,
                              onTap: () {
                                Navigator.pushNamed(context, 'patient view');
                              },
                              trailing: Icon(Icons.person_search),
                              title: Text(
                                ('doctor : ' +
                                    doctorName +
                                    ' ' +
                                    doctorNameLast),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                ('Specialization : ' + specialization),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  String firstName,
      lastName,
      Specialization,
      timesStart,
      timesend,
      Phone_Number;
  final CollectionReference doctor_profile_Collection =
      FirebaseFirestore.instance.collection('doctor profile');

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 165,
                      child: forProfile((value) {
                        firstName = value;
                      },
                          'first name',
                          Icon(
                            Icons.person_add_alt_1_rounded,
                            color: Colors.orange,
                          )),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    SizedBox(
                      width: 165,
                      child: forProfile((value) {
                        lastName = value;
                      },
                          'last name',
                          Icon(
                            Icons.person_add_alt_1_rounded,
                            color: Colors.orange,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: forProfile((value) {
                        Phone_Number = value;
                      },
                          'Phone Number',
                          Icon(
                            Icons.phone,
                            color: Colors.orange,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: forProfile((value) {
                        Specialization = value;
                      },
                          'Specialization',
                          Icon(
                            Icons.account_balance_outlined,
                            color: Colors.orange,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'times of work',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepOrange),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: forProfile((value) {
                        timesStart = value;
                      },
                          'from',
                          Icon(
                            Icons.access_time,
                            color: Colors.orange,
                          )),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 100,
                      child: forProfile((value) {
                        timesend = value;
                      },
                          'to',
                          Icon(
                            Icons.access_time,
                            color: Colors.orange,
                          )),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: null,
                color: Colors.orange,
                child: Text('Add Location'),
              ),
              RaisedButton(
                onPressed: () {
                  var profile = {
                    'First Name': firstName,
                    'Last Name': lastName,
                    'Specialization': Specialization,
                    'Time Start': timesStart,
                    'Time End': timesend,
                    'Phone Number': Phone_Number,
                  };
                  doctor_profile_Collection.add(profile).catchError((error) {
                    print("Error: $error");
                  });
                },
                color: Colors.orange,
                child: Text('Save'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'doctor view');
                },
                color: Colors.orange,
                child: Text('Start'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

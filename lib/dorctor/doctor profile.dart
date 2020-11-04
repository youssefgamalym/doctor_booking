import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../methods.dart';
import '../widgets.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  Future<Null> selecteTimeFrom(BuildContext context) async {
    TimeOfDay selecteTimeeForm =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      selecteTimeValueForm =
          ' ${selecteTimeeForm.hour} : ${selecteTimeeForm.minute}';
      sTVFH = selecteTimeeForm.hour;
      sTVFM = selecteTimeeForm.minute;
    });
  }

  Future<Null> selecteTimeTo(BuildContext context) async {
    TimeOfDay selecteTimeeTo =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      selecteTimeValueTo = ' ${selecteTimeeTo.hour} : ${selecteTimeeTo.minute}';
      sTVTH = selecteTimeeTo.hour;
      sTVTM = selecteTimeeTo.minute;
    });
  }

  String firstName,
      lastName,
      Specialization,
      timesStart,
      timesend,
      Phone_Number;

  String selecteTimeValueForm = '';
  String selecteTimeValueTo = '';
  int sTVFH, sTVFM, sTVTH, sTVTM, doctorId;

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
                          ),
                          TextInputType.text),
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
                          ),
                          TextInputType.text),
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
                          ),
                          TextInputType.phone),
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
                          'your Specialization ',
                          Icon(
                            Icons.account_balance_outlined,
                            color: Colors.orange,
                          ),
                          TextInputType.text),
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
                        doctorId = int.parse(value);
                        print('Doc Id: $doctorId');
                      },
                          'your id ',
                          Icon(
                            Icons.perm_identity,
                            color: Colors.orange,
                          ),
                          TextInputType.text),
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
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'From : ',
                          style: styleForNormalText(),
                        ),
                        IconButton(
                            color: Colors.orange,
                            icon: Icon(Icons.timer_sharp),
                            onPressed: () {
                              selecteTimeFrom(context);
                            }),
                        Text(
                          ' $selecteTimeValueForm',
                          style: styleForNormalTextSmall(),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'to : ',
                          style: styleForNormalText(),
                        ),
                        IconButton(
                            color: Colors.orange,
                            icon: Icon(Icons.timer_sharp),
                            onPressed: () {
                              selecteTimeTo(context);
                            }),
                        Text(
                          ' $selecteTimeValueTo',
                          style: styleForNormalTextSmall(),
                        )
                      ],
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
                    'Phone Number': Phone_Number,
                    //int sTVFH,sTVFM,sTVTH,sTVTM;
                    'Time Start Hours': sTVFH,
                    'Time Start Minute ': sTVFM,
                    'Time End Hours': sTVTH,
                    'Time End Minute': sTVTM,
                    'Doctor Id': doctorId,
                  };
                  doctor_profile_Collection
                      .doc(getCurrentUserId())
                      .set(profile)
                      .catchError((error) {
                    print("Error: $error");
                  });
                },
                color: Colors.orange,
                child: Text('Save'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyApp.DOCTOR_VIEW);
                },
                color: Colors.orange,
                child: Text('Start'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

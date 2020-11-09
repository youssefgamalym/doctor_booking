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

final _keyFirsName = GlobalKey<FormState>();
final _keyLastName = GlobalKey<FormState>();
final _keyPhoneNumber = GlobalKey<FormState>();
final _keyDoctorSpecialization = GlobalKey<FormState>();
final _keyID = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _DoctorProfileState extends State<DoctorProfile> {
  Future<Null> selectTimeFrom(BuildContext context) async {
    TimeOfDay selectTimeForm =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      selectTimeValueForm =
          ' ${selectTimeForm.hour} : ${selectTimeForm.minute}';
      sTVFH = selectTimeForm.hour;
      sTVFM = selectTimeForm.minute;
    });
  }

  Future<Null> selectTimeTo(BuildContext context) async {
    TimeOfDay selectTimeTo =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      selectTimeValueTo = ' ${selectTimeTo.hour} : ${selectTimeTo.minute}';
      sTVTH = selectTimeTo.hour;
      sTVTM = selectTimeTo.minute;
    });
  }

  String firstName,
      lastName,
      doctorSpecialization,
      timesStart,
      timesEnd,
      phoneNumber;

  String selectTimeValueForm = '';
  String selectTimeValueTo = '';
  int sTVFH, sTVFM, sTVTH, sTVTM, doctorId;

  final CollectionReference doctorProfileCollection =
      FirebaseFirestore.instance.collection('doctor profile');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                    Form(
                      key: _keyFirsName,
                      child: SizedBox(
                        width: 165,
                        child: forProfile(
                            (value) {
                              firstName = value;
                            },
                            'first name',
                            Icon(
                              Icons.person_add_alt_1_rounded,
                              color: Colors.orange,
                            ),
                            TextInputType.text,
                            (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter your first name';
                              }
                            }),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Form(
                      key: _keyLastName,
                      child: SizedBox(
                        width: 165,
                        child: forProfile(
                            (value) {
                              lastName = value;
                            },
                            'last name',
                            Icon(
                              Icons.person_add_alt_1_rounded,
                              color: Colors.orange,
                            ),
                            TextInputType.text,
                            (String value) {
                              if (value.isEmpty) {
                                return ' Please Enter your first name';
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    Form(
                      key: _keyPhoneNumber,
                      child: SizedBox(
                        width: 300,
                        child: forProfile(
                            (value) {
                              phoneNumber = value;
                            },
                            'Phone Number',
                            Icon(
                              Icons.phone,
                              color: Colors.orange,
                            ),
                            TextInputType.phone,
                            (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter your first name.';
                              }
                              if (value.length != 11) {
                                return 'Phone Number Is\'t Correct.';
                              }
                              if (!value.startsWith('01')) {
                                return 'Phone Number Is\'t Correct.';
                              }
                              return null;
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    Form(
                      key: _keyDoctorSpecialization,
                      child: SizedBox(
                        width: 300,
                        child: forProfile(
                            (value) {
                              doctorSpecialization = value;
                            },
                            'your Specialization ',
                            Icon(
                              Icons.account_balance_outlined,
                              color: Colors.orange,
                            ),
                            TextInputType.text,
                            (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter your Specialization';
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Form(
                          key: _keyID,
                          child: SizedBox(
                            width: 300,
                            child: forProfile(
                                (value) {
                                  doctorId = int.parse(value);
                                  print('Doc ID: $doctorId');
                                },
                                'Enter ID ',
                                Icon(
                                  Icons.perm_identity,
                                  color: Colors.orange,
                                ),
                                TextInputType.number,
                                (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter your Code ';
                                  }
                                  // if (value.length <= 4) {
                                  //   return 'Use 4 or more Numbers';
                                  // }
                                }),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Note : Code Will not Change ',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    )
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
                              selectTimeFrom(context);
                            }),
                        Text(
                          ' $selectTimeValueForm',
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
                              selectTimeTo(context);
                            }),
                        Text(
                          ' $selectTimeValueTo',
                          style: styleForNormalTextSmall(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // RaisedButton(
              //   onPressed: null,
              //   color: Colors.orange,
              //   child: Text('Add Location'),
              // ),
              RaisedButton(
                onPressed: () {
                  if (_keyFirsName.currentState.validate() &&
                      _keyLastName.currentState.validate() &&
                      _keyPhoneNumber.currentState.validate() &&
                      _keyDoctorSpecialization.currentState.validate() &&
                      _keyID.currentState.validate()) {
                    var profile = {
                      'First Name': firstName,
                      'Last Name': lastName,
                      'Specialization': doctorSpecialization,
                      'Phone Number': phoneNumber,
                      'Time Start Hours': sTVFH,
                      'Time Start Minute ': sTVFM,
                      'Time End Hours': sTVTH,
                      'Time End Minute': sTVTM,
                      'Doctor Id': doctorId,
                    };
                    doctorProfileCollection
                        .doc(getCurrentUserId())
                        .set(profile)
                        .catchError((error) {
                      print("Error: $error");
                    });
                    if (User != null) {
                      Navigator.pushReplacementNamed(
                          context, MyApp.DOCTOR_VIEW);
                    }
                    Navigator.pushReplacementNamed(context, MyApp.DOCTOR_VIEW);
                  }
                },
                color: Colors.orange,
                child: Text(
                  'continue',
                  style: simpleNo_Style(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

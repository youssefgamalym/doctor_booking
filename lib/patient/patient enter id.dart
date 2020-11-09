import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/patient/patient%20view.dart';
import 'package:doctor_booking/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../methods.dart';

// ignore: must_be_immutable, camel_case_types
class patientEnterId extends StatefulWidget {
  String doctorCode;
  String doctorId;
  patientEnterId(this.doctorCode, this.doctorId);
  @override
  _patientEnterIdState createState() =>
      _patientEnterIdState(doctorCode, doctorId);
}

// ignore: camel_case_types
class _patientEnterIdState extends State<patientEnterId> {
  String doctorCode;
  String doctorId;
  _patientEnterIdState(this.doctorCode, this.doctorId);

  _showSnackBarWrongID() {
    var snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Row(
              children: [
                Text(
                  'Wrong ID. Try again.',
                  style: simpleNo_Style(),
                ),
              ],
            ),
          ),
        ],
      ),
      duration: Duration(seconds: 4),
      backgroundColor: Colors.deepOrange,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  final _keyDoctorID = GlobalKey<FormState>();
  final _keyPatientNumber = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String patientNo = '0';
  String doctorIdFromPatient;
  final CollectionReference doctorProfileCollection =
      FirebaseFirestore.instance.collection('doctor profile');

  final CollectionReference patientInformation =
      FirebaseFirestore.instance.collection('patient');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBarMain(context, 'patient Conformation'),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Enter doctor id and \n your Number at doctor \n for next',
                  style: styleForNormalText(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _keyDoctorID,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: forProfile(
                        (value) {
                          doctorIdFromPatient = value;
                        },
                        'Doctor id',
                        Icon(
                          Icons.perm_identity,
                          color: Colors.orange,
                        ),
                        TextInputType.number,
                        (String value) {
                          if (value.isEmpty) {
                            return 'Must Enter Doctor ID For Continue.';
                          }
                          if (value.length >= 4) {
                            return 'Writes 4 or more Numbers';
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _keyPatientNumber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: forProfile(
                        (value) {
                          patientNo = value;
                        },
                        'Enter your Number',
                        Icon(
                          Icons.confirmation_number,
                          color: Colors.orange,
                        ),
                        TextInputType.number,
                        (value) {
                          if (value.isEmpty) {
                            return 'Enter your Number in Waiting List.';
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              _keyDoctorID.currentState.validate();
              _keyDoctorID.currentState.validate();
              var forPatient = {
                'patient number': patientNo,
              };
              try {
                patientInformation
                    .doc(getCurrentUserId())
                    .set(forPatient)
                    .catchError((error) {
                  print("Error: $error");
                });
              } catch (e) {
                print(e);
              }
              print('from Patient enter id (screen):$doctorCode');
              print('from Patient enter id (screen):$doctorIdFromPatient');
              if (doctorIdFromPatient == doctorCode) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientView(doctorId)));
              } else
                _showSnackBarWrongID();
            },
            color: Colors.orange,
            child: Text(
              'Next',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          )
        ],
      )),
    );
  }
}

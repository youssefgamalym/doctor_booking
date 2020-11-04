import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/patient/patient%20view.dart';
import 'package:doctor_booking/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../methods.dart';

class PatientEnterId extends StatefulWidget {
  String doctorCode;
  String doctorId;
  PatientEnterId(this.doctorCode, this.doctorId);
  @override
  _PatientEnterIdState createState() =>
      _PatientEnterIdState(doctorCode, doctorId);
}

class _PatientEnterIdState extends State<PatientEnterId> {
  String doctorCode;
  String doctorId;
  _PatientEnterIdState(this.doctorCode, this.doctorId);

  _showSnackBarWrongID() {
    var snackbar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Row(
              children: [
                Text(
                  'Wrong ID. Try again,\n or click "Call Doctor" ',
                  style: simpleNo_Style(),
                ),
                FlatButton.icon(
                    onPressed: () {}, icon: Icon(Icons.call), label: Text(''))
              ],
            ),
          ),
        ],
      ),
      duration: Duration(seconds: 4),
      backgroundColor: Colors.deepOrange,
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int patientNo = 2;
  var doctorIdFromPatient;
  final CollectionReference doctorProfileCollection =
      FirebaseFirestore.instance.collection('doctor profile');

  final CollectionReference patientInformation =
      FirebaseFirestore.instance.collection('patient');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBarMain(context, ''),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: forProfile((value) {
                    doctorIdFromPatient = value;
                  },
                      'Doctor id',
                      Icon(
                        Icons.perm_identity,
                        color: Colors.orange,
                      ),
                      TextInputType.phone),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: forProfile((value) {
                    patientNo = value;
                  },
                      'Enter your Number',
                      Icon(
                        Icons.confirmation_number,
                        color: Colors.orange,
                      ),
                      TextInputType.phone),
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () async {
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
                        builder: (context) =>
                            PatientView(doctorId.toString())));
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

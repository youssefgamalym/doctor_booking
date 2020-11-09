import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/main.dart';
import 'package:doctor_booking/methods.dart';
import 'package:doctor_booking/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorSettings extends StatefulWidget {
  @override
  _DoctorSettingsState createState() => _DoctorSettingsState();
}

class _DoctorSettingsState extends State<DoctorSettings> {
  _showSnackBarWrong() {
    var snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Row(
              children: [
                Text(
                  'try again',
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

  final CollectionReference doctorProfileCollection =
      FirebaseFirestore.instance.collection('doctor profile');
  final CollectionReference patientUpdatesCollection =
      FirebaseFirestore.instance.collection('patient Updates');

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _keyDelete = GlobalKey<FormState>();

  String textConfirmation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBarMain(context, 'Settings'),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Delete Account :',
                  style: styleForNormalText(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 15, bottom: 10),
                child: SizedBox(
                  width: 200,
                  child: Form(
                    key: _keyDelete,
                    child: TextFormField(
                      onChanged: (value) {
                        textConfirmation = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person_add_disabled,
                            color: Colors.orange,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                color: Colors.orangeAccent, width: 3),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 3)),
                          labelStyle: TextStyle(color: Colors.deepOrange),
                          filled: true,
                          //fillColor: Colors.white70,
                          labelText: 'Write \'Delete\''),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, MyApp.DOCTOR_VIEW);
                  },
                  color: Colors.orange,
                  child: Text(
                    'Back',
                    style: simpleNo_Style(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () async {
                    if (_keyDelete.currentState.validate()) {
                      if (textConfirmation == 'Delete') {
                        await FirebaseAuth.instance.currentUser.delete();
                        await patientUpdatesCollection
                            .doc(getCurrentUserId())
                            .delete();
                        await doctorProfileCollection
                            .doc(getCurrentUserId())
                            .delete();
                        Navigator.pushReplacementNamed(
                            context, MyApp.HOME_PAGE);
                      }
                      _showSnackBarWrong();
                    }
                  },
                  color: Colors.orange,
                  child: Text(
                    'Delete',
                    style: simpleNo_Style(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

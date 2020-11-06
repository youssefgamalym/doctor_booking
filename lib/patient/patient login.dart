import 'package:doctor_booking/main.dart';
import 'package:doctor_booking/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../methods.dart';

class PatientLogin extends StatefulWidget {
  @override
  _PatientLoginState createState() => _PatientLoginState();
}

final _keyEmail = GlobalKey<FormState>();
final _keyPassword = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

class _PatientLoginState extends State<PatientLogin> {
  String patientLoginEmail, patientLoginPassword;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width / 1.2;
    return Scaffold(
      appBar: appBarMain(context, 'login'),
      key: _keyScaffold,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _keyEmail,
                      child: SizedBox(
                        width: sizeW,
                        child: forLogin(
                            (value) {
                              patientLoginEmail = value;
                            },
                            'Enter your Email',
                            Icon(Icons.email, color: Colors.orange),
                            TextInputType.emailAddress,
                            false,
                            (email) {
                              if (email.isEmpty) {
                                return ' Please Enter your Email';
                              }
                              return null;
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Form(
                    key: _keyPassword,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: sizeW,
                        child: forLogin(
                            (value) {
                              patientLoginPassword = value;
                            },
                            'Enter your Password',
                            Icon(Icons.vpn_key, color: Colors.orange),
                            TextInputType.text,
                            true,
                            (email) {
                              if (email.isEmpty) {
                                return ' Please Enter your Password';
                              }
                              return null;
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FlatButton(
                    color: Colors.orange,
                    child: Text(
                      'login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () async {
                      if (_keyEmail.currentState.validate() &&
                          _keyPassword.currentState.validate()) {
                        try {
                          final User = await _auth.signInWithEmailAndPassword(
                              email: patientLoginEmail,
                              password: patientLoginPassword);

                          if (User != null) {
                            print('from login(screen) ${getCurrentUserId()}');
                            Navigator.pushNamed(context, MyApp.PATIENT_SELECT);
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

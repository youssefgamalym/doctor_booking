import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../methods.dart';

class DoctorLogin extends StatefulWidget {
  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

final _KeyPassward = GlobalKey<FormState>();
final _KeyEmail = GlobalKey<FormState>();

class _DoctorLoginState extends State<DoctorLogin> {
  String doctorLoginEmail, doctorLoginPassword;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width / 1.2;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign in',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
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
                      key: _KeyEmail,
                      child: SizedBox(
                        width: sizeW,
                        child: forLogin(
                            (value) {
                              doctorLoginEmail = value;
                            },
                            'your Email Address',
                            Icon(
                              Icons.email,
                              color: Colors.orange,
                            ),
                            TextInputType.emailAddress,
                            false,
                            (String email) {
                              if (email.isEmpty) {
                                return ' Please Enter your Email';
                              }
                              // else {
                              //   var regExp = new RegExp(
                              //       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*");
                              //   if (regExp.hasMatch(email)) {
                              //     return ' email is invalid';
                              //   }
                              // }
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Form(
                    key: _KeyPassward,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: sizeW,
                        child: forLogin(
                            (value) {
                              doctorLoginPassword = value;
                            },
                            'Your Password',
                            Icon(
                              Icons.vpn_key,
                              color: Colors.orange,
                            ),
                            TextInputType.text,
                            true,
                            (String password) {
                              if (password.isEmpty) {
                                return ' Please Enter your Password';
                              }
                              if (password.length < 8) {
                                return 'your Password is too week';
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
                      if (_KeyEmail.currentState.validate() &&
                          _KeyPassward.currentState.validate()) {
                        try {
                          final User = await _auth.signInWithEmailAndPassword(
                              email: doctorLoginEmail,
                              password: doctorLoginPassword);
                          if (User != null) {
                            print(getCurrentUserId());
                            Navigator.pushNamed(context, MyApp.DOCTOR_VIEW);
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

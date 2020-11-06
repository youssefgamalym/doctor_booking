import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../methods.dart';
import '../widgets.dart';

class PatientNewAccount extends StatefulWidget {
  @override
  _PatientNewAccountState createState() => _PatientNewAccountState();
}

class _PatientNewAccountState extends State<PatientNewAccount> {
  String dropdownValue = 'Doctor';

  _showSnackBarForP() {
    var snackbar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Text(
              'Those passwords didn\'t match. \ntry again.',
              style: simpleNo_Style(),
            ),
          ),
        ],
      ),
      duration: Duration(seconds: 4),
      backgroundColor: Colors.deepOrange,
    );
    _scaffoldKeyForP.currentState.showSnackBar(snackbar);
  }

  final _keyUserName = GlobalKey<FormState>();
  final _keyEmail = GlobalKey<FormState>();
  final _keyPassward = GlobalKey<FormState>();
  final _keyPasswardR = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKeyForP = GlobalKey<ScaffoldState>();
  String createEmail, createPassword, createPasswordR, createName;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static const String CREATE_EMAIL_PATIENT = '';

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width / 1.5;

    return Scaffold(
      key: _scaffoldKeyForP,
      appBar: appBarMain(context, 'Sign up'),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create your Account',
                        style: simpleTextStyle(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Form(
                    key: _keyUserName,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: sizeW,
                          child: forNewAccount(
                              (value) {
                                createName = value;
                              },
                              'User Name',
                              Icon(
                                Icons.person_add_alt_1_rounded,
                                color: Colors.orange,
                              ),
                              TextInputType.text,
                              false,
                              (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter User Name';
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Form(
                    key: _keyEmail,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: sizeW,
                          child: forNewAccount(
                              (value) {
                                createEmail = value;
                              },
                              'Email Address',
                              Icon(
                                Icons.email,
                                color: Colors.orange,
                              ),
                              TextInputType.emailAddress,
                              false,
                              (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter your Email';
                                }
                                // else {
                                //   var regExp = new RegExp(
                                //       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*");
                                //   if (regExp.hasMatch(value)) {
                                //     return ' email is invalid';
                                //   }
                                // }
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Form(
                    key: _keyPassward,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: sizeW,
                          child: forNewAccount(
                              (value) {
                                createPassword = value;
                              },
                              'Password',
                              Icon(
                                Icons.vpn_key,
                                color: Colors.orange,
                              ),
                              TextInputType.text,
                              true,
                              (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter your Password';
                                }
                                if (value.length <= 8) {
                                  return 'Use 8 or more characters ';
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Form(
                    key: _keyPasswardR,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: sizeW,
                          child: forNewAccount(
                              (value) {
                                createPasswordR = value;
                              },
                              'Repeat Password',
                              Icon(
                                Icons.vpn_key,
                                color: Colors.orange,
                              ),
                              TextInputType.text,
                              true,
                              (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter your Password again';
                                }
                                if (value.length <= 8) {
                                  return 'Use 8 or more characters ';
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Select Enter as Doctor or Patient : ',
                        style: simpleTextStyle(),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Doctor', 'Patient']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child:
                                Text(value, style: simpleTextStyleDropdown()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: RaisedButton(
                    onPressed: () async {
                      if (_keyUserName.currentState.validate() &&
                          _keyEmail.currentState.validate() &&
                          _keyPassward.currentState.validate() &&
                          _keyPasswardR.currentState.validate()) {
                        if (createPassword == createPasswordR) {
                          try {
                            final User = await _auth
                                .createUserWithEmailAndPassword(
                                    email: createEmail,
                                    password: createPassword)
                                .then((username) {
                              username.user
                                  .updateProfile(displayName: createName);
                              getCurrentUserId();
                              print(getCurrentUserId());
                              if (dropdownValue == 'Doctor') {
                                Navigator.pushNamed(
                                    context, MyApp.DOCTOR_PROFILE);
                                //  _controller.clear();
                              } else {
                                Navigator.pushNamed(
                                    context, MyApp.PATIENT_SELECT);
                              }
                            });
                          } catch (e) {
                            print(e);
                          }
                        } else
                          _showSnackBarForP();
                      } else {
                        //please fix the errors
                      }
                    },
                    color: Colors.orange,
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showSnackbar() {
    _scaffoldKeyForP.currentState
        .showSnackBar(SnackBar(content: Text('Processing Data')));
  }
}

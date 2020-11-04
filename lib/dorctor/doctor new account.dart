import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../methods.dart';
import '../widgets.dart';

class CareatNewAccount extends StatefulWidget {
  @override
  _CareatNewAccountState createState() => _CareatNewAccountState();
}

class _CareatNewAccountState extends State<CareatNewAccount> {
  _showSnackBarForP() {
    var snackbar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Text(
              'unidentical',
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

  final GlobalKey<ScaffoldState> _scaffoldKeyForP = GlobalKey<ScaffoldState>();
  // ignore: non_constant_identifier_names
  String C_Email, C_Password, C_RPassword, C_name;
  TextEditingController _controller = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  int currentPatientNo = 0;
  int pending = 0;
  String dropdownValue = 'Offline';

  final CollectionReference patient_updates =
      FirebaseFirestore.instance.collection('patient Updates');

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width / 1.5;
    return Scaffold(
      key: _scaffoldKeyForP,
      appBar: appBarMain(context, 'Sign up'),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: sizeW,
                            child: TextFormField(
                              onChanged: (vale) {
                                C_name = vale;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person_add_alt_1_rounded,
                                    color: Colors.orange,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.orangeAccent, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 3)),
                                  labelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  filled: true,

                                  //fillColor: Colors.white70,

                                  labelText: 'User Name'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: sizeW,
                            child: TextFormField(
                              onChanged: (vale) {
                                C_Email = vale;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.orange,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.orangeAccent, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 3)),
                                  labelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  filled: true,

                                  //fillColor: Colors.white70,

                                  labelText: 'Email Address'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: sizeW,
                            child: TextFormField(
                              onChanged: (vale) {
                                C_Password = vale;
                              },
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.orange,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.orangeAccent, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 3)),
                                  labelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  filled: true,

                                  //fillColor: Colors.white70,

                                  labelText: 'Password'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: sizeW,
                            child: TextFormField(
                              onChanged: (vale) {
                                C_RPassword = vale;
                              },
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.orange,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.orangeAccent, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 3)),
                                  labelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  filled: true,

                                  //fillColor: Colors.white70,

                                  labelText: ' Repeat Password'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RaisedButton(
                    onPressed: () async {
                      if (C_Password == C_RPassword) {
                        try {
                          final User = await _auth
                              .createUserWithEmailAndPassword(
                                  email: C_Email, password: C_Password)
                              .then((username) {
                            username.user.updateProfile(displayName: C_name);
                            getCurrentUserId();
                            print(getCurrentUserId());

                            Navigator.pushNamed(context, MyApp.DOCTOR_PROFILE);
                            //  _controller.clear();
                          });
                        } catch (e) {
                          print(e);
                        }
                      } else
                        _showSnackBarForP();
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

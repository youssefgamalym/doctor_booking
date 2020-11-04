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

final _formKeyP = GlobalKey<FormState>();

class _PatientLoginState extends State<PatientLogin> {
  String P_email, P_passord;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width / 1.2;
    return Scaffold(
      appBar: appBarMain(context, 'login'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: sizeW,
                    child: TextFormField(
                      onChanged: (vale) {
                        P_email = vale;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
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
                          labelText: 'your Email Address'),
                      validator: (email) {
                        if (email.isEmpty) {
                          return ' Please Enter your Email';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Form(
                  key: _formKeyP,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: sizeW,
                      child: TextFormField(
                        onChanged: (vale) {
                          P_passord = vale;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
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
                          labelText: 'Your Password',
                        ),
                        validator: (password) {
                          if (password.isEmpty) {
                            return ' Please Enter your Password';
                          }
                          return null;
                        },
                      ),
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
                    // if (_formKey.currentState.validate()) {
                    //   Scaffold.of(context).showSnackBar(
                    //       SnackBar(content: Text('Processing Data')));
                    // }
                    try {
                      final User = await _auth.signInWithEmailAndPassword(
                          email: P_email, password: P_passord);

                      if (User != null) {
                        var Pid = getCurrentUserId();
                        print('from login(screen) $Pid');
                        Navigator.pushNamed(context, MyApp.PATIENT_SELECT);
                        //_controller.clear();
                      }
                    } catch (e) {
                      print(e);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

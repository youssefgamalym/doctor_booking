import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoctorLogin extends StatefulWidget {
  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  String L_email, L_passord;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _controller = new TextEditingController();

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
                        L_email = vale;
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
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: sizeW,
                    child: TextFormField(
                      onChanged: (vale) {
                        L_passord = vale;
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
                          borderSide:
                              BorderSide(color: Colors.orangeAccent, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                color: Colors.orangeAccent, width: 3)),
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        filled: true,
                        //fillColor: Colors.white70,
                        labelText: 'Your Password',
                      ),
                      validator: (email) {
                        if (email.isEmpty) {
                          return ' Please Enter your Email';
                        }
                      },
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
                    try {
                      final User = await _auth.signInWithEmailAndPassword(
                          email: L_email, password: L_passord);

                      if (User != null) {
                        Navigator.pushNamed(context, 'doctor view');
                        _controller.clear();
                      }
                    } catch (e) {
                      print(e);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

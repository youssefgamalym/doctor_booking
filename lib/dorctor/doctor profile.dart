import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  String firstName,
      lastName,
      Specialization,
      timesStart,
      timesend,
      Phone_Number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    SizedBox(
                      width: 165,
                      child: forProfile(
                          firstName,
                          'first name',
                          Icon(
                            Icons.person_add_alt_1_rounded,
                            color: Colors.orange,
                          )),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    SizedBox(
                      width: 165,
                      child: forProfile(
                          lastName,
                          'last name',
                          Icon(
                            Icons.person_add_alt_1_rounded,
                            color: Colors.orange,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: forProfile(
                          Phone_Number,
                          'Phone Number',
                          Icon(
                            Icons.phone,
                            color: Colors.orange,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: forProfile(
                          Specialization,
                          'Specialization',
                          Icon(
                            Icons.account_balance_outlined,
                            color: Colors.orange,
                          )),
                    ),
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
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: forProfile(
                          timesStart,
                          'from',
                          Icon(
                            Icons.access_time,
                            color: Colors.orange,
                          )),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 100,
                      child: forProfile(
                          timesend,
                          'to',
                          Icon(
                            Icons.access_time,
                            color: Colors.orange,
                          )),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: null,
                color: Colors.orange,
                child: Text('Add Location'),
              ),
              RaisedButton(
                onPressed: null,
                color: Colors.orange,
                child: Text('Save'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'doctor view');
                },
                color: Colors.orange,
                child: Text('Start'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

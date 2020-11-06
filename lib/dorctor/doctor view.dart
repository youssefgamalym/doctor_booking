import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../methods.dart';
import '../widgets.dart';

class DoctorView extends StatefulWidget {
  @override
  _DoctorViewState createState() => _DoctorViewState();
  static const String CURRENT_PATIENT_NO = 'currentPatientNo';
}

class _DoctorViewState extends State<DoctorView> {
  int currentPatientNo = 0;
  int pending = 0;
  String dropdownValue = 'Offline';

  final CollectionReference patient_updates =
      FirebaseFirestore.instance.collection('patient Updates');

  IncreaseCurrentPatientNocurrentPatientNo() {
    setState(() {
      currentPatientNo++;
    });
  }

  decreaseCurrentPatientNo() {
    setState(() {
      currentPatientNo--;
    });
  }

  IncreasePending() {
    setState(() {
      pending++;
    });
  }

  decreasePending() {
    setState(() {
      pending--;
    });
  }

  _showSnackBar() {
    var snackbar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Text(
              'Done',
              style: simpleNo_Style(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBarMain(context, 'Welcome Doctor'),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Center(
                  child: SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: Image.asset('Images/drowerHeader/iconView.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.perm_contact_cal_rounded,
                          color: Colors.orange,
                        ),
                        title: Text(
                          'Update your profile',
                          style: simpleTextStyle(),
                        ),
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, MyApp.DOCTOR_UPDATE_PROFILE);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Row(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Current patient No.',
                            style: simpleTextStyle(),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 60,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.deepOrange,
                                child: Center(
                                  child: Text(
                                    '$currentPatientNo',
                                    style: simpleNo_Style(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                            onPressed: () {
                              decreaseCurrentPatientNo();
                            },
                            child: Image(
                              image: AssetImage('Images/icons/left_arrow.png'),
                              width: 40,
                              height: 40,
                              color: Colors.orange,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              IncreaseCurrentPatientNocurrentPatientNo();
                            },
                            child: Image(
                              image: AssetImage('Images/icons/right_arrow.png'),
                              width: 40,
                              height: 40,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pending :',
                            style: simpleTextStyle(),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 60,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.deepOrange,
                                child: Center(
                                  child: Text(
                                    '$pending',
                                    style: simpleNo_Style(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                            onPressed: () {
                              decreasePending();
                            },
                            child: Image(
                              image: AssetImage('Images/icons/left_arrow.png'),
                              width: 40,
                              height: 40,
                              color: Colors.orange,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              IncreasePending();
                            },
                            child: Image(
                              image: AssetImage('Images/icons/right_arrow.png'),
                              width: 40,
                              height: 40,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status :  ',
                            style: simpleTextStyle(),
                          ),
                          DropdownButton<String>(
                            value: dropdownValue,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['Online', 'Offline']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: simpleTextStyleDropdown()),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FlatButton(
                            color: Colors.orange,
                            child: Text('Refresh', style: simpleNo_Style()),
                            onPressed: () async {
                              var patientMap = {
                                DoctorView.CURRENT_PATIENT_NO: currentPatientNo,
                                'pending': pending,
                                'dropdownValue': dropdownValue,
                              };
                              _showSnackBar();
                              try {
                                patient_updates
                                    .doc(getCurrentUserId())
                                    .set(patientMap)
                                    .catchError((error) {
                                  print("Error: $error");
                                });
                              } catch (e) {
                                print(e);
                              }
                            }
                            //  Navigator.pushNamed(context, 'doctor view');
                            ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

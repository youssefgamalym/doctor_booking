import 'package:doctor_booking/home.dart';
import 'package:doctor_booking/patient/patient%20select%20.dart';
import 'package:doctor_booking/patient/patient%20view.dart';
import 'package:flutter/material.dart';

import 'dorctor/doctor login.dart';
import 'dorctor/doctor new account.dart';
import 'dorctor/doctor profile.dart';
import 'dorctor/doctor view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        'doctor login': ((context) => DoctorLogin()),
        'create account': ((context) => CareatNewAccount()),
        'doctor profile': ((context) => DoctorProfile()),
        'doctor view': ((context) => DoctorView()),
        'patient select': ((context) => PatientSelect()),
        'patient view': ((context) => PatientView()),
      },
    );
  }
}

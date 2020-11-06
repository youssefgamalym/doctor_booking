import 'package:doctor_booking/home.dart';
import 'package:doctor_booking/patient/patient%20enter%20id.dart';
import 'package:doctor_booking/patient/patient%20login.dart';
import 'package:doctor_booking/patient/patient%20new%20account.dart';
import 'package:doctor_booking/patient/patient%20select%20.dart';
import 'package:doctor_booking/patient/patient%20view.dart';
import 'package:doctor_booking/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dorctor/doctor information.dart';
import 'dorctor/doctor login.dart';
import 'dorctor/doctor profile.dart';
import 'dorctor/doctor update profile.dart';
import 'dorctor/doctor view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  static const String DOCTOR_LOGIN = 'doctor login';
  static const String DOCTOR_NEW_ACCOUNT = 'create account';
  static const String DOCTOR_PROFILE = 'doctor profile';
  static const String DOCTOR_VIEW = 'doctor view';
  static const String PATIENT_SELECT = 'patient select';
  static const String PATENT_VIEW = 'patient view';
  static const String PATENT_ENTER_ID = 'patient enter id';
  static const String PATENT_LOGIN = 'patient login';
  static const String PATENT_NEW_ACCOUNT = 'patient new account';
  static const String DOCTOR_INFORMATION = 'doctor information';
  static const String DOCTOR_UPDATE_PROFILE = 'doctor update profile';

  static const String TEST = 'test';
  String x = 'k', y = 'j', z = 'l', m;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        DOCTOR_LOGIN: ((context) => DoctorLogin()),
        DOCTOR_PROFILE: ((context) => DoctorProfile()),
        DOCTOR_VIEW: ((context) => DoctorView()),
        PATIENT_SELECT: ((context) => PatientSelect()),
        PATENT_VIEW: ((context) => PatientView(y.toString())),
        PATENT_NEW_ACCOUNT: ((context) => PatientNewAccount()),
        PATENT_LOGIN: ((context) => PatientLogin()),
        PATENT_ENTER_ID: ((context) => PatientEnterId(x, z)),
        DOCTOR_INFORMATION: ((context) => doctorInformations(m)),
        DOCTOR_UPDATE_PROFILE: ((context) => DoctorUpdateProfile()),
        TEST: ((context) => Test()),
      },
    );
  }
}

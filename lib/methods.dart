import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final CollectionReference doctor_profile_Collection =
    FirebaseFirestore.instance.collection('doctor profile');

getCurrentUserId() {
  final pid = _auth.currentUser.uid;
  return pid;
}

TextStyle simpleTextStyle() {
  return TextStyle(
      color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle styleForAppBar() {
  return TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle simpleTextStyleDropdown() {
  return TextStyle(
      color: Colors.deepOrange, fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle styleForNormalText() {
  return TextStyle(
      color: Colors.deepOrange, fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle styleForNormalTextSmall() {
  return TextStyle(
      color: Colors.deepOrange, fontSize: 15, fontWeight: FontWeight.bold);
}

TextStyle simpleNo_Style() {
  return TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle styleForPatientSelect() {
  return TextStyle(
      color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold);
}

class Methods extends StatefulWidget {
  @override
  _MethodsState createState() => _MethodsState();
}

class _MethodsState extends State<Methods> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

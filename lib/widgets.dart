import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget appBarMain(BuildContext context, String Title) {
  return AppBar(
    title: Text(Title, style: styleForAppBar()),
    centerTitle: true,
    backgroundColor: Colors.deepOrange,
  );
}

final CollectionReference doctor_profile_Collection =
    FirebaseFirestore.instance.collection('doctor profile');
callCollection() {
  return doctor_profile_Collection;
}

setCallCollection() {}
TextFormField forProfile(var onChanged, String labeltext, Icon icon) {
  return TextFormField(
    onChanged: onChanged,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
        icon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.orangeAccent, width: 3),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.orangeAccent, width: 3)),
        labelStyle: TextStyle(color: Colors.deepOrange),
        filled: true,
        //fillColor: Colors.white70,
        labelText: labeltext),

    // validator: (String email) {
    //   if (email.isEmpty) {
    //     return ' Please Enter your Email';
    //   }
    // },
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(
      color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle simpleTextStyleDropdown() {
  return TextStyle(
      color: Colors.deepOrange, fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle simpleNo_Style() {
  return TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle styleForAppBar() {
  return TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle styleForNormalText() {
  return TextStyle(
      color: Colors.deepOrange, fontSize: 20, fontWeight: FontWeight.bold);
}

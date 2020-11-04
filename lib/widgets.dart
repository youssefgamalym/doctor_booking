import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'methods.dart';

Widget appBarMain(BuildContext context, String Title) {
  return AppBar(
    title: Text(Title, style: styleForAppBar()),
    centerTitle: true,
    backgroundColor: Colors.deepOrange,
  );
}

TextFormField forProfile(
    var onChanged, String labeltext, Icon icon, TextInputType kind) {
  return TextFormField(
    onChanged: onChanged,
    keyboardType: kind,
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

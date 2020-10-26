import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context, Title) {
  return AppBar(
    title: Text(Title),
    elevation: 0.0,
    centerTitle: false,
  );
}

TextFormField forProfile(String content, String labeltext, Icon icon) {
  return TextFormField(
    onChanged: (vale) {
      content = vale;
    },
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
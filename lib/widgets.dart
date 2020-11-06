import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'methods.dart';

Widget appBarMain(BuildContext context, String mainTitle) {
  return AppBar(
    title: Text(mainTitle, style: styleForAppBar()),
    centerTitle: true,
    backgroundColor: Colors.deepOrange,
  );
}

TextFormField forProfile(Function(String text) onChanged, String labelText,
    Icon icon, TextInputType kind, Function validator) {
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
        labelText: labelText),
    validator: validator,
  );
}

TextFormField forNewAccount(var onChanged, String labelText, Icon icon,
    TextInputType kind, bool obscure, var validator) {
  return TextFormField(
    onChanged: onChanged,
    keyboardType: kind,
    obscureText: obscure,
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
        labelText: labelText),
    validator: validator,
  );
}

TextFormField forLogin(var onChanged, String labelText, Icon icon,
    TextInputType kind, bool obscure, var validator) {
  return TextFormField(
    onChanged: onChanged,
    keyboardType: kind,
    obscureText: obscure,
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
      labelText: labelText,
    ),
    validator: validator,
  );
}

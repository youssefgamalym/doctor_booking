import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
getCurrentUserId() {
  final pid = _auth.currentUser.uid;
  return pid;
}

showSnackBar() {}
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

String getMessageFromErrorCode(errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "Email already used. Go to login page.";
      break;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong email/password combination.";
      break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "No user found with this email.";
      break;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "User disabled.";
      break;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Too many requests to log into this account.";
      break;
    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      return "Server error, please try again later.";
      break;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "Email address is invalid.";
      break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "No account found with this email";
      break;
    default:
      return "Login failed. Please try again.";
      break;
  }
}

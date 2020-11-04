import 'package:doctor_booking/main.dart';
import 'package:doctor_booking/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'methods.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context, 'Welcome'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyApp.PATENT_LOGIN);
                },
                color: Colors.orange,
                child: Text(
                  'Enter as patient',
                  style: simpleNo_Style(),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyApp.DOCTOR_LOGIN);
                  },
                  color: Colors.orange,
                  child: Text(
                    'Sign in  as Doctor',
                    style: simpleNo_Style(),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyApp.DOCTOR_NEW_ACCOUNT);
                },
                color: Colors.orange,
                child: Text(
                  'Create  account',
                  style: simpleNo_Style(),
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'doctor login');
                  },
                  child: Text('forget Password?'))
            ],
          ),
        ],
      ),
    );
  }
}

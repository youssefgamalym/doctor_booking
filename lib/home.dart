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
    Color buttonTextColor = Colors.deepOrange;

    return Scaffold(
      appBar: appBarMain(context, 'Welcome'),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          // MediaQuery.of(context).size.height
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('Images/therapy_jobs.png'),
          //         fit: BoxFit.cover)),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                child: Image.asset('Images/therapy_jobs.png'),
              ),
              Column(
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
                          'Sign In As Patient',
                          style: simpleNo_Style(),
                        ),
                      )
                    ],
                  ),
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
                        'Sign In As Doctor',
                        style: simpleNo_Style(),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          buttonTextColor = Colors.black;
                        });
                        Navigator.pushNamed(context, MyApp.PATENT_NEW_ACCOUNT);
                      },
                      child: Text(
                        'Create An Account',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: buttonTextColor,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

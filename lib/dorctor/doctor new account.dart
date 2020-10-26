import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CareatNewAccount extends StatefulWidget {
  @override
  _CareatNewAccountState createState() => _CareatNewAccountState();
}

class _CareatNewAccountState extends State<CareatNewAccount> {
  String C_Email, C_Password, C_RPassword, C_name;

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width / 1.5;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: sizeW,
                            child: TextFormField(
                              onChanged: (vale) {
                                C_name = vale;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person_add_alt_1_rounded,
                                    color: Colors.orange,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.orangeAccent, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 3)),
                                  labelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  filled: true,

                                  //fillColor: Colors.white70,

                                  labelText: 'User Name'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: sizeW,
                            child: TextFormField(
                              onChanged: (vale) {
                                C_Email = vale;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.orange,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.orangeAccent, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 3)),
                                  labelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  filled: true,

                                  //fillColor: Colors.white70,

                                  labelText: 'Email Address'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: sizeW,
                            child: TextFormField(
                              onChanged: (vale) {
                                C_Password = vale;
                              },
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.orange,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.orangeAccent, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 3)),
                                  labelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  filled: true,

                                  //fillColor: Colors.white70,

                                  labelText: 'Password'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: sizeW,
                            child: TextFormField(
                              onChanged: (vale) {
                                C_RPassword = vale;
                              },
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.orange,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.orangeAccent, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 3)),
                                  labelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  filled: true,

                                  //fillColor: Colors.white70,

                                  labelText: ' Repeat Password'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'doctor profile');
                    },
                    color: Colors.orange,
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//{
// Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 RaisedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, 'doctor profile');
//                   },
//                   color: Colors.blueAccent,
//                   child: Text(
//                     'Next',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//             )
// }

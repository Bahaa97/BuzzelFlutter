import 'package:arabtesting2dgame/util/Keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeController.dart';

class WelcomeController extends StatefulWidget {
  @override
  _WelcomeControllerState createState() => _WelcomeControllerState();
}

class _WelcomeControllerState extends State<WelcomeController> {
  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 60.0, bottom: 30),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'ادخل',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  'اسمك',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color:Colors.black54),
                                )
                              ],
                            )),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                      ],
                    ),
                    height: 150,
                    width: double.infinity,
                  ),
                  Form(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: double.infinity,
                                  height: 50,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _usernameController,
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
//                      labelText: 'Enter your username'
                                      hintText: " الاسم",
                                      icon: const Icon(
                                        Icons.account_circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )),
                              Divider(
                                height: 1,
                                color: Colors.black,
                              ),
//                              Container(
//                                  margin: EdgeInsets.only(top: 20),
//                                  width: double.infinity,
//                                  height: 50,
//                                  child: TextFormField(
//                                    obscureText: true,
//                                    textAlign: TextAlign.end,
//                                    controller: _passwordController,
//                                    decoration: InputDecoration(
////                      labelText: 'Enter your username'
//                                      hintText: "كلمه السر",
//                                      border: InputBorder.none,
//                                      icon: const Icon(
//                                        Icons.lock,
//                                        color: Colors.black,
//                                      ),
//                                    ),
//                                  )),
                              Divider(
                                height: 1,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),

//

                        new Container(
                          margin: EdgeInsets.only(right: 20, left: 20,top: 50),
                          width: double.infinity,
                          height: 50,
                          decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                              colors: [
                                Colors.black26,
                                Colors.black87
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                            ),
                          ),
                          child: new FlatButton(
                            child: new Text(
                              'انشاء حساب',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              SharedPreferences prefernces = await SharedPreferences.getInstance();
                              prefernces.setBool(IS_FIRST, true);
                              prefernces.setString(USER_NAME, _usernameController.text);
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (context) => HomeController()));
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

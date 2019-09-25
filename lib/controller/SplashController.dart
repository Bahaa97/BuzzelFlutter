import 'dart:async';
import 'dart:math';

import 'package:arabtesting2dgame/util/Keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeController.dart';
import 'package:animator/animator.dart';
import 'WelcomeController.dart';

class SplashController extends StatefulWidget {
  @override
  _SplashController createState() => _SplashController();
}

Future isFirst(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool(IS_FIRST) == null) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => WelcomeController()));
    });
  } else {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeController()));
    });
  }
}

class _SplashController extends State<SplashController> {
  @override
  Widget build(BuildContext context) {
    isFirst(context);
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
      child: Center(
        child: Animator(
          tween: Tween<double>(begin: 0,end: 2 * pi) ,
          duration: Duration(seconds: 3),
          repeats: 0,
          curve: Curves.elasticInOut,
          builder: (anim)=> Transform.rotate(angle: anim.value,
          child: Text(
            "Image Puzzel Games!",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),),
        ),

      ),
    ));
  }
}

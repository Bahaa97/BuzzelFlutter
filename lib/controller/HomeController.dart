import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:animator/animator.dart';
import 'package:arabtesting2dgame/util/Keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends StatefulWidget {
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

Future<String> getName() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString(USER_NAME);
}

class _HomeControllerState extends State<HomeController> {
  String name = "";
  int id1, id2, id3;

  bool _visable = false;

  @override
  Widget build(BuildContext context) {
    getName().then((value) {
      if (value != "") {
        name = value;
      } else {
        name = "مرحبا عزيزى الزائر";
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Puzzel Game"),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Start New'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('LogOut'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            //the position can be random too.
            DragBox(Offset(50.0, 300.0), 'Box Two', 2),
            DragBox(Offset(150.0, 300.0), 'Box Three', 5),
            DragBox(Offset(250.0, 300.0), 'Box Three', 8),
            Container(
              margin: EdgeInsets.all(100),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      DragTarget(
                        onAccept: (int color) {
                          id1 = color;
                          setState(() {
                            if (id1 != null && id2 != null && id3 != null) {
                              _visable = true;
                            }
                          });
                        },
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            width: 80.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: accepted.isEmpty
                                  ? Colors.black26
                                  : Colors.grey.shade200,
                            ),
                            child: Center(
                              child: Image.asset(
                                  id1 == 8 ? "assest/sc$id1.png" : ""),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DragTarget(
                        onAccept: (int color) {
                          id2 = color;
                          setState(() {
                            if (id1 != null && id2 != null && id3 != null) {
                              _visable = true;
                            }
                          });
                        },
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            width: 80.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: accepted.isEmpty
                                  ? Colors.black26
                                  : Colors.grey.shade200,
                            ),
                            child: Center(
                              child: Image.asset(
                                  id2 == 5 ? "assest/sc$id2.png" : ""),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DragTarget(
                        onAccept: (int color) {
                          id3 = color;
                          setState(() {
                            if (id1 != null && id2 != null && id3 != null) {
                              _visable = true;
                            }
                          });
                        },
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            width: 80.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: accepted.isEmpty
                                  ? Colors.black26
                                  : Colors.grey.shade200,
                            ),
                            child: Image.asset(
                                id3 == 2 ? "assest/sc$id3.png" : ""),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),

            Visibility(
              visible: _visable,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(50),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Visibility(
                          visible: _visable,
                          child: Animator(
                            tween: Tween<double>(begin: 0, end: 2 * pi),
                            duration: Duration(seconds: 3),
                            repeats: 0,
                            curve: Curves.easeInCirc,
                            builder: (anim) => Transform.rotate(
                              angle: anim.value,
                              child: Text(
                                "You seccussful pass it.",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                            ),
                          )),
                      Visibility(
                        visible: _visable,
                        child: FlatButton(
                          child: Text("الاعاده"),
                          onPressed: () {
                            setState(() {
                              _visable = false;
                              id1 = null;
                              id2 = null;
                              id3 = null;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final int itemColor;

  DragBox(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 100.0,
            height: 100.0,
            child: Image.asset("assest/sc${widget.itemColor}.png"),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(
            width: 120.0,
            height: 120.0,
            child: Center(
              child: Image.asset("assest/sc${widget.itemColor}.png"),
            ),
          ),
        ));
  }
}

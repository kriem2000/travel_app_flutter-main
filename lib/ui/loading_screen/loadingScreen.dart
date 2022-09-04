// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';

import '../login/login.dart';

class LoadingScreen extends StatefulWidget {
  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: width,
        color: Colors.white,
        child: Center(
          child: Image(
            image: AssetImage(
                "images/LegalWelloffEthiopianwolf-size_restricted.gif"),
          ),
        ),
      ),
    ));
  }
}

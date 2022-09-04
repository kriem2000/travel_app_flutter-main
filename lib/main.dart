// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import './ui/dashBoard/dashBoard.dart';
import 'package:travel_app/ui/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './ui/loading_screen/loadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAuth = false;
  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: isAuth ? Dashboard() : LoadingScreen(),
    );
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }
}

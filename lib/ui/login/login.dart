// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/rounded_btn/rounded_btn.dart';
import 'package:travel_app/ui/create_account/create_account.dart';
import 'package:travel_app/ui/forgot_password/forgot_password.dart';
import "../dashBoard/dashBoard.dart";
import '../../network/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  late String email;
  late String password;
  String error = '';

  void setEmail(value) {
    setState(() {
      email = value;
    });
  }

  void setPassword(value) {
    setState(() {
      password = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      width: 400,
                      height: 200,
                      child: Image.asset('images/Trip-pana.png')),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 8),
                  child: Text(
                    'Its Time To Travel',
                    style: TextStyle(
                        color: Color.fromARGB(255, 129, 194, 248),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Please sign in to continue.',
                    style: TextStyle(
                        color: Color.fromARGB(255, 129, 194, 248),
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.center,
                    child: Column(children: [
                      Form(
                          key: _formKey,
                          child: Column(children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'E-mail',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Material(
                                    elevation: 3,
                                    child: TextFormField(
                                      style: (TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400)),
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: Colors.grey,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: Icon(Icons.email),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 50, 79, 103),
                                              width: 1.0),
                                        ),
                                      ),
                                      onChanged: setEmail,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Material(
                                    elevation: 3,
                                    child: TextFormField(
                                      style: (TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400)),
                                      obscureText: true,
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: Icon(Icons.lock),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 50, 79, 103),
                                              width: 1.0),
                                        ),
                                      ),
                                      onChanged: setPassword,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])),
                    ])),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: RoundedButton(
                      btnText: 'LOGIN',
                      color: Color.fromARGB(255, 14, 98, 167),
                      onPressed: _login,
                    ),
                  ),
                ),
                Center(
                  child: error.length > 0
                      ? Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        )
                      : Text(''),
                ),
                Center(
                    child: FlatButton(
                  child: Text('Forgot Password?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 14, 98, 167),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.w400),
                    ),
                    FlatButton(
                      child: Text('Sign up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 14, 98, 167),
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAccount()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    var data = {'email': email, 'password': password};

    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    print(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      print(body['message']);
      setState(() {
        error = json.decode(res.body)['message'];
      });
    }
  }
}

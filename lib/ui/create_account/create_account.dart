// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_text_field.dart';
import 'package:travel_app/ui/dashBoard/dashBoard.dart';
import '../../components/rounded_btn/rounded_btn.dart';
import "../../components/custom_text_field.dart";
import '../../network/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool showSpinner = false;
  late String email;
  late String password;
  late String full_name;
  late String passport_num;
  late String phone_num;
  bool _isLoading = false;

  void setfull_name(value) {
    setState(() {
      full_name = value;
    });
  }

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

  void setpassport_num(value) {
    setState(() {
      passport_num = value;
    });
  }

  void setphone_num(value) {
    setState(() {
      phone_num = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: _goBackButton(context),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      color: Color.fromARGB(255, 129, 194, 248),
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Please fill the input below.',
                  style: TextStyle(
                      color: Color.fromARGB(255, 129, 194, 248),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Full name',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // full name input
                    Material(
                        elevation: 3,
                        child: CustomTextField(
                          Keyboardtype: TextInputType.text,
                          OnChanged: setfull_name,
                          obscurText: false,
                          icon: Icons.person,
                        )),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'E-mail',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // email input
                    Material(
                        elevation: 3,
                        child: CustomTextField(
                          Keyboardtype: TextInputType.emailAddress,
                          icon: Icons.email,
                          OnChanged: setEmail,
                          obscurText: false,
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                        elevation: 5,
                        child: CustomTextField(
                          Keyboardtype: TextInputType.text,
                          OnChanged: setPassword,
                          obscurText: true,
                          icon: Icons.password,
                        )),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Passport number',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                        elevation: 3,
                        child: CustomTextField(
                          Keyboardtype: TextInputType.text,
                          OnChanged: setpassport_num,
                          obscurText: false,
                          icon: Icons.confirmation_num,
                        )),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Phone Number',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                        elevation: 3,
                        child: CustomTextField(
                          Keyboardtype: TextInputType.phone,
                          OnChanged: setphone_num,
                          obscurText: false,
                          icon: Icons.phone,
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 50, left: 50, top: 20, bottom: 10),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                          child: RoundedButton(
                        btnText: 'Sign up',
                        color: Color.fromARGB(255, 14, 98, 167),
                        onPressed: _register,
                      ))
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Already have an account? Sign in',
                        style: TextStyle(
                          color: Color.fromARGB(255, 129, 194, 248),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    print('enter');
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': email,
      'password': password,
      'phone_num': phone_num,
      'full_name': full_name,
      'passport_num': passport_num
    };

    var res = await Network().authData(data, '/register');
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
    }

    setState(() {
      _isLoading = false;
    });
  }
}

Widget _goBackButton(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.grey[350]),
      onPressed: () {
        Navigator.of(context).pop(true);
      });
}

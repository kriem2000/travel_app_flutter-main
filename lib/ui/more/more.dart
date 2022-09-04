import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:travel_app/models/Flight.dart';
import 'package:travel_app/ui/book_flight/book_flight.dart';
import 'package:travel_app/ui/home/home.dart';
import '../../models/city.dart';
import 'package:travel_app/network/apiResponse.dart';
import 'package:travel_app/services/FlightService.dart';
import '../../network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login.dart';
import '../settingsp/SettingsPage.dart';

class More extends StatefulWidget {
  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Container(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              height: 280,
              width: 500,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 166, 207, 240),
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Container(
                      child: Center(
                    child: SizedBox(
                      height: 120,
                      width: 140,
                      child: Image.asset(
                        'images/woman.png',
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Areej Elbarassi",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 14, 98, 167))),
                        Text(
                          "areej.elbarassi@gmail.com",
                          style: TextStyle(
                              fontSize: 15,
                              // fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 14, 98, 167)),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding:
                              EdgeInsets.only(left: 30, top: 20, right: 16),
                          child: Expanded(
                              child: ElevatedButton.icon(
                                  onPressed: () => {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SettingsPage();
                                        }))
                                      },
                                  icon: Icon(Icons.airplane_ticket),
                                  label: Text('Bookings'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 14, 98, 167),
                                      onPrimary: Colors.white,
                                      shape: StadiumBorder(),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 14, 98, 167)))))),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding:
                              EdgeInsets.only(left: 16, top: 20, right: 30),
                          child: Expanded(
                              child: ElevatedButton.icon(
                                  onPressed: () => {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Home();
                                        }))
                                      },
                                  icon: Icon(Icons.favorite),
                                  label: Text('Favorite'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 14, 98, 167),
                                      onPrimary: Colors.white,
                                      shape: StadiumBorder(),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 14, 98, 167)))))),
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              height: 50,
              width: 300,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 166, 207, 240),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0)
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SettingsPage();
                        }))
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Color.fromARGB(255, 129, 194, 248),
                      ),
                      label: Text(
                        'Settings',
                        style: TextStyle(
                            color: Color.fromARGB(255, 129, 194, 248),
                            fontSize: 20),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 129, 194, 248),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              height: 50,
              width: 300,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 166, 207, 240),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0)
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SettingsPage();
                        }))
                      },
                      icon: Icon(
                        Icons.help,
                        color: Color.fromARGB(255, 129, 194, 248),
                      ),
                      label: Text(
                        'Help & Support',
                        style: TextStyle(
                            color: Color.fromARGB(255, 129, 194, 248),
                            fontSize: 20),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 129, 194, 248),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              height: 50,
              width: 300,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 166, 207, 240),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0)
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                      onPressed: () => {logout()},
                      icon: Icon(
                        Icons.logout,
                        color: Color.fromARGB(255, 129, 194, 248),
                      ),
                      label: Text(
                        'Logout',
                        style: TextStyle(
                            color: Color.fromARGB(255, 129, 194, 248),
                            fontSize: 20),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 129, 194, 248),
                    ),
                  ]),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Version : 1.0',
                style: TextStyle(color: Colors.grey[350], fontSize: 20),
              ),
            )
          ]),
        )))));
  }

  void logout() async {
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}

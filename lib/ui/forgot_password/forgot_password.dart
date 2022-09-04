import 'package:flutter/material.dart';

import '../login/login.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  Center(
                    child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset('images/Forgotpassword-bro.png')),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Text(
                      'Create a new password',
                      style: TextStyle(
                          color: Color.fromARGB(255, 129, 194, 248),
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'New password',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 5,
                          child: TextField(
                            style: (TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            )),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.password),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Re-type new password',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 5,
                          child: TextField(
                            style: (TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            )),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.password),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
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
                              child: ElevatedButton(
                            onPressed: () => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Login();
                              }))
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 14, 98, 167)),
                            child: const Text('Save'),
                          ))
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }

  Widget _goBackButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[350]),
        onPressed: () {
          Navigator.of(context).pop(true);
        });
  }
}

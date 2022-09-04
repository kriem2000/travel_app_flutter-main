import 'package:flutter/material.dart';
import 'package:travel_app/models/Flight.dart';
import '../../components/themehelper.dart';
import '../ticket/ticket.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../network/api.dart';
import 'package:travel_app/network/apiResponse.dart';
import 'dart:convert';
import '../../models/reservation.dart';

class BookFlight extends StatefulWidget {
  Flight flight;

  BookFlight(this.flight);

  @override
  State<BookFlight> createState() => _BookFlightState();
}

class _BookFlightState extends State<BookFlight> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  List<String> _item = ["Male ", "Female "];
  String _currentitem = "Male";
  List<String> _list = ["Business", "Economy"];
  String _currentlist = "Business";
  bool showSpinner = false;
  String error = '';

  TextEditingController email = new TextEditingController(text: '');
  TextEditingController full_name = new TextEditingController(text: '');
  TextEditingController passport_num = new TextEditingController(text: '');
  TextEditingController phone_num = new TextEditingController(text: '');
  late int user_id;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user') as String);
    print(user);
    if (user != null) {
      setState(() {
        full_name = new TextEditingController(text: user['full_name']);
        passport_num =
            new TextEditingController(text: '${user['passport_num']}');
        phone_num = new TextEditingController(text: '${user['phone_num']}');
        email = new TextEditingController(text: user['email']);
        user_id = user['id'];
      });
    }
  }

  // void setfull_name(value) {
  //   setState(() {
  //     full_name = value;
  //   });
  // }

  // void setEmail(value) {
  //   setState(() {
  //     email = value;
  //   });
  // }

  // void setpassport_num(value) {
  //   setState(() {
  //     passport_num = value;
  //   });
  // }

  // void setphone_num(value) {
  //   setState(() {
  //     phone_num = value;
  //   });
  // }

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
                  'BOOK A TICKET',
                  style: TextStyle(
                      color: Color.fromARGB(255, 129, 194, 248),
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Please fill the input below and make sure it is correct!.',
                  style: TextStyle(
                      color: Color.fromARGB(255, 129, 194, 248),
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  alignment: Alignment.center,
                  child: Column(children: [
                    Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          child: TextFormField(
                            controller: full_name,
                            decoration: ThemeHelper().textInputDecoration(
                                'Full Name', 'Enter your Full name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: email,
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            controller: passport_num,
                            decoration: ThemeHelper().textInputDecoration(
                                'Passport number',
                                'Enter your Passport number'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: phone_num,
                            decoration: ThemeHelper().textInputDecoration(
                                "Mobile Number", "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gender ",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(_item[0]),
                                Radio(
                                    value: _item[0],
                                    groupValue: _currentitem,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _currentitem = newValue!;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(_item[1]),
                                Radio(
                                    value: _item[1],
                                    groupValue: _currentitem,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _currentitem = newValue!;
                                      });
                                    }),
                              ],
                            ),
                          ],
                        )),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " PlanClass",
                              style: TextStyle(fontSize: 17),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  _list[0],
                                ),
                                Radio(
                                    value: _list[0],
                                    groupValue: _currentlist,
                                    onChanged: (String? Value) {
                                      setState(() {
                                        _currentlist = Value!;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(_list[1]),
                                Radio(
                                    value: _list[1],
                                    groupValue: _currentlist,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _currentlist = newValue!;
                                      });
                                    }),
                              ],
                            ),
                          ],
                        )),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                      "I accept all terms and conditions.",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 1),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Done".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _reservation();
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (context) => Tickets()),
                                //     (Route<dynamic> route) => false);
                              }
                            },
                          ),
                        ),
                        error.length > 0
                            ? Text(
                                error,
                                style: TextStyle(color: Colors.red),
                              )
                            : Text(''),
                      ]),
                    )
                  ]))
            ]))));
  }

  void _reservation() async {
    Map<String, Object> data = {
      'email': email.text,
      'passport_num': passport_num.text,
      'phone_num': phone_num.text,
      'flight_id': widget.flight.id,
      'user_id': user_id,
      'class_name': _currentlist
    };
    var res = await Network().authData(data, '/resrvation');
    var body = json.decode(res.body);
    print(res.body);
    if (body['success']) {
      Reservation reservation =
          Reservation.fromJson(json.decode(res.body)['reservation']);
      int flight_num = json.decode(res.body)['flight_num'];
      String seat_num = json.decode(res.body)['seat_num'];
      String class_name = json.decode(res.body)['class_name'];
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => Tickets(
                  reservation: reservation,
                  seat_num: seat_num,
                  flight_num: flight_num,
                  class_name: class_name,
                )),
      );
    } else {
      setState(() {
        error = json.decode(res.body)['message'];
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
}

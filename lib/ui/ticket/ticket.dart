import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:travel_app/models/reservation.dart';
import 'package:travel_app/ui/offers/offers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../network/apiResponse.dart';
import '../../services/ReservationService.dart';

class Tickets extends StatefulWidget {
  Reservation reservation;
  int flight_num;
  String seat_num;
  String class_name;

  @override
  State<Tickets> createState() => _TicketsState();
  Tickets(
      {required this.reservation,
      required this.seat_num,
      required this.flight_num,
      required this.class_name});
}

class _TicketsState extends State<Tickets> {
  bool _isloading = true;
  String full_name = '';
  int passport_num = 0;

  @override
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
        full_name = user['full_name'];
        passport_num = user['passport_num'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _goBackButton(context),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Tickers",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 14, 98, 167),
      ),
      backgroundColor: Color.fromARGB(255, 14, 98, 167),
      body: Center(
        child: Container(
          width: 350,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    "IST",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.flight_takeoff,
                      color: Color.fromARGB(255, 14, 98, 167),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "BEN",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Fligh Ticket",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                ),
                child: Column(
                  children: [
                    tickeDetailsWidget('passengers', full_name, 'Date',
                        widget.reservation.booking_date),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, right: 2),
                      child: tickeDetailsWidget(
                          'PASSPORT',
                          passport_num.toString(),
                          'TIckET NUMBER',
                          widget.flight_num.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, right: 30),
                      child: tickeDetailsWidget(
                          'class', widget.class_name, 'seat', widget.seat_num),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/barcode.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 75, right: 75),
                child: Text(
                  '6789 6794 2356 678',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

Widget tickeDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$firstTitle",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "$firstDesc",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$secondTitle",
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              "$secondDesc",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _goBackButton(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.grey[350]),
      onPressed: () {
        Navigator.of(context).pop();
      });
}

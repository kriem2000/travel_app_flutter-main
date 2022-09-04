import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:travel_app/models/Flight.dart';
import 'package:travel_app/ui/book_flight/book_flight.dart';
import 'package:travel_app/ui/home/home.dart';
import '../../models/city.dart';
import '../../models/origen_airport.dart';
import 'package:travel_app/network/apiResponse.dart';
import 'package:travel_app/services/FlightService.dart';
import '../../network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login.dart';

class Offers extends StatefulWidget {
  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<dynamic> _flight = [];
  bool _isloading = true;

  @override
  void initState() {
    retrieveFlight();
    super.initState();
  }

  Future<void> retrieveFlight() async {
    ApiResponse response = await FlightService().getFlights();
    if (response.error == null) {
      setState(() {
        _flight = response.data as List<dynamic>;
        _isloading = _isloading ? !_isloading : _isloading;
      });
    }
  }

  Widget build(BuildContext context) {
    return _isloading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: _goBackButton(context),
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            body: Container(
                padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                child: Column(
                  children: [
                    Column(children: [
                      Container(
                        child: Text(
                          " Pack your bags and let's go",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 166, 207, 240)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.local_offer,
                              color: Color.fromARGB(255, 166, 207, 240)),
                          SizedBox(
                            width: 8,
                          ),
                          Text("All Offers",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500])),
                        ],
                      ),
                      Divider(
                        height: 15,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _flight.length,
                        itemBuilder: (BuildContext context, int index) {
                          Flight flight = _flight[index];
                          return Column(children: [
                            // Text('${flight.flight_num}'),
                            // Text('${flight.city.name}'),
                            InkWell(
                                child: SingleChildScrollView(
                                    child: Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 7,
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15)),
                                            child: Image.asset(
                                              'images/Istanbul-Travel.jpg',
                                              height: 240,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            height: 240,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            alignment: Alignment.bottomLeft,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                  Colors.black.withOpacity(0),
                                                  Colors.black.withOpacity(0.8)
                                                ],
                                                    stops: [
                                                  0.5,
                                                  1
                                                ])),
                                            child: Text(
                                              '${flight.city.name}',
                                              style: //Theme.of(context).textTheme.headline6,
                                                  TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white),
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.today,
                                                        color: Colors.grey,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                          '${flight.flight_num}',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey))
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.price_change,
                                                        color: Colors.grey,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('${flight.bs_price}',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Center(
                                                  child: Expanded(
                                                      child:
                                                          ElevatedButton.icon(
                                                              onPressed: () => {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      new MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              BookFlight(
                                                                                flight,
                                                                              )),
                                                                    )
                                                                  },
                                                              icon: Icon(
                                                                Icons.more,
                                                                size: 20,
                                                              ),
                                                              label: Text(
                                                                  'Book Now'),
                                                              style: ElevatedButton.styleFrom(
                                                                  primary:
                                                                      Color.fromARGB(
                                                                          255,
                                                                          14,
                                                                          98,
                                                                          167),
                                                                  onPrimary:
                                                                      Colors
                                                                          .white,
                                                                  shape:
                                                                      StadiumBorder(),
                                                                  side: BorderSide(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          14,
                                                                          98,
                                                                          167))))))
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            )))
                          ]);
                        },
                      ),
                    )
                  ],
                )));
  }

  Widget _goBackButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[350]),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        });
  }
}

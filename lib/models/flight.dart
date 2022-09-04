import '../models/city.dart';
import './origen_airport.dart';

class Flight {
  int id,
      flight_num,
      origin_city,
      destination_city,
      departure_air_id,
      origin_air_id,
      departure_gate_id,
      origin_gate_id;
  int bs_price, ec_price;
  // DateTime flight_date;
  String flight_img;
  City city;
  OrigenAirport origenairport;

  Flight({
    required this.id,
    required this.flight_num,
    required this.origin_city,
    required this.destination_city,
    required this.departure_air_id,
    required this.origin_air_id,
    required this.departure_gate_id,
    required this.origin_gate_id,
    required this.bs_price,
    required this.ec_price,
    // required this.flight_date,
    required this.flight_img,
    required this.city,
    required this.origenairport,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
        id: json['id'],
        flight_num: json['flight_num'],
        origin_city: json['origin_city'],
        ec_price: json['ec_price'],
        bs_price: json['bs_price'],
        destination_city: json['dastination_city'],
        departure_air_id: json['departure_air_id'],
        origin_air_id: json['origin_air_id'],
        departure_gate_id: json['departure_gate_id'],
        origin_gate_id: json['origin_gate_id'],
        //  flight_date: json['flight_date'],
        flight_img: json['flight_img'],
        city: City(
          name: json['city']['city_name'],
        ),
        origenairport: OrigenAirport(name: json['origin_air']['airport_name']));
  }
}

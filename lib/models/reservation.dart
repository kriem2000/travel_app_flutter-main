import 'Flight.dart';

class Reservation {
  int id, flight_id, user_id, status_id, class_id, seat_id;
  String booking_date;
  bool canceled, pre_booking;

  Reservation({
    required this.id,
    required this.flight_id,
    required this.user_id,
    required this.status_id,
    required this.class_id,
    required this.seat_id,
    required this.booking_date,
    required this.canceled,
    required this.pre_booking,
  });
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      flight_id: json['flight_id'],
      user_id: json['user_id'],
      status_id: json['status_id'],
      class_id: json['class_id'],
      seat_id: json['seat_id'],
      booking_date: json['booking_date'],
      canceled: json['canceled'],
      pre_booking: json['pre_booking'],
    );
  }
}

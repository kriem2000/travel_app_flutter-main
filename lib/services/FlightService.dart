import '../models/Flight.dart';
import '../network/api.dart';
import 'dart:convert';

import '../network/apiResponse.dart';

class FlightService {
  static String baseUrl = "/allFlights";

  // get all posts
  Future<ApiResponse> getFlights() async {
    ApiResponse apiResponse = ApiResponse();
    final response = await Network().getData(baseUrl);
    print(response.body);
    apiResponse.data = jsonDecode(response.body)['flights']
        .map((f) => Flight.fromJson(f))
        .toList();
    // we get list of posts, so we need to map each item to post model
    apiResponse.data as List<dynamic>;
    return apiResponse;
  }
}

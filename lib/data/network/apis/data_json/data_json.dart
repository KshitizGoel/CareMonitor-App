import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlightDetails{

  Future<dynamic> getFlightDetails() async {
    final String response = await rootBundle.loadString('assets/flight_details/flight_details.json');
    final data = await json.decode(response);
    return data;

  }

}
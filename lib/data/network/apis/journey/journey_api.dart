import 'package:boilerplate/models/flight_history/history.dart';
import 'package:boilerplate/models/flight_history/history_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@injectable
@singleton
class HistoryApi {
  late HistoryList flightHistory;

  final databaseRef = FirebaseDatabase.instance
      .reference()
      .child("flight_history"); //database reference object

  Future<dynamic> getFlightHistory() async {
    // Demonstrates configuring the database directly

    return await databaseRef.once().then((DataSnapshot snapshot) {
      print('Flight History Details : ${snapshot.value}');

      return snapshot.value;
    });
  }

  //===========================================================================

  final databaseRefDetails = FirebaseDatabase.instance
      .reference()
      .child("flight_details"); //database reference object

  Future<dynamic> getFlightDetails() async {
    // Demonstrates configuring the database directly

    return await databaseRefDetails.once().then((DataSnapshot snapshot) {
      return snapshot.value;
    });
  }
}

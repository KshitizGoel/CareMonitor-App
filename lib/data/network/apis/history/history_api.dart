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

  Future<HistoryList> getFlightHistory() async {
    // Demonstrates configuring the database directly

    return await databaseRef.once().then((DataSnapshot snapshot) {
      print('Flight History Details : ${snapshot.value}');

      return HistoryList.fromJson(snapshot.value);
    });
  }


  final databaseRefDetails = FirebaseDatabase.instance
      .reference()
      .child("flight_details"); //database reference object

  void getFlightDetailsData() {
    // Demonstrates configuring the database directly
    databaseRefDetails.once().then((DataSnapshot snapshot) {
      print('Available Flight Details : ${snapshot.value}');
    });
  }
}


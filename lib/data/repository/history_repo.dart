import 'package:boilerplate/data/local/datasources/details/journey_datasource.dart';
import 'package:boilerplate/data/network/apis/journey/journey_api.dart';

class HistoryRepo {
  // data source object
  final JourneyDatasource _journeyDatasource;

  // api objects
  final HistoryApi _historyApi;

  // constructor
  HistoryRepo(this._historyApi, this._journeyDatasource);

  Future<dynamic> gettingFlightHistory() async {
    int count = await _journeyDatasource.count();

    print("Here is bookings Count " + count.toString());

    return await _historyApi.getFlightHistory().then((value) {
      return value;
    }).catchError((onError) {
      print("Getting error in History Repo");
      throw onError;
    });
  }

  Future<dynamic> gettingFlightDetails() async {
    return await _historyApi.getFlightDetails().then((value) {
      return value;
    }).catchError((onError) {
      print("Getting error in History Repo");
      throw onError;
    });
  }
}

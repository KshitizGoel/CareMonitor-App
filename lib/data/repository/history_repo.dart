import 'package:boilerplate/data/local/datasources/post/post_datasource.dart';
import 'package:boilerplate/data/network/apis/data_json/data_json.dart';
import 'package:boilerplate/data/network/apis/history/history_api.dart';
import 'package:boilerplate/models/flight_history/history_list.dart';

class HistoryRepo {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final HistoryApi _historyApi;

  final FlightDetails _flightDetails;

  // constructor
  HistoryRepo(this._historyApi, this._flightDetails , this._postDataSource);

  Future<HistoryList> gettingFlightHistory() async {
    return await _historyApi.getFlightHistory().then((value) {
      return value;
    }).catchError((onError) {
      print("Getting error in History Repo");
      throw onError;
    });
  }

  Future<dynamic> gettingFlightDetails() async{
    return await _flightDetails.getFlightDetails().then((value) {
      return value;
    }).catchError((onError){
      print("Getting error in History Repo");
      throw onError;
    });
  }

}

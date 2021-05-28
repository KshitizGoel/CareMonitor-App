import 'package:boilerplate/data/local/datasources/post/post_datasource.dart';
import 'package:boilerplate/data/network/apis/journey/journey_api.dart';

class HistoryRepo {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final HistoryApi _historyApi;

  // constructor
  HistoryRepo(this._historyApi, this._postDataSource);

  Future<dynamic> gettingFlightHistory() async {
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

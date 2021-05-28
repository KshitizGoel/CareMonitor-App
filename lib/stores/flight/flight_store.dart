import 'package:boilerplate/data/repository/history_repo.dart';
import 'package:boilerplate/models/flight_history/history_list.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'flight_store.g.dart';

@Injectable()
class FlightStore = _FlightStore with _$FlightStore;

abstract class _FlightStore with Store {
  // repository instance
  late HistoryRepo _historyRepo;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _FlightStore(HistoryRepo _historyRepo) : this._historyRepo = _historyRepo;

  @observable
  HistoryList? history;

  @observable
  List? flightDetails;

  @action
  Future getFlightHistory() async {
    return _historyRepo.gettingFlightHistory().then((value) {
      print("Executing the History function in store");
      history = value;
    }).catchError((onError) {
      print("Getting the error in History Store");
      throw onError;
    });
  }

  @action
  Future getFlightDetails() async{
    return _historyRepo.gettingFlightDetails().then((value) {
      flightDetails = value["flight_details"];
      print(flightDetails);
    }).catchError((onError){
      print("Getting the error in History Store");
      throw onError;
    });
  }
}

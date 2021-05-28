import 'package:boilerplate/models/flight_history/history.dart';

class HistoryList {
  final List<History?> historyList;

  HistoryList({
    required this.historyList,
  });

  factory HistoryList.fromJson(List<dynamic> json) {
    List<History> historyList = <History>[];
    historyList = json.map((a) => History.fromMap(a)).toList();

    return HistoryList(
      historyList: historyList,
    );
  }
}

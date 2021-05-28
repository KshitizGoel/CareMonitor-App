// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlightStore on _FlightStore, Store {
  final _$historyAtom = Atom(name: '_FlightStore.history');

  @override
  List<dynamic>? get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(List<dynamic>? value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  final _$flightDetailsAtom = Atom(name: '_FlightStore.flightDetails');

  @override
  List<dynamic>? get flightDetails {
    _$flightDetailsAtom.reportRead();
    return super.flightDetails;
  }

  @override
  set flightDetails(List<dynamic>? value) {
    _$flightDetailsAtom.reportWrite(value, super.flightDetails, () {
      super.flightDetails = value;
    });
  }

  final _$getFlightHistoryAsyncAction =
      AsyncAction('_FlightStore.getFlightHistory');

  @override
  Future<dynamic> getFlightHistory() {
    return _$getFlightHistoryAsyncAction.run(() => super.getFlightHistory());
  }

  final _$getFlightDetailsAsyncAction =
      AsyncAction('_FlightStore.getFlightDetails');

  @override
  Future<dynamic> getFlightDetails() {
    return _$getFlightDetailsAsyncAction.run(() => super.getFlightDetails());
  }

  @override
  String toString() {
    return '''
history: ${history},
flightDetails: ${flightDetails}
    ''';
  }
}

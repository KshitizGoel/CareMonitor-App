// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sembast/sembast.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../data/local/datasources/details/journey_datasource.dart' as _i9;
import '../../data/local/datasources/post/post_datasource.dart' as _i15;
import '../../data/network/apis/journey/journey_api.dart' as _i6;
import '../../data/network/apis/posts/post_api.dart' as _i14;
import '../../data/network/dio_client.dart' as _i20;
import '../../data/network/rest_client.dart' as _i19;
import '../../data/repository.dart' as _i13;
import '../../data/repository/history_repo.dart' as _i8;
import '../../data/sharedpref/shared_preference_helper.dart' as _i11;
import '../../stores/error/error_store.dart' as _i4;
import '../../stores/flight/flight_store.dart' as _i12;
import '../../stores/form/form_store.dart' as _i5;
import '../../stores/language/language_store.dart' as _i17;
import '../../stores/post/post_store.dart' as _i18;
import '../../stores/user/user_store.dart' as _i16;
import '../module/local_module.dart' as _i21;
import '../module/network_module.dart'
    as _i22; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final localModule = _$LocalModule();
  final networkModule = _$NetworkModule();
  await gh.factoryAsync<_i3.Database>(() => localModule.provideDatabase(),
      preResolve: true);
  gh.factory<_i4.ErrorStore>(() => _i4.ErrorStore());
  gh.factory<_i5.FormStore>(() => _i5.FormStore());
  gh.factory<_i6.HistoryApi>(() => _i6.HistoryApi());
  await gh.factoryAsync<_i7.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  gh.factory<_i8.HistoryRepo>(() => localModule.provideHistoryRepository(
      get<_i6.HistoryApi>(), get<_i9.JourneyDatasource>()));
  gh.factory<_i10.Dio>(
      () => networkModule.provideDio(get<_i11.SharedPreferenceHelper>()));
  gh.factory<_i12.FlightStore>(() => _i12.FlightStore(get<_i8.HistoryRepo>()));
  gh.factory<_i13.Repository>(() => localModule.provideRepository(
      get<_i14.PostApi>(),
      get<_i11.SharedPreferenceHelper>(),
      get<_i15.PostDataSource>()));
  gh.factory<_i16.UserStore>(() => _i16.UserStore(get<_i13.Repository>()));
  gh.factory<_i17.LanguageStore>(
      () => _i17.LanguageStore(get<_i13.Repository>()));
  gh.factory<_i18.PostStore>(() => _i18.PostStore(get<_i13.Repository>()));
  gh.singleton<_i9.JourneyDatasource>(
      _i9.JourneyDatasource(get<_i3.Database>()));
  gh.singleton<_i15.PostDataSource>(_i15.PostDataSource(get<_i3.Database>()));
  gh.singleton<_i19.RestClient>(_i19.RestClient());
  gh.singleton<_i11.SharedPreferenceHelper>(
      _i11.SharedPreferenceHelper(get<_i7.SharedPreferences>()));
  gh.singleton<_i20.DioClient>(_i20.DioClient(get<_i10.Dio>()));
  gh.singleton<_i14.PostApi>(
      _i14.PostApi(get<_i20.DioClient>(), get<_i19.RestClient>()));
  return get;
}

class _$LocalModule extends _i21.LocalModule {}

class _$NetworkModule extends _i22.NetworkModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sembast/sembast.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../data/local/datasources/post/post_datasource.dart' as _i10;
import '../../data/network/apis/data_json/data_json.dart' as _i5;
import '../../data/network/apis/history/history_api.dart' as _i7;
import '../../data/network/apis/posts/post_api.dart' as _i15;
import '../../data/network/dio_client.dart' as _i21;
import '../../data/network/rest_client.dart' as _i20;
import '../../data/repository.dart' as _i14;
import '../../data/repository/history_repo.dart' as _i9;
import '../../data/sharedpref/shared_preference_helper.dart' as _i12;
import '../../stores/error/error_store.dart' as _i4;
import '../../stores/flight/flight_store.dart' as _i13;
import '../../stores/form/form_store.dart' as _i6;
import '../../stores/language/language_store.dart' as _i18;
import '../../stores/post/post_store.dart' as _i19;
import '../../stores/theme/theme_store.dart' as _i16;
import '../../stores/user/user_store.dart' as _i17;
import '../module/local_module.dart' as _i22;
import '../module/network_module.dart'
    as _i23; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i5.FlightDetails>(() => _i5.FlightDetails());
  gh.factory<_i6.FormStore>(() => _i6.FormStore());
  gh.factory<_i7.HistoryApi>(() => _i7.HistoryApi());
  await gh.factoryAsync<_i8.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  gh.factory<_i9.HistoryRepo>(() => localModule.provideHistoryRepository(
      get<_i7.HistoryApi>(),
      get<_i5.FlightDetails>(),
      get<_i10.PostDataSource>()));
  gh.factory<_i11.Dio>(
      () => networkModule.provideDio(get<_i12.SharedPreferenceHelper>()));
  gh.factory<_i13.FlightStore>(() => _i13.FlightStore(get<_i9.HistoryRepo>()));
  gh.factory<_i14.Repository>(() => localModule.provideRepository(
      get<_i15.PostApi>(),
      get<_i12.SharedPreferenceHelper>(),
      get<_i10.PostDataSource>()));
  gh.factory<_i16.ThemeStore>(() => _i16.ThemeStore(get<_i14.Repository>()));
  gh.factory<_i17.UserStore>(() => _i17.UserStore(get<_i14.Repository>()));
  gh.factory<_i18.LanguageStore>(
      () => _i18.LanguageStore(get<_i14.Repository>()));
  gh.factory<_i19.PostStore>(() => _i19.PostStore(get<_i14.Repository>()));
  gh.singleton<_i10.PostDataSource>(_i10.PostDataSource(get<_i3.Database>()));
  gh.singleton<_i20.RestClient>(_i20.RestClient());
  gh.singleton<_i12.SharedPreferenceHelper>(
      _i12.SharedPreferenceHelper(get<_i8.SharedPreferences>()));
  gh.singleton<_i21.DioClient>(_i21.DioClient(get<_i11.Dio>()));
  gh.singleton<_i15.PostApi>(
      _i15.PostApi(get<_i21.DioClient>(), get<_i20.RestClient>()));
  return get;
}

class _$LocalModule extends _i22.LocalModule {}

class _$NetworkModule extends _i23.NetworkModule {}

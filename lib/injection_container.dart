import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes_app/core/api/api_consumer.dart';
import 'package:quotes_app/core/api/dio_consumer.dart';
import 'package:quotes_app/core/network/network_info.dart';
import 'package:quotes_app/features/random_quote/data/datasources/random_quote_local_dat_source.dart';
import 'package:quotes_app/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quotes_app/features/random_quote/data/repositories/qoute_repository_impl.dart';
import 'package:quotes_app/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quotes_app/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:quotes_app/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:quotes_app/features/splash/data/repositories/lang_repository_impl.dart';
import 'package:quotes_app/features/splash/domain/usecases/change_lang.dart';
import 'package:quotes_app/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:quotes_app/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/app_interceptors.dart';
import 'features/splash/domain/repositories/lang_repository.dart';

GetIt sl = GetIt.instance;
Future<void> initSL() async {
//! Features
//Bloc
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  sl.registerFactory(
      () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));
//Use Cases
  sl.registerLazySingleton<GetRandomQuoteUseCase>(
      () => GetRandomQuoteUseCase(quoteRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
      () => ChangeLangUseCase(langRepository: sl()));
//Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl()));
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataSource: sl()));
//Data Source
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<LangLocalDataSource>(
      () => LangLocalDataSourceImpl(sharedPreferences: sl()));
//! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
//! External
  sl.registerLazySingleton(() => http.Client());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppIntercepters());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}

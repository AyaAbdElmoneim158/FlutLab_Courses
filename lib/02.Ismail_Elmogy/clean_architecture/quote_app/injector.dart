import 'package:dio/dio.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/network/netwok_info.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/data/datasources/local_data_source.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/data/datasources/remote_data_source.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/data/repositories/quote_repo_impl.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/repositories/quote_repo.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/usecases/get_random_quote_usecase.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<RandomQuoteCubit>(
      () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  // sl.registerFactory<LocaleCubit>(
  //     () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<GetRandomQuote>(
      () => GetRandomQuote(quoteRepo: sl()));
  // sl.registerLazySingleton<GetSavedLangUseCase>(
  //     () => GetSavedLangUseCase(langRepository: sl()));
  // sl.registerLazySingleton<ChangeLangUseCase>(
  //     () => ChangeLangUseCase(langRepository: sl()));

  // Repository
  sl.registerLazySingleton<QuoteRepo>(() => QuoteRepoImpl(
      networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));
  // sl.registerLazySingleton<LangRepository>(
  //     () => LangRepositoryImpl(langLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<LocalDataSource>(
  //     () => LocalDataSourceImpl(sharedPreferences: sl()));
  // sl.registerLazySingleton<LangLocalDataSource>(
  //     () => LangLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  // sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => AppIntercepters());
  // sl.registerLazySingleton(() => LogInterceptor(
  //     request: true,
  //     requestBody: true,
  //     requestHeader: true,
  //     responseBody: true,
  //     responseHeader: true,
  //     error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}

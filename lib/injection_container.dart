import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:number_trivia/core/network/network_info.dart';
import 'package:number_trivia/core/util/input_converter.dart';
import 'package:number_trivia/feature/numbers_trivia/data/dataSources/number_trivia_remote_dataSource.dart';
import 'package:number_trivia/feature/numbers_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:number_trivia/feature/numbers_trivia/domain/usecases/get_specific_number_trivia.dart';
import 'package:number_trivia/feature/numbers_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'feature/numbers_trivia/data/dataSources/number_trivia_local_dataSource.dart';
import 'feature/numbers_trivia/domain/repositories/number_trivia_repository.dart';
import 'feature/numbers_trivia/domain/usecases/get_random_number_trivia.dart';

final GetIt sl = GetIt.instance;

// instance called immediately as app starts
// register classes and contracts

Future<void> init() async {
  // Features - Number Trivia
  sl.registerFactory(() => NumberTriviaBloc(
      getSpecificNumberTrivia: sl(),
      getRandomNumberTrivia: sl(),
      inputConverter: sl()));
  // Use cases
  sl.registerLazySingleton(() => GetSpecificNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));
  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(() =>
      NumberTriviaRepositoryImpl(
          remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  // Data Source
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(() => NumberTriviaRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<NumberTriviaLocalDataSource>(() => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()));
  // Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
 // External
  final sharedPreference = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreference);
  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => DataConnectionChecker());
}

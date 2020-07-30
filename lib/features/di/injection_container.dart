import 'package:box_office_clean_arch/core/network/dio_client.dart';
import 'package:box_office_clean_arch/core/network/network_info.dart';
import 'package:box_office_clean_arch/core/util/input_converter.dart';
import 'package:box_office_clean_arch/features/data/datasources/popular_movies/network/popular_movie_api.dart';
import 'package:box_office_clean_arch/features/data/datasources/popular_movies/popular_movie_datasource.dart';
import 'package:box_office_clean_arch/features/data/repositories/movie_repository_impl.dart';
import 'package:box_office_clean_arch/features/domain/repositories/movie_repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

import '../secret_components.dart';

final sl = GetIt.instance;

Future<void> init() async {
//  //! Features - Number Trivia
//  // Bloc
//  sl.registerFactory(
//    () => NumberTriviaBloc(
//      concrete: sl(),
//      inputConverter: sl(),
//      random: sl(),
//    ),
////  );
//
//  // Use cases
//  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
//  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(dataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<PopularMovieDataSource>(
    () => MoviesProviderApi(sl(), sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => sl<DioClient>().dio);
  sl.registerLazySingleton(() => DioClient("https://api.themoviedb.org/3"));
  sl.registerLazySingleton(() => SecretLoader(secretPath: "secrets.json"));
  sl.registerLazySingleton(() => DataConnectionChecker());
}

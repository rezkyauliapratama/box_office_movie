import 'package:box_office_clean_arch/core/network/dio_client.dart';
import 'package:box_office_clean_arch/core/network/network_info.dart';
import 'package:box_office_clean_arch/core/util/input_converter.dart';
import 'package:box_office_clean_arch/features/data/datasources/popular_movies/network/popular_movie_api.dart';
import 'package:box_office_clean_arch/features/data/datasources/popular_movies/popular_movie_datasource.dart';
import 'package:box_office_clean_arch/features/data/repositories/movie_repository_impl.dart';
import 'package:box_office_clean_arch/features/domain/repositories/movie_repository.dart';
import 'package:box_office_clean_arch/features/domain/usecases/popular_movie_usecase.dart';
import 'package:box_office_clean_arch/features/presentation/bloc/dashboard_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => DashboardBloc(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetPopularMovieUsecase(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(dataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<PopularMovieDataSource>(
    () => MoviesProviderApi(sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => sl<DioClient>().dio);
  sl.registerLazySingleton(() => DioClient("https://api.themoviedb.org/3"));
  sl.registerLazySingleton(() => DataConnectionChecker());
}

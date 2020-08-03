import 'package:box_office_clean_arch/core/error/failures.dart';
import 'package:box_office_clean_arch/core/usecases/usecase.dart';
import 'package:box_office_clean_arch/features/domain/entities/movie_entity.dart';
import 'package:box_office_clean_arch/features/domain/usecases/popular_movie_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc {
  final GetPopularMovieUsecase _getPopularMovieUsecase;

  final _popularMovies = BehaviorSubject<List<MovieEntity>>();

  DashboardBloc(this._getPopularMovieUsecase);

  Function(List<MovieEntity>) get changePopularMovies =>
      _popularMovies.sink.add;

  Stream<List<MovieEntity>> get popularMovies => _popularMovies.stream;

  fetchPopularMovies() {
    _getPopularMovieUsecase
        .execute(NoParams())
        .listen((Either<Failure, List<MovieEntity>> event) {
      event.fold((error) => print("Error $error | ${error.message}"),
          (values) => _popularMovies.add(values));
    });
  }

  dispose() {
    _popularMovies.close();
  }
}

import 'package:box_office_clean_arch/core/usecases/usecase.dart';
import 'package:box_office_clean_arch/features/domain/entities/movie_entity.dart';
import 'package:box_office_clean_arch/features/domain/usecases/popular_movie_usecase.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc {
  final GetPopularMovieUsecase _getPopularMovieUsecase;

  final _popularMovies = BehaviorSubject<List<MovieEntity>>();

  DashboardBloc(this._getPopularMovieUsecase);

  Function(List<MovieEntity>) get changePopularMovies =>
      _popularMovies.sink.add;

  Stream<List<MovieEntity>> get popularMovies => _popularMovies.stream;

  fetchPopularMovies() async {
    final popularMovies = await _getPopularMovieUsecase.execute(NoParams());
    popularMovies.fold((error) => print("Error $error"),
        (values) => _popularMovies.add(values));
  }

  dispose() {
    _popularMovies.close();
  }
}

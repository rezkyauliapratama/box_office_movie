import 'package:box_office_clean_arch/features/domain/entities/movie_entity.dart';

abstract class PopularMovieDataSource {
  Future<List<MovieEntity>> getPopularMovies();
}

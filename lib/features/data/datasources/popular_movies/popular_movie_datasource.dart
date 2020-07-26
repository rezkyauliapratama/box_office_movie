import 'package:box_office_clean_arch/features/data/models/ListMovieModel.dart';

abstract class PopularMovieDataSource {
  Future<ListMovieModel> getPopularMovies();
}

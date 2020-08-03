import 'package:box_office_clean_arch/core/util/extention_function.dart';
import 'package:box_office_clean_arch/features/data/models/movies_model.dart';
import 'package:box_office_clean_arch/features/domain/entities/movie_entity.dart';
import 'package:dio/dio.dart';

import '../popular_movie_datasource.dart';

class MoviesProviderApi implements PopularMovieDataSource {
  final Dio _dio;
  final String _urlPopularMovies = "/movie/popular";

  MoviesProviderApi(this._dio);

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    Response response = await _dio.get(_urlPopularMovies, queryParameters: {
      "api_key": "b77a9c9af1b4434dcbbacdde72879e7c",
      "language": "en-US"
    });
    ListMovieModel moviesModel = ListMovieModel.fromJson(response.data);
    return moviesModel.results
        .mapReversed((movieModel) => MovieEntity.fromMovieModel(movieModel));
  }
}

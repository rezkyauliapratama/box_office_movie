import 'package:box_office_clean_arch/core/error/exceptions.dart';
import 'package:box_office_clean_arch/core/util/extention_function.dart';
import 'package:box_office_clean_arch/features/data/models/movies_model.dart';
import 'package:box_office_clean_arch/features/domain/entities/movie_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../popular_movie_datasource.dart';

class MoviesProviderApi implements PopularMovieDataSource {
  final Dio dio;
  final String _urlPopularMovies = "/movie/popular";

  MoviesProviderApi({@required this.dio});

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    try {
      Response response = await dio.get(_urlPopularMovies,
          queryParameters: {"api_key": "b77a9c9af1b4434dcbbacdde72879e7c", "language": "en-US"});
      ListMovieModel moviesModel = ListMovieModel.fromJson(response.data);
      return moviesModel.results
          .mapReversed((movieModel) => MovieEntity.fromMovieModel(movieModel));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw ServerException();
    }
  }
}

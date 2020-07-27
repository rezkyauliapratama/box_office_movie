import 'package:box_office_clean_arch/core/error/exceptions.dart';
import 'package:box_office_clean_arch/features/data/datasources/common/secret_components.dart';
import 'package:box_office_clean_arch/features/data/models/ListMovieModel.dart';
import 'package:dio/dio.dart';

import '../popular_movie_datasource.dart';

class MoviesProviderApi implements PopularMovieDataSource {
  final Dio _dio;
  final Secret _secret;
  final String _urlPopularMovies = "/movie/popular";

  MoviesProviderApi(this._dio, this._secret);

  @override
  Future<ListMovieModel> getPopularMovies() async {
    try {
      Response response = await _dio.get(_urlPopularMovies,
          queryParameters: {"api_key": _secret.apiKey, "language": "en-US"});
      return ListMovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw ServerException();
    }
  }
}

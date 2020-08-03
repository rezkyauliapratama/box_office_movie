import 'package:box_office_clean_arch/core/error/exceptions.dart';
import 'package:box_office_clean_arch/core/error/failures.dart';
import 'package:box_office_clean_arch/features/data/datasources/popular_movies/popular_movie_datasource.dart';
import 'package:box_office_clean_arch/features/domain/entities/movie_entity.dart';
import 'package:box_office_clean_arch/features/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class MovieRepositoryImpl implements MovieRepository {
  final PopularMovieDataSource dataSource;

  MovieRepositoryImpl({@required PopularMovieDataSource dataSource})
      : dataSource = dataSource;

  @override
  Stream<Either<Failure, List<MovieEntity>>> getPopularMovie(int page) async* {
      final List<MovieEntity> popularMovies =
          await dataSource.getPopularMovies();

      yield Right(popularMovies);
  }
}

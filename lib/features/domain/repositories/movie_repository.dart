
import 'package:box_office_clean_arch/core/error/failures.dart';
import 'package:box_office_clean_arch/features/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovie(int page);

}
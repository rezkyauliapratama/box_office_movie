import 'package:box_office_clean_arch/core/error/failures.dart';
import 'package:box_office_clean_arch/core/usecases/usecase.dart';
import 'package:box_office_clean_arch/features/domain/entities/movie_entity.dart';
import 'package:box_office_clean_arch/features/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMovieUsecase implements UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetPopularMovieUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> execute(NoParams params) async {
    return await repository.getPopularMovie(1);
  }
}

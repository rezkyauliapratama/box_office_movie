import 'package:box_office_clean_arch/core/error/failures.dart';
import 'package:box_office_clean_arch/core/usecases/usecase.dart';
import 'package:box_office_clean_arch/features/data/models/movie_model.dart';
import 'package:box_office_clean_arch/features/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMovieUsecase implements UseCase<List<MovieModel>, NoParams> {
  final MovieRepository repository;

  GetPopularMovieUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieModel>>> call(NoParams params) {

  }



}
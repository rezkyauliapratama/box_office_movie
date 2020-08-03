import 'package:box_office_clean_arch/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

abstract class UseCase<Type, Params> {
  Stream<Either<Failure, Type>> build(Params params);

  Stream<Either<Failure, Type>> execute(Params params) {
    return build(params).onErrorResume((error) {
      print("error from streams : $error");
      Failure failure = CacheFailure(message: "error from stream $error");

      if (error is DioError) {
        failure = ServerFailure(message: error.message);
      }

      return Stream.value(Left(failure));
    });
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

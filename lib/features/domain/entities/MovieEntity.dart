import 'package:box_office_clean_arch/features/data/models/MovieModel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final String overview;
  final String releaseDate;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String backdropPath;
  final double popularity;
  final double voteAverage;
  final int id;
  final int voteCount;

  MovieEntity({
    @required this.posterPath,
    @required this.overview,
    @required this.releaseDate,
    @required this.originalTitle,
    @required this.originalLanguage,
    @required this.title,
    @required this.backdropPath,
    @required this.popularity,
    @required this.voteAverage,
    @required this.id,
    @required this.voteCount,
  });

  @override
  List<Object> get props => [id];

  factory MovieEntity.fromMovieModel(MovieModel movieModel) {
    return MovieEntity(
      posterPath: movieModel.posterPath,
      overview: movieModel.overview,
      releaseDate: movieModel.releaseDate,
      originalTitle: movieModel.originalTitle,
      originalLanguage: movieModel.originalLanguage,
      title: movieModel.title,
      backdropPath: movieModel.backdropPath,
      popularity: movieModel.popularity,
      voteAverage: movieModel.voteAverage,
      id: movieModel.id,
      voteCount: movieModel.voteCount,
    );
  }
}

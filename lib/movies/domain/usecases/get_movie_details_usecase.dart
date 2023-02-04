import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_with_clean_ar/core/error/failure.dart';
import 'package:movies_app_with_clean_ar/core/usecase/base_usecase.dart';
import 'package:movies_app_with_clean_ar/movies/domain/entities/movie_detail.dart';
import '../repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  BaseMoviesRepository baseMoviesRepository;


  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }

}


class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}














































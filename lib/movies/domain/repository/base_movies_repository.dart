import 'package:dartz/dartz.dart';
import 'package:movies_app_with_clean_ar/movies/data/models/movie_details_model.dart';
import 'package:movies_app_with_clean_ar/movies/domain/entities/movie_detail.dart';
import 'package:movies_app_with_clean_ar/movies/domain/entities/recommendation.dart';
import 'package:movies_app_with_clean_ar/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app_with_clean_ar/movies/domain/usecases/get_recommendation_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMoviesRepository{



  Future<Either< Failure , List<Movie> >> getNowPlayingMovies();
  Future<Either< Failure , List<Movie> >> getPopularMovies();
  Future<Either< Failure , List<Movie> >> getTopRatedMovies();
  Future<Either<Failure,MovieDetail>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(RecommendationParameters parameters);

}















































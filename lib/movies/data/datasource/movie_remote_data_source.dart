import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app_with_clean_ar/core/error/exceptions.dart';
import 'package:movies_app_with_clean_ar/core/network/api_constance.dart';
import 'package:movies_app_with_clean_ar/core/network/error_message_model.dart';
import 'package:movies_app_with_clean_ar/movies/data/models/movie_details_model.dart';
import 'package:movies_app_with_clean_ar/movies/data/models/movie_model.dart';
import 'package:movies_app_with_clean_ar/movies/data/models/recommendation_model.dart';
import 'package:movies_app_with_clean_ar/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app_with_clean_ar/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel >> getRecommendation (RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      ApiConstance.nowPlayingMoviesPath,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.formJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters)async {
    final response = await Dio().get(ApiConstance.movieRecommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List).map(
            (e) => RecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}






















































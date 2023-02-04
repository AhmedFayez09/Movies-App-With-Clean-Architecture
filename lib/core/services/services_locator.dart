import 'package:get_it/get_it.dart';
import 'package:movies_app_with_clean_ar/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app_with_clean_ar/movies/data/repository/movies_repository.dart';
import 'package:movies_app_with_clean_ar/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app_with_clean_ar/movies/domain/usecases/get_popular_usecase.dart';
import 'package:movies_app_with_clean_ar/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_app_with_clean_ar/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:movies_app_with_clean_ar/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_app_with_clean_ar/movies/presentation/controller/movies_bloc.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecases/get_now_playing_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    //// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    //// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

//// DATA SOURCE

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_clean_ar/core/usecase/base_usecase.dart';
import 'package:movies_app_with_clean_ar/core/utils/enums.dart';
import 'package:movies_app_with_clean_ar/movies/domain/usecases/get_popular_usecase.dart';
import 'package:movies_app_with_clean_ar/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:movies_app_with_clean_ar/movies/presentation/controller/movies_event.dart';
import 'package:movies_app_with_clean_ar/movies/presentation/controller/movies_state.dart';
import '../../domain/usecases/get_now_playing_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatesMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    // emit(const MoviesState(nowPlayingState: RequestState.loaded));
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          newPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    // emit(const MoviesState(popularState: RequestState.loaded));
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatesMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    // emit(const MoviesState(topRatedState: RequestState.loaded));
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(
              state.copyWith(
                topRatedState: RequestState.error,
                topRatedMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                topRatedMovies: r,
                topRatedState: RequestState.loaded,
              ),
            ));
  }
}

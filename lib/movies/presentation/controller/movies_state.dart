import 'package:equatable/equatable.dart';
import 'package:movies_app_with_clean_ar/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String newPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.topRatedMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.newPlayingMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? newPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      newPlayingMessage: newPlayingMessage ?? this.newPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMessage: popularMessage ?? this.popularMessage,
      popularState: popularState ?? this.popularState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        newPlayingMessage,
        popularState,
        popularMessage,
        popularMovies,
        topRatedState,
        topRatedMovies,
        topRatedMessage,
      ];
}

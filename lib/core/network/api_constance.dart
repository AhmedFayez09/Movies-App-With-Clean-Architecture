class ApiConstance{
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = 'b8a81078488034815aa3c3aa30027844';

  //// End Points
  static const String endPointMoviesNowPlaying = "movie/now_playing";
  static const String endPointMoviesPopular = "movie/popular";
  static const String endPointMoviesTopRated = "movie/top_rated";

  //// Paths
  static const String nowPlayingMoviesPath = "$baseUrl/$endPointMoviesNowPlaying?api_key=$apiKey";
  static const String popularMoviesPath = "$baseUrl/$endPointMoviesPopular?api_key=$apiKey";
  static const String topRatedMoviesPath = "$baseUrl/$endPointMoviesTopRated?api_key=$apiKey";
  static String movieDetailsPath(int movieId)=> '$baseUrl/movie/$movieId?api_key=$apiKey';
  static String movieRecommendationPath(int movieId)=> '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';



//// image Url
  static const String baseImageUrl ='https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path)=> '$baseImageUrl$path';




}
//https://api.themoviedb.org/3/movie/{movie_id}/recommendations?api_key=b8a81078488034815aa3c3aa30027844

























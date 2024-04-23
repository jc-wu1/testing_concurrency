import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../core/constants.dart';
import '../model/movies_response.dart';

part 'movies_remote_data_source.g.dart';

@RestApi(baseUrl: kMovieDbBaseUrl)
abstract class MoviesRemoteDataSource {
  factory MoviesRemoteDataSource(Dio dio, {String baseUrl}) =
      _MoviesRemoteDataSource;

  @GET("movie/now_playing")
  @Headers(kApiHeader)
  Future<MoviesResponse> fetchNowPlayingMovies({
    @Query("page") int page = 1,
  });

  @GET("movie/popular")
  @Headers(kApiHeader)
  Future<MoviesResponse> fetchPopularMovies({
    @Query("page") int page = 1,
  });

  @GET("movie/upcoming")
  @Headers(kApiHeader)
  Future<MoviesResponse> fetchUpcomingMovies({
    @Query("page") int page = 1,
  });
}

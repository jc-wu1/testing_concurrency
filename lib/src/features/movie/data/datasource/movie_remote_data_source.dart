// 'https://api.themoviedb.org/3/movie/758323?append_to_response=reviews&language=en-US'

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../core/constants.dart';
import '../model/movie_detail_response.dart';

part 'movie_remote_data_source.g.dart';

@RestApi(baseUrl: kMovieDbBaseUrl)
abstract class MovieRemoteDataSource {
  factory MovieRemoteDataSource(Dio dio, {String baseUrl}) =
      _MovieRemoteDataSource;

  @GET("movie/{movieId}?append_to_response=reviews&language=en-US")
  @Headers(kApiHeader)
  Future<MovieDetailResponse> fetchMovieDetails(
    @Path("movieId") int movieId,
  );
}

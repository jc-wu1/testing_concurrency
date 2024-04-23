import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/movie/data/datasource/movie_remote_data_source.dart';
import '../features/movie/data/repository/movie_repository_impl.dart';
import '../features/movie/domain/repository/movie_repository.dart';
import '../features/movie/domain/usecase/get_movie_details_usecase.dart';
import '../features/movies/data/datasource/movies_remote_data_source.dart';
import '../features/movies/data/repository/movies_repository_impl.dart';
import '../features/movies/domain/repository/movies_repository.dart';
import '../features/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import '../features/movies/domain/usecase/get_popular_movies_usecase.dart';
import '../features/movies/domain/usecase/get_upcoming_movies_usecase.dart';
import 'network/dio.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<Dio>(getDio());

  sl.registerSingleton<MoviesRemoteDataSource>(
    MoviesRemoteDataSource(sl()),
  );

  sl.registerSingleton<MovieRemoteDataSource>(
    MovieRemoteDataSource(sl()),
  );

  // REPO
  sl.registerSingleton<MoviesRepository>(
    MoviesRepositoryImpl(
      sl<MoviesRemoteDataSource>(),
    ),
  );
  sl.registerSingleton<MovieRepository>(
    MovieRepositoryImpl(
      sl<MovieRemoteDataSource>(),
    ),
  );

  // USECASE MOVIES
  sl.registerSingleton<GetNowPlayingMoviesUsecase>(
    GetNowPlayingMoviesUsecase(
      sl<MoviesRepository>(),
    ),
  );
  sl.registerSingleton<GetPopularMoviesUsecase>(
    GetPopularMoviesUsecase(
      sl<MoviesRepository>(),
    ),
  );
  sl.registerSingleton<GetUpcomingMoviesUsecase>(
    GetUpcomingMoviesUsecase(
      sl<MoviesRepository>(),
    ),
  );

  // USECASE MOVIE
  sl.registerSingleton<GetMovieDetailsUsecase>(
    GetMovieDetailsUsecase(
      sl<MovieRepository>(),
    ),
  );
}

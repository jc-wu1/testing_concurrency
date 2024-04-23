import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/movies_response.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MoviesResponse>> getNowPlayingMovies();
  Future<Either<Failure, MoviesResponse>> getUpcomingMovies();
  Future<Either<Failure, MoviesResponse>> getPopularMovies();
}

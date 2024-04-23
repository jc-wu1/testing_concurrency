import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/movie_detail_response.dart';

abstract class MovieRepository {
  Future<Either<Failure, MovieDetailResponse>> getMovieDetails(int movieId);
}

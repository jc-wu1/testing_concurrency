import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasource/movie_remote_data_source.dart';
import '../model/movie_detail_response.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, MovieDetailResponse>> getMovieDetails(
    int movieId,
  ) async {
    try {
      final movie = await remoteDataSource.fetchMovieDetails(movieId);
      return Right(movie);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

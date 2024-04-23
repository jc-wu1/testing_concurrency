import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repository/movies_repository.dart';
import '../datasource/movies_remote_data_source.dart';
import '../model/movies_response.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, MoviesResponse>> getNowPlayingMovies() async {
    try {
      final movies = await remoteDataSource.fetchNowPlayingMovies();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MoviesResponse>> getPopularMovies() async {
    try {
      final movies = await remoteDataSource.fetchPopularMovies();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MoviesResponse>> getUpcomingMovies() async {
    try {
      final movies = await remoteDataSource.fetchUpcomingMovies();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

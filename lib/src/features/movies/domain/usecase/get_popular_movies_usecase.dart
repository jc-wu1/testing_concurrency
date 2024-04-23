import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/model/movies_response.dart';
import '../repository/movies_repository.dart';

class GetPopularMoviesUsecase extends UseCase<MoviesResponse, NoParams> {
  final MoviesRepository repository;

  GetPopularMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, MoviesResponse>> call(
    NoParams params,
  ) async {
    return await repository.getPopularMovies();
  }
}

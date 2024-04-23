import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/model/movie_detail_response.dart';
import '../repository/movie_repository.dart';

class GetMovieDetailsUsecase extends UseCase<MovieDetailResponse, int> {
  final MovieRepository repository;

  GetMovieDetailsUsecase(this.repository);

  @override
  Future<Either<Failure, MovieDetailResponse>> call(
    int params,
  ) async {
    return await repository.getMovieDetails(params);
  }
}

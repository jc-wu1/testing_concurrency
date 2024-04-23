import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../data/model/movies_response.dart';
import '../../../domain/usecase/get_now_playing_movies_usecase.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc(this.getNowPlayingMovies) : super(NowPlayingState.initial()) {
    on<NowPlayingMoviesRequested>(
      _onNowPlayingMoviesRequested,
      transformer: restartable(),
    );

    on<MovieDeleted>(
      _onMovieDeleted,
      transformer: concurrent(),
    );
  }

  final GetNowPlayingMoviesUsecase getNowPlayingMovies;

  Future<void> _onNowPlayingMoviesRequested(
    NowPlayingMoviesRequested event,
    Emitter<NowPlayingState> emit,
  ) async {
    // emit(NowPlayingLoadInProgress());
    // try {
    //   final result = await getNowPlayingMovies(NoParams());
    //   result.fold(
    //     (l) => emit(
    //       NowPlayingLoadFailure(),
    //     ),
    //     (r) => emit(
    //       NowPlayingLoadComplete(r.results!),
    //     ),
    //   );
    // } catch (e) {
    //   return emit(
    //     NowPlayingLoadFailure(),
    //   );
    // }

    List<Movie>? movies;
    Object? error;
    try {
      emit(
        NowPlayingState(
          movieView: state.movieView,
          pendingDeletions: state.pendingDeletions,
          isLoading: true,
        ),
      );
      final result = await getNowPlayingMovies(NoParams());
      result.fold(
        (l) => movies = <Movie>[],
        (r) => movies = r.results,
      );
    } catch (e) {
      error = e;
    } finally {
      emit(
        NowPlayingState(
          movieView: movies ?? state.movieView,
          pendingDeletions: state.pendingDeletions,
          isLoading: false,
          error: error,
        ),
      );
    }
  }

  FutureOr<void> _onMovieDeleted(
    MovieDeleted event,
    Emitter<NowPlayingState> emit,
  ) async {
    if (state.pendingDeletions.contains(event.movieId)) {
      return;
    }
    emit(
      NowPlayingState(
        movieView: state.movieView,
        isLoading: state.isLoading,
        pendingDeletions: {
          ...state.pendingDeletions,
          event.movieId,
        },
      ),
    );
    try {
      // await fileRepo.deleteFile(id: event.fileId);
      await Future.delayed(const Duration(seconds: 10), () {});
      emit(
        NowPlayingState(
          isLoading: state.isLoading,
          movieView: [...state.movieView]..removeWhere(
              (element) => element.id == event.movieId,
            ),
          pendingDeletions: {
            ...state.pendingDeletions,
          }..remove(event.movieId),
        ),
      );
    } catch (e) {
      emit(
        NowPlayingState(
          isLoading: state.isLoading,
          movieView: state.movieView,
          pendingDeletions: {
            ...state.pendingDeletions,
          }..remove(event.movieId),
          error: e,
        ),
      );
    }
  }
}

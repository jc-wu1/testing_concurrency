part of 'now_playing_bloc.dart';

// abstract class NowPlayingState extends Equatable {
//   const NowPlayingState();

//   @override
//   List<Object> get props => [];
// }

// class NowPlayingInitial extends NowPlayingState {}

// class NowPlayingLoadInProgress extends NowPlayingState {}

// class NowPlayingLoadComplete extends NowPlayingState {
//   final List<Movie> movies;

//   const NowPlayingLoadComplete(this.movies);

//   @override
//   List<Object> get props => [movies];
// }

// class NowPlayingLoadFailure extends NowPlayingState {}

class NowPlayingState extends Equatable {
  NowPlayingState({
    required this.movieView,
    this.error,
    required this.isLoading,
    required this.pendingDeletions,
  });

  NowPlayingState.initial()
      : this(
          movieView: <Movie>[],
          isLoading: false,
          pendingDeletions: {},
        );

  final List<Movie> movieView;
  late final List<Movie> movies = movieView;
  final Set<int> pendingDeletions;
  final bool isLoading;
  final Object? error;

  @override
  List<Object?> get props => [
        movieView,
        movies,
        pendingDeletions,
        isLoading,
        error,
      ];
}

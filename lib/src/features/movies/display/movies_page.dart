import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_concurrency/src/features/movies/display/bloc/now_playing/now_playing_bloc.dart';

import '../../../core/injector.dart';
import '../domain/usecase/get_now_playing_movies_usecase.dart';
import 'bloc/blocs.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingBloc(
        sl<GetNowPlayingMoviesUsecase>(),
      )..add(
          const NowPlayingMoviesRequested(),
        ),
      child: const MoviesView(),
    );
  }
}

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  Completer<void> reloadFiles = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NowPlayingBloc, NowPlayingState>(
        listenWhen: (previous, current) =>
            previous.isLoading && !current.isLoading,
        listener: (context, state) {
          if (!reloadFiles.isCompleted) reloadFiles.complete();

          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error.toString(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () {
              reloadFiles = Completer();
              BlocProvider.of<NowPlayingBloc>(context).add(
                const NowPlayingMoviesRequested(),
              );
              return reloadFiles.future;
            },
            child: ListView.builder(
              primary: true,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListTile(
                  key: ValueKey(movie.id),
                  title: Text(movie.title ?? '-'),
                  trailing: DeleteAction(
                    onTap: () async {
                      if (state.pendingDeletions.contains(movie.id)) return;
                      BlocProvider.of<NowPlayingBloc>(context).add(
                        MovieDeleted(movieId: movie.id ?? 0),
                      );
                    },
                    isLoading: state.pendingDeletions.contains(movie.id),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DeleteAction extends StatelessWidget {
  const DeleteAction({
    super.key,
    required this.onTap,
    this.isLoading = false,
  });

  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: onTap,
      icon: isLoading
          ? CircularProgressIndicator(color: theme.colorScheme.error)
          : const Icon(Icons.delete),
    );
  }
}

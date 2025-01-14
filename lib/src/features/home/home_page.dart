import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../movies/display/movies_page.dart';
import '../profile/profile_page.dart';
import '../tvs/tvs_page.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          MoviesPage(),
          TvsPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff212121),
        surfaceTintColor: const Color(0xff212121),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.movies,
              icon: const Icon(
                Icons.movie_filter_outlined,
              ),
              tooltip: 'Movies',
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.tvs,
              icon: const Icon(
                Icons.tv,
              ),
              tooltip: 'TVs',
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.profile,
              icon: const Icon(
                Icons.person_outlined,
              ),
              tooltip: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
    this.tooltip,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      iconSize: 32,
      color: groupValue != value ? Colors.white : Colors.indigo,
      icon: icon,
      tooltip: tooltip,
    );
  }
}

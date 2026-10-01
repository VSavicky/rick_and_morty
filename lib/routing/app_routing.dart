import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/presentation/screens/card/card_screen.dart';
import 'package:rick_and_morty/core/presentation/screens/favorites/favorites_screen.dart';
import 'package:rick_and_morty/core/presentation/screens/home/home_screen.dart';
import 'package:rick_and_morty/core/presentation/screens/root/root_screen.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    // BottomNavigationBar
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          RootScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'card',
                  builder: (context, state) => const CardScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

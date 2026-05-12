import 'package:dat216_projekt/pages/pages.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/', builder: (context, state) => const Home()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/browse',
              builder: (context, state) => const Browse(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const Profile(),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return BaseView(navigationShell: navigationShell);
      },
    ),
  ],
);

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/boards/presentation/board_screen.dart';
import '../../features/activities/presentation/activity_screen.dart';
// Import your Dashboard screen here later

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(), // Replace with actual Dashboard
      ),
      GoRoute(
        path: '/board/:boardName/:boardId',
        builder: (context, state) {
          final boardId = state.pathParameters['boardId']!;
          final boardName = state.pathParameters['boardName']!;

          return BoardScreen(boardId: boardId,boardName: boardName);
        }
      ),
      GoRoute(
        path: '/activity/:activityId',
        builder: (context, state) {
          final activityId = state.pathParameters['activityId']!;

          return ActivityScreen(activityId: activityId);
        }
      )
    ],
  );
}
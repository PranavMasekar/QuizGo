import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_go/locator.dart';
import 'package:quiz_go/presentation/export_presentation.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          final isAuthenticated =
              locator.get<FirebaseAuth>().currentUser != null;
          if (!isAuthenticated) {
            return const LoginScreen();
          } else {
            return const HomePage();
          }
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/quiz',
        builder: (context, state) {
          final data = state.extra as Map;
          return QuizPage(category: data['category'], id: data['id']);
        },
      ),
      GoRoute(
        path: '/score_page',
        builder: (context, state) {
          return const ScorePage();
        },
      ),
    ],
  );
}

import 'package:go_router/go_router.dart';
import 'package:quiz_go/presentation/export_presentation.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: "/login",
    routes: [
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
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_go/common/export_common.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BackGround(child: Container());
        },
      ),
    ],
  );
}

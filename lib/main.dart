import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_go/blocs/auth_bloc/auth_bloc.dart';
import 'package:quiz_go/router/export_router.dart';

import 'constants/export_constants.dart';
import 'firebase_options.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 840),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => locator.get<AuthBloc>()),
          ],
          child: MaterialApp.router(
            title: 'QuizGo',
            debugShowCheckedModeBanner: false,
            theme: darkTheme(),
            routerConfig: locator.get<AppRouter>().router,
          ),
        );
      },
    );
  }
}

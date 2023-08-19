import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_go/blocs/export_bloc.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/firebase_options.dart';
import 'package:quiz_go/locator.dart';
import 'package:quiz_go/router/export_router.dart';

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
            BlocProvider(create: (context) => locator.get<PasswordCubit>()),
            BlocProvider(create: (context) => locator.get<QuizBloc>()),
            BlocProvider(create: (context) => locator.get<ScoreCubit>()),
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

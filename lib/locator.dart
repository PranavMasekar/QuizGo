import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_go/blocs/auth_bloc/auth_bloc.dart';
import 'package:quiz_go/router/export_router.dart';
import 'package:quiz_go/services/export_services.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //! Singletons
  locator.registerLazySingleton(() => AppRouter());
  locator.registerLazySingleton(
    () => AuthService(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ),
  );

  //! Blocs
  locator.registerFactory(() => AuthBloc(service: locator()));
}

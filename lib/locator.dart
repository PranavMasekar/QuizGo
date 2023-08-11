import 'package:get_it/get_it.dart';
import 'package:quiz_go/router/export_router.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton(() => AppRouter());
}

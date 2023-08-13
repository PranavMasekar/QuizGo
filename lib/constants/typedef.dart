import 'package:fpdart/fpdart.dart';

import 'export_constants.dart';

typedef AppEither<T> = Either<AppError, T>;
typedef FutureAppEither<T> = Future<AppEither<T>>;

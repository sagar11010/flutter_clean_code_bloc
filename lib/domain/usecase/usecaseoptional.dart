import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class UseCaseOptional<Type> {
  Future<Either<AppError, Type>> call();
}

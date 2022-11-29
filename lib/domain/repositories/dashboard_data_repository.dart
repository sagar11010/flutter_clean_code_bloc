import 'package:dartz/dartz.dart';
import 'package:clean_code_structure/data/models/maindata_model.dart';

import '../entities/app_error.dart';

abstract class DashboardDataRepository {
  Future<Either<AppError, MainData>> getDashboardData();
}

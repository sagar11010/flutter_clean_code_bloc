import 'package:dartz/dartz.dart';
import 'package:clean_code_structure/data/data_sources/dashboard_local_data_source.dart';
import 'package:clean_code_structure/data/models/maindata_model.dart';
import 'package:clean_code_structure/domain/entities/app_error.dart';
import 'package:clean_code_structure/domain/repositories/dashboard_data_repository.dart';

class DashboardDataRepositoryImpl extends DashboardDataRepository {
  final DashboardLocalDataSource dashboardLocalDataSource;

  DashboardDataRepositoryImpl({required this.dashboardLocalDataSource});

  @override
  Future<Either<AppError, MainData>> getDashboardData() async {
    try {

      final response = await dashboardLocalDataSource.getDashboardData();
      return Right(response);
    } catch (e) {
      return Left(AppError(AppErrorType.localDatabase));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:clean_code_structure/data/models/maindata_model.dart';
import 'package:clean_code_structure/domain/entities/app_error.dart';
import 'package:clean_code_structure/domain/entities/login_request_params.dart';
import 'package:clean_code_structure/domain/repositories/dashboard_data_repository.dart';
import 'package:clean_code_structure/domain/usecase/usecase.dart';
import 'package:clean_code_structure/domain/usecase/usecaseoptional.dart';

class DashboardFetch extends UseCaseOptional<MainData> {
  final DashboardDataRepository dashboardDataRepository;

  DashboardFetch({required this.dashboardDataRepository});

  @override
  Future<Either<AppError, MainData>> call() async =>
      dashboardDataRepository.getDashboardData();
}

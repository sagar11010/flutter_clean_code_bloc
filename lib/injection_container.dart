import 'package:get_it/get_it.dart';
import 'package:clean_code_structure/data/data_sources/dashboard_local_data_source.dart';
import 'package:clean_code_structure/data/repositories/dashboard_data_repository_impl.dart';
import 'package:clean_code_structure/domain/repositories/dashboard_data_repository.dart';
import 'package:clean_code_structure/domain/usecase/dashboard_fetch/dashboard_fetch.dart';
import 'package:clean_code_structure/features/dashboard/presentation/blocs/dashboard_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<DashboardLocalDataSource>(
    () => DashboardLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<DashboardDataRepository>(
    () => DashboardDataRepositoryImpl(dashboardLocalDataSource: sl()),
  );

  sl.registerFactory<DashboardBloc>(
    () => DashboardBloc(dashboardFetch: sl()),
  );
  sl.registerLazySingleton<DashboardFetch>(
      () => DashboardFetch(dashboardDataRepository: sl()));
}

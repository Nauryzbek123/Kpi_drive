import 'package:get_it/get_it.dart';
import 'package:kpi_drive/src/feautures/screens/home/logic/data/datasource/datasource.dart';
import 'package:kpi_drive/src/feautures/screens/home/logic/data/repository/repository.dart';

import '../../feautures/screens/home/logic/bloc/board_bloc.dart';

final getIt = GetIt.instance;

void initGetIt() async {
  getIt.registerFactory<BoardBloc>(() => BoardBloc(getIt()));
  getIt
      .registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt()));
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
}

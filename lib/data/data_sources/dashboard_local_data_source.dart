import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:clean_code_structure/data/models/maindata_model.dart';
import 'package:clean_code_structure/shared/constants/assets_paths.dart';

abstract class DashboardLocalDataSource {
  Future<MainData> getDashboardData();
}

class DashboardLocalDataSourceImpl extends DashboardLocalDataSource {
  @override
  Future<MainData> getDashboardData() async {
    final String response =
        await rootBundle.loadString(AssetsPath.maindataPath);
    final data = await json.decode(response);
    MainData mainData = MainData.fromJson(data);
    return mainData;
  }
}

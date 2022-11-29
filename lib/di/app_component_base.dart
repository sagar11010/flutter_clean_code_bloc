import 'dart:async';

import 'package:clean_code_structure/shared/utils/network_manager.dart';


class AppComponentBase {
  final NetworkManager _networkManager = NetworkManager();
  final StreamController<bool> _progressDialogStreamController =
  StreamController.broadcast();

  Stream<bool?> get progressDialogStream =>
      _progressDialogStreamController.stream;

  AppComponentBase._privateConstructor();

  static final AppComponentBase instance =
  AppComponentBase._privateConstructor();

  Future<void> init() async {
    await _networkManager.initialiseNetworkManager();
//    await SharedPreference.instance.initPreference();
  }

  void showProgressDialog() => _progressDialogStreamController.sink.add(true);

  void hideProgressDialog() => _progressDialogStreamController.sink.add(false);

  void dispose() {
    _progressDialogStreamController.close();
    _networkManager.disposeStream();
  }

/*
  SharedPreference get sharedPreference => SharedPreference.instance;
*/

  NetworkManager get networkManage => _networkManager;

//  APIProvider get apiProvider => getIt.get<APIProvider>();
}
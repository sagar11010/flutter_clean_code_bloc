import 'package:flutter/foundation.dart';

///[Logger] is use for log msg
class Logger {
  static prints(dynamic msg) {
    if (kDebugMode) {
      print(msg);
    }
  }
}

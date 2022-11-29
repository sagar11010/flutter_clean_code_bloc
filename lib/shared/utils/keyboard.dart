import 'package:flutter/cupertino.dart';

///[KeyboardUtil] class is use for close keyboard
class KeyboardUtil {
 static void onCloseKeyboard() {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
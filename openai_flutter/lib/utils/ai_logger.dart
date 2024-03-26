import 'dart:developer' as dev;

///log工具
class AILogger {
  static bool _isEnable = true;

  static set isEnable(bool value){
    _isEnable = value;
  }

  static void log(String msg){
    if(!_isEnable)return;
    dev.log(msg, name: 'AILogger');
  }
}
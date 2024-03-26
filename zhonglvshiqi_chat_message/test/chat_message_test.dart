import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zhonglvshiqi_chat_message/util/wechat_data_format.dart';

void main() {
  test('wechat date format', () {
    debugPrint(WechatDateFormat.format(1614547360000).toString());
    debugPrint(WechatDateFormat.format(1614887360000).toString());
  });
}

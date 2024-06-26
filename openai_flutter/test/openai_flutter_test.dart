import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openai_flutter/core/ai_completions.dart';
import 'package:openai_flutter/http/ai_config.dart';

///开发者API key，从https://platform.openai.com/account/api-keys 上获取
const apiKey = '';

///注意：1、使用电脑的IP地址，不要用127.0.0.1（在Android上会被识别成Android设备的本地机）
///2、如果使用 clashx 需要开启Allow connect from Lan，否则会：Connection refused
const proxy = '192.168.3.25:15732';

void main() {
  test('test createChat', () async {
    AIConfigBuilder.init(apiKey, proxy: proxy);
    var response =
        await AICompletion().createChat(prompt: '讲个笑话', maxTokens: 10);
    var choices = response.choices?.first;
    expect(choices?.message?.content, isNotEmpty);
    debugPrint(choices?.message?.content ?? "openai error");
  });
}

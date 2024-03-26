import 'package:flutter/material.dart';
import 'package:login_sdk/dao/login_dao.dart';
import 'package:login_sdk/util/navigator_util.dart';
import 'package:login_sdk/util/padding_extension.dart';
import 'package:login_sdk/util/string_util.dart';
import 'package:login_sdk/widget/input_widget.dart';
import 'package:login_sdk/widget/login_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  String? userName;
  String? password;

  get _background {
    return [
      Positioned.fill(
        child: Image.network(
          'https://o.devio.org/images/bg_cover/robot.webp',
          fit: BoxFit.cover,
        ),
      ),
      Positioned.fill(
        child: Container(
          decoration: const BoxDecoration(color: Colors.black54),
        ),
      )
    ];
  }

  get _content {
    return Positioned.fill(
      left: 25,
      right: 25,
      child: ListView(
        children: [
          90.paddingHeight,
          const Text(
            'ChatGPT',
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          25.paddingHeight,
          InputWidget(
            hint: '请输入账号',
            onChanged: (text) {
              userName = text;
              _checkInput();
            },
          ),
          25.paddingHeight,
          InputWidget(
            hint: '请输入密码',
            obscureText: true,
            onChanged: (text) {
              password = text;
              _checkInput();
            },
          ),
          30.paddingHeight,
          LoginButton(
            '登录',
            enable: loginEnable,
            onPressed: () => _login(context),
          ),
          15.paddingHeight,
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: _jumpRegistration,
              child: const Text('注册账号', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [..._background, _content]),
    );
  }

  /// 注册账号
  void _jumpRegistration() async {
    //跳转到接口后台注册账号
    Uri uri = Uri.parse(
        'https://api.devio.org/uapi/swagger-ui.html#/Account/registrationUsingPOST');

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $uri');
    }
  }

  void _checkInput() {
    bool enable;
    if (isNotEmpty(userName) && isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  _login(BuildContext context) async {
    try {
      await LoginDao.login(userName: userName!, password: password!);
      if (context.mounted) {
        NavigatorUtil.goToHome(context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

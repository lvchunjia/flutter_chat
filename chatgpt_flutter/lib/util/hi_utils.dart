import 'package:chatgpt_flutter/util/hi_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HiUtils {
  ///复制内容
  static void copyMessage(String message, BuildContext context) {
    Clipboard.setData(ClipboardData(text: message));
    if (!context.mounted) return;
    HiDialog.showSnackBar(context, '已复制');
  }

  ///打开H5页面
  static void openH5(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}

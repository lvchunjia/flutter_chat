import 'package:chatgpt_flutter/model/favorite_model.dart';
import 'package:chatgpt_flutter/util/hi_selection_area.dart';
import 'package:flutter/material.dart';
import 'package:zhonglvshiqi_chat_message/util/wechat_data_format.dart';

///展示精彩内容详情
class MessageDetailPage extends StatefulWidget {
  final FavoriteModel model;

  const MessageDetailPage({super.key, required this.model});

  @override
  State<MessageDetailPage> createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  get _titleView => Column(
        children: [
          const Text('详情', style: TextStyle(fontSize: 16)),
          Text(
            '来自 ${widget.model.ownerName} ${WechatDateFormat.formatYMd(widget.model.createdAt!)}',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      );

  get _listView => ListView(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 15,
          right: 15,
        ),
        children: [_content],
      );

  get _content => HiSelectionArea.wrap(
        Text(widget.model.content, style: const TextStyle(fontSize: 18)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _titleView),
      body: _listView,
    );
  }

  void _onLongPress() {}
}

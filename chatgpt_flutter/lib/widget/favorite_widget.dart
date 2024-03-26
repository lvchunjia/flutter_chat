import 'package:chatgpt_flutter/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:login_sdk/util/padding_extension.dart';
import 'package:zhonglvshiqi_chat_message/util/wechat_data_format.dart';

typedef OnFavoriteClick = void Function(
  FavoriteModel model,
  BuildContext ancestor,
);

class FavoriteWidget extends StatelessWidget {
  final FavoriteModel model;
  final OnFavoriteClick onLongPress;
  final OnFavoriteClick onTap;

  const FavoriteWidget({
    super.key,
    required this.model,
    required this.onLongPress,
    required this.onTap,
  });

  get _titleView => Text(
        model.content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      );

  get _bottomLayout => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.ownerName ?? "",
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Text(
            WechatDateFormat.format(model.createdAt!),
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => onLongPress(model, context),
      onTap: () => onTap(model, context),
      child: Card(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_titleView, 20.paddingHeight, _bottomLayout],
          ),
        ),
      ),
    );
  }
}

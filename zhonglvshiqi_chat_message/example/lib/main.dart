import 'package:chat_message/core/chat_controller.dart';
import 'package:chat_message/model/message_model.dart';
import 'package:chat_message/widget/chat_list_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Message',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Chat Message Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ChatController chatController;
  int count = 0;
  final List<MessageModel> _messageList = [
    MessageModel(
      ownerType: OwnerType.receiver,
      ownerName: 'ChatGPT',
      content:
          '测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，',
      createdAt: 1771058682999,
      id: 8,
      avatar: 'https://o.devio.org/images/o_as/avatar/tx2.jpeg',
    ),
    MessageModel(
      ownerType: OwnerType.sender,
      content: '介绍一下ChatGPT',
      createdAt: 1771058683000,
      id: 1,
      avatar: 'https://o.devio.org/images/o_as/avatar/tx18.jpeg',
      ownerName: 'Imooc',
    ),
    MessageModel(
      ownerType: OwnerType.receiver,
      ownerName: 'ChatGPT',
      content:
          '测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，',
      createdAt: 1771058682999,
      id: 2,
      avatar: 'https://o.devio.org/images/o_as/avatar/tx2.jpeg',
    ),
    MessageModel(
      ownerType: OwnerType.sender,
      content: '介绍一下ChatGPT',
      createdAt: 1771058683000,
      id: 3,
      avatar: 'https://o.devio.org/images/o_as/avatar/tx18.jpeg',
      ownerName: 'Imooc',
    ),
    MessageModel(
      ownerType: OwnerType.receiver,
      ownerName: 'ChatGPT',
      content:
          '测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，',
      createdAt: 1771058682999,
      id: 4,
      avatar: 'https://o.devio.org/images/o_as/avatar/tx2.jpeg',
    ),
    MessageModel(
      ownerType: OwnerType.sender,
      content: '介绍一下ChatGPT',
      createdAt: 1771058683000,
      id: 5,
      avatar: 'https://o.devio.org/images/o_as/avatar/tx18.jpeg',
      ownerName: 'Imooc',
    ),
    MessageModel(
      ownerType: OwnerType.receiver,
      ownerName: 'ChatGPT',
      content:
          '测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，测试数据，',
      createdAt: 1771058682999,
      id: 6,
      avatar: 'https://o.devio.org/images/o_as/avatar/tx2.jpeg',
    ),
    MessageModel(
      ownerType: OwnerType.sender,
      content: '介绍一下ChatGPT',
      createdAt: 1771058683000,
      id: 7,
      avatar: 'https://o.devio.org/images/o_as/avatar/tx18.jpeg',
      ownerName: 'Imooc',
    ),
  ];
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    chatController = ChatController(
      initialMessageList: _messageList,
      scrollController: scrollController,
      timePellet: 60,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
              child: ChatList(
            chatController: chatController,
            onBubbleTap: (MessageModel message, BuildContext ancestor) {
              debugPrint('onBubbleTap:${message.content}');
            },
            onBubbleLongPress: (MessageModel message, BuildContext ancestor) {
              debugPrint('onBubbleLongPress:${message.content}');
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _loadMore,
                child: const Text('loadMore'),
              ),
              ElevatedButton(onPressed: _send, child: const Text('Send'))
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  int _counter = 0;
  void _loadMore() {
    var tl = 1772058683000;
    tl = tl - ++_counter * 1000000;
    final List<MessageModel> messageList = [
      MessageModel(
        ownerType: OwnerType.sender,
        content: 'Hello ${_counter++}',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        avatar: 'https://o.devio.org/images/o_as/avatar/tx2.jpeg',
        ownerName: 'Imooc',
        id: 10 + _counter,
      ),
      MessageModel(
        ownerType: OwnerType.receiver,
        content: 'Nice',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        avatar: 'https://o.devio.org/images/o_as/avatar/tx2.jpeg',
        ownerName: 'ChatGPT',
        id: 300 + _counter,
      )
    ];
    chatController.loadMoreData(messageList);
  }

  void _send() {
    chatController.addMessage(
      MessageModel(
        ownerType: OwnerType.sender,
        content: 'Hello ${count++}',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        avatar: 'https://o.devio.org/images/o_as/avatar/tx2.jpeg',
        ownerName: 'Imooc',
        id: 1050 + count,
      ),
    );
    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        chatController.addMessage(MessageModel(
          ownerType: OwnerType.receiver,
          content: 'Nice',
          createdAt: DateTime.now().millisecondsSinceEpoch,
          avatar: 'https://o.devio.org/images/o_as/avatar/tx2.jpeg',
          ownerName: 'ChatGPT',
          id: 3050 + count,
        ));
      },
    );
  }
}

import 'package:chat_db/dao/note_dao.dart';
import 'package:chat_db/database/hi_storage.dart';
import 'package:flutter/material.dart';

import 'model/note_model.dart';

class DBPage extends StatefulWidget {
  const DBPage({super.key});

  @override
  State<DBPage> createState() => _DBPageState();
}

class _DBPageState extends State<DBPage> {
  late HiStorage storage;
  late INote noteDao;
  List<NoteModel> noteList = [];
  int? id;
  int count = 0;
  String? content;

  get _updateWidget => Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(hintText: 'input id'),
              onChanged: (value) => id = int.parse(value),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(hintText: 'input content'),
              onChanged: (value) => content = value,
            ),
          ),
          ElevatedButton(onPressed: _updateContent, child: const Text('Update'))
        ],
      );

  @override
  void initState() {
    super.initState();
    _doInit();
  }

  @override
  void dispose() {
    super.dispose();
    storage.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('sqflite')),
      body: Column(
        children: [
          Text('count:$count'),
          TextField(onChanged: _doSave),
          ElevatedButton(onPressed: _loadAll, child: const Text('Refresh')),
          _updateWidget,
          Expanded(
            child: ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (BuildContext _, int inx) => _itemWidget(inx),
            ),
          ),
        ],
      ),
    );
  }

  _itemWidget(int inx) {
    NoteModel model = noteList[inx];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('id:${model.id},content:${model.content}'),
        ElevatedButton(
          onPressed: () => _doDelete(model),
          child: const Text('Delete'),
        )
      ],
    );
  }

  void _doInit() async {
    storage = await HiStorage.instance(dbName: 'test');
    noteDao = storage;
    _loadAll();
  }

  ///查询数据
  void _loadAll() async {
    var list = await noteDao.getAllNote();
    setState(() {
      noteList = list;
    });
    _getCount();
  }

  ///保存数据
  void _doSave(String value) {
    noteDao.saveNote(NoteModel(content: value));
    _loadAll();
  }

  ///删除数据
  void _updateContent() {
    if (id == null || content == null) return;
    var model = NoteModel(id: id, content: content);
    noteDao.update(model);
    _loadAll();
  }

  ///删除数据
  void _doDelete(NoteModel model) {
    noteDao.deleteNote(model.id!);
    _loadAll();
  }

  ///汇总计数
  void _getCount() async {
    var count = await noteDao.getNoteCount();
    setState(() {
      this.count = count;
    });
  }
}

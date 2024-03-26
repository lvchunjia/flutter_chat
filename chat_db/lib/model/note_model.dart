class NoteModel {
  int? id;
  String? content;

  NoteModel({this.id, this.content});

  ///提供fromJson以方便将数据库查询结果，转成Dart Model
  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
  }

  ///提供toJson以方便在持久化数据的时候使用
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    return data;
  }
}

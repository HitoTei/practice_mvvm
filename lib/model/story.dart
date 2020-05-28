import 'package:flutter/widgets.dart';
import 'package:practicemvvm/model/work.dart';

import 'constant_strings.dart';

class Story extends Work {
  Story();

  @override
  Story.fromMap(Map<String, dynamic> map) {
    id = map[idStr] as int;
    worldId = map[worldIdStr] as int;
    createTime = DateTime.parse(map[createTimeStr] as String);
    updateTime = DateTime.parse(map[updateTimeStr] as String);
    title = map[titleStr] as String;
    content = map[contentsStr] as String;
  }

  int worldId; // 世界のid
  String content; // 内容

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      idStr: id,
      worldIdStr: worldId,
      createTimeStr: createTime.toString(),
      updateTimeStr: updateTime.toString(),
      titleStr: title,
      contentsStr: content,
    };
  }

  @override
  String getTableName() {
    return 'stories';
  }

  @override
  Widget tile() {
    return Column(
      children: <Widget>[
        Text('タイトル: $title'),
        Text('世界: $worldId'),
        Text('作成時間: $createTime'),
        Text('更新期間: $updateTime'),
      ],
    );
  }
}

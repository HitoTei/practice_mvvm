import 'package:practicemvvm/model/work.dart';

import '../base/constant_strings.dart';

class Story extends Work {
  Story() {
    title = '';
  }

  Story.fromMap(Map<String, dynamic> map) {
    id = map[idStr] as int;
    worldId = map[worldIdStr] as int;
    createTime = DateTime.parse(map[createTimeStr] as String);
    updateTime = DateTime.parse(map[updateTimeStr] as String);
    title = map[titleStr] as String;
    contents = map[contentsStr] as String;
  }

  int worldId; // 世界のid
  String contents = ''; // 内容

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      idStr: id,
      worldIdStr: worldId,
      createTimeStr: createTime.toString(),
      updateTimeStr: updateTime.toString(),
      titleStr: title,
      contentsStr: contents,
    };
  }

  @override
  String getTableName() {
    return 'stories';
  }
}

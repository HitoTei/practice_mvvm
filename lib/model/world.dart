import 'package:practicemvvm/model/work.dart';

import 'constant_strings.dart';

class World extends Work {
  World();

  @override
  World.fromMap(Map<String, dynamic> map) {
    id = map[idStr] as int;
    createTime = DateTime.parse(map[createTimeStr] as String);
    updateTime = DateTime.parse(map[updateTimeStr] as String);
    title = map[titleStr] as String;
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      idStr: id,
      createTimeStr: createTime.toString(),
      updateTimeStr: updateTime.toString(),
      titleStr: title,
    };
  }

  @override
  String getTableName() {
    return 'worlds';
  }
}

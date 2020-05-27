import 'constant_strings.dart';

class World {
  World();
  World.fromMap(Map<String, dynamic> map) {
    id = map[idStr] as int;
    createTime = DateTime.parse(map[createTimeStr] as String);
    updateTime = DateTime.parse(map[updateTimeStr] as String);
    title = map[titleStr] as String;
  }

  int id; // ユニークid
  DateTime createTime; // 作成時刻
  DateTime updateTime; // 更新時刻
  String title; // タイトル

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      idStr: id,
      createTimeStr: createTime.toString(),
      updateTimeStr: updateTime.toString(),
      titleStr: title,
    };
  }
}

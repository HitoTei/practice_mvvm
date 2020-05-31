import 'package:practicemvvm/base/constant_strings.dart';
import 'package:practicemvvm/model/work.dart';

// 用語
class Term extends Work {
  Term();
  Term.fromMap(Map<String, dynamic> map) {
    id = map[idStr] as int;
    createTime = DateTime.parse(map[createTimeStr] as String);
    updateTime = DateTime.parse(map[updateTimeStr] as String);
    title = map[titleStr] as String;
    contents = map[contentsStr] as String;
    worldId = map[worldIdStr] as int;
  }
  int worldId;
  String contents;

  @override
  String getTableName() {
    return 'terms';
  }

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
}

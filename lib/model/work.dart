abstract class Work {
  Work();

  Work.fromMap(Map<String, dynamic> map);

  int id; // ユニークid
  DateTime createTime; // 作成時刻
  DateTime updateTime; // 更新時刻
  String title; // タイトル

  Map<String, dynamic> toMap();

  String getTableName(); // Sqlでのテーブルの名前
}

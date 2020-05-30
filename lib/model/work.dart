abstract class Work {
  int id; // ユニークid
  DateTime createTime; // 作成時刻
  DateTime updateTime; // 更新時刻
  String title; // タイトル

  Map<String, dynamic> toMap();
  String getTableName(); // Sqlでのテーブルの名前
}

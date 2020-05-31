import 'dart:async';
import 'package:path/path.dart';
import 'package:practicemvvm/model/constant_strings.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/model/work.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:sqflite/sqflite.dart';

class SqlProvider {
  factory SqlProvider() {
    return _cache ?? SqlProvider._internal();
  }
  SqlProvider._internal() {
    _db = initDatabase();
  }

  static SqlProvider _cache;

  Future<Database> _db;
  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'worlds.db'),
      onCreate: (Database db, int version) async {
        await db.execute(
          '''CREATE TABLE 
          ${World().getTableName()}(
          $idStr INTEGER PRIMARY KEY AUTOINCREMENT,
          $createTimeStr TEXT,
          $updateTimeStr TEXT,
          $titleStr TEXT
          );''',
        );
        await db.execute('''
        CREATE TABLE 
          ${Story().getTableName()}(
          $idStr INTEGER PRIMARY KEY AUTOINCREMENT,
          $worldIdStr INTEGER,
          $createTimeStr TEXT,
          $updateTimeStr TEXT,
          $titleStr TEXT,
          $contentsStr TEXT
          );
        ''');
      },
      version: 4,
    );
  }

  Future<void> insert<T extends Work>(T work) async {
    final db = await _db;

    return db.insert(
      work.getTableName(),
      work.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> delete<T extends Work>(T work) async {
    final db = await _db;
    db.delete(
      work.getTableName(),
      where: '${idStr} = ?',
      whereArgs: <dynamic>[work.id],
    );
  }

  Future<void> deleteWorldStory(int worldId) async {
    final db = await _db;
    db.delete(
      Story().getTableName(),
      where: '${worldIdStr} = ?',
      whereArgs: <dynamic>[worldId],
    );
  }

  Future<List<World>> queryWorldList() async {
    final db = await _db;
    final worlds = await db.query(World().getTableName());
    final worldList = <World>[];
    for (final world in worlds) {
      worldList.add(World.fromMap(world));
    }
    return worldList;
  }

  // 世界の物語を取ってくる
  Future<List<Story>> queryWorldStoryList(int worldId) async {
    final db = await _db;
    final stories = await db.query(
      Story().getTableName(),
      where: '$worldIdStr = ?',
      whereArgs: <dynamic>[worldId],
    );
    final storyList = <Story>[];
    for (final story in stories) {
      storyList.add(Story.fromMap(story));
    }
    return storyList;
  }

  Future<String> queryStoryContents(int id) async {
    final db = await _db;
    final contents = await db.query(
      Story().getTableName(),
      where: '$idStr = ?',
      whereArgs: <dynamic>[id],
      columns: [
        contentsStr,
      ],
    );

    if (contents.length == 0)
      return '';
    else
      return contents[0][contentsStr] as String;
  }
}

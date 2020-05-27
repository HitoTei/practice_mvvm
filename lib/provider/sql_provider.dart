import 'dart:async';
import 'package:path/path.dart';
import 'package:practicemvvm/model/constant_strings.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:sqflite/sqflite.dart';

class SqlProvider {
  factory SqlProvider() {
    return _cache ?? SqlProvider._internal();
  }
  SqlProvider._internal() {
    _db = initDatabase();
  }
  static const _tableName = 'worlds';
  static SqlProvider _cache;

  Future<Database> _db;
  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'worlds.db'),
      onCreate: (Database db, int version) {
        return db.execute(
          'CREATE TABLE '
          '$_tableName('
          '$idStr INTEGER PRIMARY KEY AUTOINCREMENT,'
          '$createTimeStr TEXT,'
          '$updateTimeStr TEXT,'
          '$titleStr TEXT'
          ');',
        );
      },
      version: 1,
    );
  }

  Future<void> insert(World world) async {
    final db = await _db;

    return db.insert(
      _tableName,
      world.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> delete(World world) async {
    final db = await _db;
    db.delete(
      _tableName,
      where: '${idStr} = ?',
      whereArgs: <dynamic>[world.id],
    );
  }

  Future<List<World>> query() async {
    final db = await _db;
    final worlds = await db.query(_tableName);
    final worldList = <World>[];
    for (final world in worlds) {
      worldList.add(World.fromMap(world));
    }
    return worldList;
  }
}

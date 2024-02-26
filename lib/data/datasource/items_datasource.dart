

import 'package:test_project/data/data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_project/utils/utils.dart';


class ItemsDatasource {
  static final ItemsDatasource _instance = ItemsDatasource._();

  factory ItemsDatasource() => _instance;

  ItemsDatasource._() {
    _initDb();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'items.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppKeys.dbTable} (
        ${ItemKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ItemKeys.title} TEXT,
        ${ItemKeys.descriptions} TEXT,
        ${ItemKeys.date} TEXT,
        ${ItemKeys.time} TEXT,
        ${ItemKeys.userEmail} TEXT
      )
    ''');
  }

  Future<int> addItem(Item item) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        AppKeys.dbTable,
        item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<Item>> getAllItems(String userEmail) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      AppKeys.dbTable,
      orderBy: "id DESC",
        where: 'userEmail = ?', whereArgs: [userEmail]
    );
    return List.generate(
      maps.length,
      (index) {
        return Item.fromJson(maps[index]);
      },
    );
  }

  Future<int> updateItem(Item item) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        AppKeys.dbTable,
        item.toJson(),
        where: 'id = ?',
        whereArgs: [item.id],
      );
    });
  }

  Future<int> deleteItem(Item item) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          AppKeys.dbTable,
          where: 'id = ?',
          whereArgs: [item.id],
        );
      },
    );
  }
}

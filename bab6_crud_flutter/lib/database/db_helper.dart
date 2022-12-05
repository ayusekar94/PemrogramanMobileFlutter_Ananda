import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:bab6_crud_flutter/model/item.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  // inisialisasi beberapa variabel yang dibutuhkan
  final String tableName = 'tableKontak';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnPrice = 'price';

  DbHelper._internal();
  factory DbHelper() => _instance;

  // cek apakah database ada
  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  // Pembuatan database dengan nama kontak.db, SQLite versi 1, query onCreate
  Future<Database?> _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'item.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  // Membuat tabel dan field-fieldnya
  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName"
        "($columnId INTEGER PRIMARY KEY, "
        "$columnName TEXT,"
        "$columnPrice TEXT,";
    await db.execute(sql);
  }

  // Insert data ke dalam tabel database
  Future<int?> saveItem(Item item) async {
    var dbClient = await _db;
    var result = await dbClient!.insert(tableName, item.toMap());
    return result;
  }

  // Read data dari tabel database
  Future<List?> getAllItem() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnName,
      columnPrice,
    ]);
    return result.toList();
  }

  // update data berdasarkan id
  Future<int?> updateItem(Item item) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, item.toMap(),
        where: '$columnId = ?', whereArgs: [item.id]);
  }

  // Hapus data berdasarkan id
  Future<int?> deleteItem(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
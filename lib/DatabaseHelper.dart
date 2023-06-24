import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static const String _databaseName = 'product_database.db';
  static const String _tableName = 'product_table';
  static const int _databaseVersion = 1;

  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String paths = path.join(databasesPath, _databaseName);

    return openDatabase(
      paths,
      version: _databaseVersion,
      onCreate: _createTable,
    );
  }

  static Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        image TEXT,
        sellerName TEXT,
        sellerPhone TEXT,
        sellingPrice REAL
      )
    ''');
  }

  static Future<int> insertForm(
      String image, String sellerName, double sellingPrice, String sellerPhone) async {
    final db = await database;

    final Map<String, dynamic> values = {
      'image': image,
      'sellerName': sellerName,
      'sellingPrice': sellingPrice,
      'sellerPhone': sellerPhone
    };

    return db.insert(_tableName, values);
  }

  static Future<List<Map<String, dynamic>>> getAllForms() async {
    final db = await database;
    return db.query(_tableName);
  }
}

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/route.dart';
class DatabaseHelper {
  // Database constants
  static const databaseName = "route.db";
  static const databaseVersion = 1;
  static const tableInfo = 'routes';
  static const columnId = 'id';
  static const columnRoutes = 'route';

  // Singleton instance
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // Getter for database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _createTables,
    );
  }

  // Create tables
  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableInfo (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnRoutes TEXT
      )
    ''');
  }

  // Insert data
  Future<int> insertData(Route route) async {
    Database db = await instance.database;
    return await db.insert(tableInfo, route.toMap());
  }
// Search routes by location
  Future<List<Map<String, dynamic>>> searchRoutes(String location) async {
    Database db = await instance.database;
    return await db.query(
      tableInfo,
      where: '$columnRoutes LIKE ?',
      whereArgs: ['%$location%'],
    );
  }
  // Get all data
  Future<List<Map<String, dynamic>>> getAllData() async {
    Database? db = await instance.database;

    return await db.query(tableInfo, orderBy: "$columnId DESC");

    // Use rawQuery to select all notes
    // List<Map<String, dynamic>> notes = await db!.rawQuery('SELECT * FROM notes');

    //return notes;
  }


  // Update data
  Future<int> updateData(Route route, int id) async {
    Database? db = await instance.database;

    return await db
        .update(tableInfo, Route as Map<String, Object?>, where: '$columnId = ?', whereArgs: [id]);

    // await db.rawQuery(
    //     'SELECT * FROM notes WHERE userId = ?',
    //     [userId]);

  }

  // Delete data
  Future<int> deleteData(int id) async {
    Database db = await instance.database;
    return await db.delete(
      tableInfo,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
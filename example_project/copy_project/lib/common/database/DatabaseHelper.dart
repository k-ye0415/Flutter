import 'package:copy_project/data/group/Group.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "mcptx_copy_database.db";
  static const _version = 1;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _version, onCreate: (db, version) {
      _onTableCreate(db, version);
    });
  }

  Future<void> _onTableCreate(Database db, int version) async {
    // Group
    await db.execute('''
     CREATE TABLE GroupTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      priority TEXT NOT NULL,
      groupIcon TEXT NOT NULL,
      groupName TEXT NOT NULL,
      groupDescription TEXT NOT NULL,
      memberList TEXT NOT NULL
    )
    ''');

    // Message
    // await db.execute('''
    // CREATE TABLE MessageTable (
    //   id INTEGER PRIMARY KEY AUTOINCREMENT,
    //   displayName TEXT NOT NULL,
    //     message TEXT NOT NULL,
    //     direction TEXT NOT NULL,
    //     sendTime TEXT NOT NULL,
    //     messageType TEXT NOT NULL,
    //     mediaType TEXT
    // )
    // ''');
  }

  Future<void> insertGroup(Group group) async {
    final db = await database;
    await db.insert("GroupTable", group.toJson());
  }

  Future<List<Group>> getGroups() async {
    print("getGroups");
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("GroupTable");
    return List.generate(maps.length, (index) => Group.fromJson(maps[index]));
  }
}

import 'package:newsapp/core/constants/db_name.dart';
import 'package:newsapp/core/constants/db_tables.dart';
import 'package:sqflite/sqflite.dart';

class DbContext {
  static final DbContext instance = DbContext._init();
  static Database? _database;

  DbContext._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb(DbNames.newsApp);
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = "$dbPath$filePath";
    //databaseFactory.deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async {
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const String textType = 'TEXT NOT NULL';
    const String textTypeNullable = 'TEXT';
    //const String boolType = 'BOOLEAN NOT NULL';
    //const String integerType = 'INTEGER NOT NULL';

    await db.execute('''
          CREATE TABLE ${DbTables.savednews} (
            ${NewsFields.id} $idType,
            ${NewsFields.sourceId} $textTypeNullable,
            ${NewsFields.sourceName} $textTypeNullable,
            ${NewsFields.author} $textTypeNullable,
            ${NewsFields.title} $textType, 
            ${NewsFields.description} $textTypeNullable,
            ${NewsFields.url} $textTypeNullable,
            ${NewsFields.urlToImage} $textTypeNullable,
            ${NewsFields.publishedAt} $textTypeNullable,
            ${NewsFields.content} $textTypeNullable,
            ${NewsFields.isSaved} $textTypeNullable
          )
    ''');
  }

  // Future<UserModel> create(UserModel model) async {
  //   final db = await instance.database;
  //   final id = await db.insert(DbTables.users, model.toJson());
  //   return model.copy(id: id);
  // }

  // Future<UserModel> readData(int id) async {
  //   final db = await instance.database;

  //   final maps = await db.query(
  //     DbTables.users,
  //     columns: UsersFields.columns,
  //     where: '${UsersFields.id} = ?',
  //     whereArgs: [id],
  //   );

  //   if (maps.isNotEmpty) {
  //     return UserModel.fromJson(maps.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

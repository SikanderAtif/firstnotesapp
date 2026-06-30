import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Storage {
  static Future<Database> initialize(String dbName) async {
    final database = await openDatabase(
      join(await getDatabasesPath(), '$dbName.db'),
      onCreate: (db, version) async {
        return await db.execute(
          'CREATE TABLE Notes (ID INTEGER PRIMARY KEY, Title TEXT, Body TEXT, Priority TEXT, TimeStamp TEXT)',
        );
      },
      version: 1,
    );

    return database;
  }
}

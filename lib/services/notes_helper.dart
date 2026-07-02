import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart' as sqflite;
import 'storage_service.dart';

class NotesHelperDatabase {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    await init();

    return _db!;
  }

  static Future<void> init() async {
    _db = await Storage.initialize('notes_database');
  }

  static Future<void> insert(String title, String body, String priority) async {
    Database db = await database;
    await db.insert('Notes', {
      'Title': title,
      'Body': body,
      'Priority': priority,
      'TimeStamp': DateTime.now().toIso8601String(),
    });
  }

  static Future<void> update(int id, String title, String body, String priority) async {
    Database db = await database;
    await db.update(
      'Notes',
      {'Title': title, 'Body': body, 'Priority': priority},
      where: 'ID = ?',
      whereArgs: [id],
    );
  }

  static Future<void> delete(int id) async {
    Database db = await database;
    await db.delete(
      'Notes',
      where: 'ID = ?',
      whereArgs: [id],
    );
  }

  static Future<int> length() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT COUNT(ID) FROM Notes',
    );

    return sqflite.firstIntValue(result)!;
  }

  static Future<bool> isEmpty() async {
    if (await length() == 0) return true;
    return false;
  }
}

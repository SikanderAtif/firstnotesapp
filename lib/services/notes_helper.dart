import 'package:sqflite/sqflite.dart';
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
    print(_db);
    List<Map<String, dynamic>>? notes = await _db?.query('Notes');

    print('Notes: $notes');
  }
}

import 'package:contact/model/contactmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  late Database _database;

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  final String _contactTable = 'contact';

  Future<Database> _initDatabase() async {
    var db = await openDatabase(
      join(await getDatabasesPath(), 'contact_db.db'),
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $_contactTable (
          id INTEGER PRIMARY KEY,
          nama TEXT,
          nomor INTEGER
        )
      ''');
      },
      version: 1,
    );
    return db;
  }

  Future<int> insertContact(Contact contact) async {
    final Database db = await database;
    return await db.insert(_contactTable, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result = await db.query(_contactTable);
    return List.generate(result.length, (i) {
      return Contact(
        id: result[i]['id'],
        nama: result[i]['nama'],
        nomor: result[i]['nomor'],
      );
    });
  }

  Future<int> updateContact(Contact contact) async {
    final Database db = await database;
    return await db.update(
      _contactTable,
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> deleteContact(int id) async {
    final Database db = await database;
    return await db.delete(
      _contactTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

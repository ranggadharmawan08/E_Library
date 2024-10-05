import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'buku.db');
    return await openDatabase(
      path,
      version: 2, // Ubah versi agar database di-upgrade
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE buku('
          'id INTEGER PRIMARY KEY, '
          'nama TEXT, '
          'deskripsi TEXT, '
          'filePath TEXT, '
          'isLoved INTEGER DEFAULT 0)', // Kolom baru isLoved
        );
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 2) {
          // Tambahkan kolom isLoved saat database di-upgrade ke versi 2
          db.execute('ALTER TABLE buku ADD COLUMN isLoved INTEGER DEFAULT 0');
        }
      },
    );
  }

  // Fungsi untuk menambah data buku
  Future<void> insertBuku(Map<String, dynamic> buku) async {
    final db = await database;
    await db.insert('buku', buku, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Fungsi untuk mendapatkan daftar buku
  Future<List<Map<String, dynamic>>> getBukuList() async {
    final db = await database;
    return await db.query('buku');
  }

  // Fungsi untuk menghapus data buku
  Future<void> deleteBuku(int id) async {
    final db = await database;
    await db.delete('buku', where: 'id = ?', whereArgs: [id]);
  }

  // Fungsi untuk mengubah status isLoved (love/unlove)
  Future<void> updateLoveStatus(int id, int isLoved) async {
    final db = await database;
    await db.update(
      'buku',
      {'isLoved': isLoved},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Fungsi untuk memperbarui data buku
Future<void> updateBuku(Map<String, dynamic> buku) async {
  final db = await database;
  await db.update(
    'buku',
    buku,
    where: 'id = ?',
    whereArgs: [buku['id']],
  );
}

// Fungsi untuk mencari buku berdasarkan nama
Future<List<Map<String, dynamic>>> searchBukuByName(String name) async {
  final db = await database;
  return await db.query(
    'buku',
    where: 'nama LIKE ?',
    whereArgs: ['%$name%'], // Mencari nama yang mengandung string pencarian
  );
}

}


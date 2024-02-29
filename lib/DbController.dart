import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper{

  //DatabaseHelper._privateConstructor();

  static Future<sql.Database> db() async{

    return sql.openDatabase(
      'demoData.db',
          version: 1,
      onCreate: (sql.Database database, int version) async{
        await createTable(database);
      }
    );
  }

  static Future<void> createTable(sql.Database database) async{
    await database.execute("""CREATE TABLE user_data(
    
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    full_name TEXT, email TEXT, username TEXT,  password TEXT, unique_id TEXT)""");
  }


  static Future<int> createItem(String fName, String email, String username,String password,String uniqueId) async{
    final db = await DatabaseHelper.db();
    final data = {'full_name':fName,'email':email,'username':username,'password':password,'unique_id':uniqueId};
    final id = await db.insert('user_data',data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async{
    final db = await DatabaseHelper.db();
    return db.query('user_data',where: "id=?",whereArgs: [id],limit: 1);
  }

  static Future<bool> checkUserExistance(String username) async{
    final db = await DatabaseHelper.db();

    final List<Map<String, dynamic>> result = await db.query(
      'user_data', where: 'username=?', whereArgs: [username]
    );

    return result.isNotEmpty;
  }

  static Future<bool> checkEmailExistance(String email) async{
    final db = await DatabaseHelper.db();

    final List<Map<String, dynamic>> result = await db.query(
      'user_data', where: 'email=?', whereArgs: [email]
    );

    return result.isNotEmpty;
  }

  static Future<List<Map<String, dynamic>>> authentication(String username , String password) async{
    final db = await DatabaseHelper.db();

    final List<Map<String, dynamic>> result = await db.query(
        'user_data', where: 'username=? AND password=?', whereArgs: [username,password]
    );

    return result;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseHelper.db();
    return db.query('user_data', orderBy: "id");
  }

}
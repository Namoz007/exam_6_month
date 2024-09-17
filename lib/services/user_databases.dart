import 'package:exam_6_month/core/app_details.dart';
import 'package:exam_6_month/data/models/my_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabases {
  UserDatabases._singleton();

  static final UserDatabases _localDatabase = UserDatabases._singleton();

  factory UserDatabases() {
    return _localDatabase;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/user.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE user (
        totalSalary INTEGER,
        totalExpense INTEGER,
        totalIncome INTEGER
      )
''');
  }

  Future<void> deleteUser() async{
    await _database!.delete("user");
  }

  Future<void> addUser(MyModel model) async{
    await _database!.insert("user", model.toJson(),);
    AppDetails.model = model;
  }

  Future<void> getMyUser() async{
    final user = await _database!.rawQuery("SELECT * FROM user") as List<dynamic>;
    if(user.isNotEmpty) {
      AppDetails.model = MyModel.fromJson(user[0]);
    }
  }
}

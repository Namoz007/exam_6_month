import 'package:exam_6_month/data/models/budget.dart';
import 'package:exam_6_month/data/models/expense.dart';
import 'package:exam_6_month/data/models/income.dart';
import 'package:sqflite/sqflite.dart';

import '../bloc/expense_bloc/expense_bloc.dart';

class ExpensesDataBase {
  ExpensesDataBase._singleton();

  static final ExpensesDataBase _localDatabase = ExpensesDataBase._singleton();

  factory ExpensesDataBase() {
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
    final path = '$databasePath/expenses.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE expenses (
      id TEXT,
        sum TEXT,
        category TEXT,
        date TEXT,
        description TEXT
      )
''');
  }

  Future<void> deleteBase() async{
    await _database!.delete("expenses");
  }

  Future<void> deleteExpense() async {
    // await _database!.delete("user");
  }

  Future<void> addIncome(Income income) async {
    await _database!.insert(
      "expenses",
      income.toJson(),
    );
  }

  Future<void> addExpense(Expense expense) async {
    await _database!.insert(
      "expenses",
      expense.toJson(),
    );
  }

  Future<List<Expense>> getAllExpenses() async {
    Map<String, expenseCategorys> mp = {
      "food": expenseCategorys.food,
      "transport": expenseCategorys.transport,
      "shopping": expenseCategorys.shopping,
      "teach": expenseCategorys.teach,
    };
    final a = await _database!.rawQuery("SELECT * FROM expenses") as List<dynamic>;
    return [
      for(int i = 0;i < a.length;i++) if(mp[a[i]['category']] != null) Expense.fromJson(a[i])
    ];

  }

  Future<List<Income>> getAllIncomes() async {
    Map<String, incomeCategorys> mp = {
      "salary": incomeCategorys.salary,
      "projects": incomeCategorys.projects,
      "depozite": incomeCategorys.depozite,
      "debd": incomeCategorys.debd,
    };
    final a = await _database!.rawQuery("SELECT * FROM expenses") as List<dynamic>;
    return [
      for(int i = 0;i < a.length;i++) if(mp[a[i]['category']] != null) Income.fromJson(a[i])
    ];
  }
}

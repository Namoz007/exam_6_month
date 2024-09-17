import 'package:exam_6_month/data/models/budget.dart';
import 'package:exam_6_month/data/models/expense.dart';
import 'package:exam_6_month/data/models/income.dart';
import 'package:exam_6_month/services/expenses_databases.dart';

class ExpensesRepositories{
  final ExpensesDataBase _dataBase;

  ExpensesRepositories({required ExpensesDataBase base}) : _dataBase = base;

  Future<void> addIncome(Income income) async{
    await _dataBase.addIncome(income);
  }

  Future<void> deleteBase() async{
    await _dataBase.deleteBase();
  }

  Future<void> addExpense(Expense expense) async{
    await _dataBase.addExpense(expense);
  }

  Future<List<Income>> getAllIncomes() async{
    return await _dataBase.getAllIncomes();
  }

  Future<List<Expense>> getAllExpenses() async{
    return await _dataBase.getAllExpenses();
  }
}
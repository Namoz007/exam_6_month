import 'package:exam_6_month/data/models/expense.dart';
import 'package:exam_6_month/data/models/income.dart';

class ExpenseBlocEvent{}

final class GetAllExpenseAndIncomesBlocEvent extends ExpenseBlocEvent{}

final class AddInComeExpenseBlocEvent extends ExpenseBlocEvent{
  Income income;

  AddInComeExpenseBlocEvent({required this.income,});
}

final class AddExpenseBlocEvent extends ExpenseBlocEvent{
  Expense expense;

  AddExpenseBlocEvent({required this.expense});
}
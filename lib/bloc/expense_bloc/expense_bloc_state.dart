import 'package:exam_6_month/data/models/budget.dart';
import 'package:exam_6_month/data/models/expense.dart';
import 'package:exam_6_month/data/models/income.dart';

sealed class ExpenseBlocState{}

final class InitialExpenseBlocState extends ExpenseBlocState{}

final class LoadingExpenseBlocState extends ExpenseBlocState{}

final class LoadedExpenseBlocState extends ExpenseBlocState{
  List<Expense> expenses;
  List<Income> incomes;

  LoadedExpenseBlocState({required this.expenses,required this.incomes,});
}

final class ErrorExpenseBlocState extends ExpenseBlocState{
  String message;

  ErrorExpenseBlocState({required this.message});
}
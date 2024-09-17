import 'package:exam_6_month/bloc/expense_bloc/expense_bloc_event.dart';
import 'package:exam_6_month/bloc/expense_bloc/expense_bloc_state.dart';
import 'package:exam_6_month/data/repositories/expenses_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum expenseCategorys {food,transport,shopping,teach,}
enum incomeCategorys {salary,projects,depozite,debd,}

class ExpenseBloc extends Bloc<ExpenseBlocEvent,ExpenseBlocState>{
  final ExpensesRepositories _repositories;

  ExpenseBloc({required ExpensesRepositories repo}) : _repositories = repo,super(InitialExpenseBlocState()){
    on<GetAllExpenseAndIncomesBlocEvent>(_getAllExpensesAndIncomes);
    on<AddExpenseBlocEvent>(_addExpense);
    on<AddInComeExpenseBlocEvent>(_addIncome);
  }

  void _addIncome(AddInComeExpenseBlocEvent event,emit) async{
    emit(LoadingExpenseBlocState());
    await _repositories.addIncome(event.income);
    emit(LoadedExpenseBlocState(expenses: await _repositories.getAllExpenses(), incomes: await _repositories.getAllIncomes()));
  }

  void _addExpense(AddExpenseBlocEvent event,emit)async{
    emit(LoadingExpenseBlocState());
    await _repositories.deleteBase();
    await _repositories.addExpense(event.expense);
    emit(LoadedExpenseBlocState(expenses: await _repositories.getAllExpenses(), incomes: await _repositories.getAllIncomes()));
  }

  void _getAllExpensesAndIncomes(GetAllExpenseAndIncomesBlocEvent event,emit) async{
    emit(LoadingExpenseBlocState());
    emit(LoadedExpenseBlocState(expenses: await _repositories.getAllExpenses(), incomes: await _repositories.getAllIncomes()));
  }
}
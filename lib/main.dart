import 'package:exam_6_month/bloc/expense_bloc/expense_bloc.dart';
import 'package:exam_6_month/bloc/screen_bloc/screen_bloc.dart';
import 'package:exam_6_month/bloc/user_bloc/user_bloc.dart';
import 'package:exam_6_month/data/repositories/expenses_repositories.dart';
import 'package:exam_6_month/data/repositories/user_repositories.dart';
import 'package:exam_6_month/services/expenses_databases.dart';
import 'package:exam_6_month/services/user_databases.dart';
import 'package:exam_6_month/ui/screens/home/home_screen.dart';
import 'package:exam_6_month/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final database = UserDatabases();
  await database.database;
  final budget = ExpensesDataBase();
  await budget.database;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserRepositories(database: UserDatabases())),
        RepositoryProvider(create: (context) => ExpensesRepositories(base: ExpensesDataBase())),
        
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UserBloc(repo: context.read<UserRepositories>())),
          BlocProvider(create: (context) => ExpenseBloc(repo: context.read<ExpensesRepositories>())),
          BlocProvider(create: (context) => ScreenBloc()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen()
        ),
      ),
    );
  }
}

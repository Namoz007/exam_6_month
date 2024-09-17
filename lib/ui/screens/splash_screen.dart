import 'package:exam_6_month/bloc/expense_bloc/expense_bloc.dart';
import 'package:exam_6_month/bloc/expense_bloc/expense_bloc_event.dart';
import 'package:exam_6_month/bloc/user_bloc/user_bloc.dart';
import 'package:exam_6_month/bloc/user_bloc/user_bloc_event.dart';
import 'package:exam_6_month/bloc/user_bloc/user_bloc_state.dart';
import 'package:exam_6_month/data/models/expense.dart';
import 'package:exam_6_month/data/models/my_model.dart';
import 'package:exam_6_month/ui/screens/home/home_screen.dart';
import 'package:exam_6_month/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetMyUserUserBlocEvent());
    context.read<ExpenseBloc>().add(GetAllExpenseAndIncomesBlocEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserBlocState>(
        listener: (context, state) {
          if(state is LoadedUserUserBlocState){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
          }
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.money_off,color: Colors.blue,size: 50,),
              SizedBox(height: 20,),
              Text("MONEX",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 25),)
            ],
          ),
        ),
      ),
    );
  }
}

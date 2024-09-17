import 'package:exam_6_month/bloc/expense_bloc/expense_bloc.dart';
import 'package:exam_6_month/bloc/expense_bloc/expense_bloc_state.dart';
import 'package:exam_6_month/bloc/user_bloc/user_bloc.dart';
import 'package:exam_6_month/bloc/user_bloc/user_bloc_state.dart';
import 'package:exam_6_month/ui/widgets/show_bugets.dart';
import 'package:exam_6_month/ui/widgets/user_datas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: UserDatas(),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<ExpenseBloc, ExpenseBlocState>(
                  builder: (context, state) {
                    if(state is LoadingExpenseBlocState){
                      return const Center(child: CircularProgressIndicator(color: Colors.red,),);
                    }
        
                    if(state is LoadedExpenseBlocState){
                      return ShowBugets(expenses: state.expenses,incomes: state.incomes,);
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

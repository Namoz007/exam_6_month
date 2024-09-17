import 'package:exam_6_month/bloc/user_bloc/user_bloc_event.dart';
import 'package:exam_6_month/core/app_details.dart';
import 'package:exam_6_month/ui/widgets/update_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_bloc/user_bloc.dart';
import '../../bloc/user_bloc/user_bloc_state.dart';

class UserDatas extends StatefulWidget {
  const UserDatas({super.key});

  @override
  State<UserDatas> createState() => _UserDatasState();
}

class _UserDatasState extends State<UserDatas> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserBlocState>(
      listener: (context,state){
        if(state is LoadedUserUserBlocState){
          if(state.model.totalSalary < state.model.totalExpense){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Harajatlar oylik maoshdan oshib ketdi!")));
          }
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () async {
                final data = await showDialog(
                    context: context,
                    builder: (context) => UpdateUser(
                          title: "Update Total Salary",
                          price: AppDetails.model!.totalSalary,
                        ),
                    barrierDismissible: false);
                if (data != null) {
                  AppDetails.model!.totalSalary = data;
                  context
                      .read<UserBloc>()
                      .add(EditUserBlocEvent(model: AppDetails.model!));
                }
              },
              child: Container(
                width: 150,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.wallet,
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Total Salary",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$${state is LoadedUserUserBlocState ? state.model.totalSalary : AppDetails.model!.totalSalary}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () async {
                final data = await showDialog(
                    context: context,
                    builder: (context) => UpdateUser(
                          title: "Update Total Income",
                          price: AppDetails.model!.totalIncome,
                        ),
                    barrierDismissible: false);
                if (data != null) {
                  AppDetails.model!.totalIncome = data;
                  context
                      .read<UserBloc>()
                      .add(EditUserBlocEvent(model: AppDetails.model!));
                }
              },
              child: Container(
                width: 150,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.wallet,
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Total Income",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$${state is LoadedUserUserBlocState ? state.model.totalIncome: AppDetails.model!.totalIncome}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () async{
                final data = await showDialog(
                    context: context,
                    builder: (context) => UpdateUser(
                          title: "Update Total Expenses",
                          price: AppDetails.model!.totalExpense,
                        ),
                    barrierDismissible: false);
                if(data != null){
                  AppDetails.model!.totalExpense = data;
                  context.read<UserBloc>().add(EditUserBlocEvent(model: AppDetails.model!));
                }
              },
              child: Container(
                width: 150,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.wallet,
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Total Expense",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$${state is LoadedUserUserBlocState ? state.model.totalExpense: AppDetails.model!.totalExpense}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

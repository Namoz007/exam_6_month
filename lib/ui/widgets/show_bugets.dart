import 'package:exam_6_month/data/models/expense.dart';
import 'package:exam_6_month/data/models/income.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ShowBugets extends StatefulWidget {
  List<Expense> expenses;
  List<Income> incomes;
  ShowBugets({
    super.key,
    required this.expenses,
    required this.incomes,
  });

  @override
  State<ShowBugets> createState() => _ShowBugetsState();
}

class _ShowBugetsState extends State<ShowBugets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: widget.expenses.length,
          itemBuilder: (context, index) {
            final expense = widget.expenses[index];
            return ListTile(
              title: Text(expense.description),
            );
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: widget.incomes.length,
          itemBuilder: (context, index) {
            final expense = widget.expenses[index];
            return ListTile(
              title: Text(expense.description),
            );
          },
        ),
      ],
    );
  }
}

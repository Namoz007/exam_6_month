import 'package:exam_6_month/bloc/expense_bloc/expense_bloc.dart';
import 'package:exam_6_month/data/models/budget.dart';

class Expense extends Budget {
  String id;
  double sum;
  expenseCategorys category;
  DateTime date;
  String description;

  Expense({
    required this.id,
    required this.sum,
    required this.category,
    required this.date,
    required this.description,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    Map<String, expenseCategorys> categorys = {
      "food": expenseCategorys.food,
      "transport": expenseCategorys.transport,
      "shopping": expenseCategorys.shopping,
      "teach": expenseCategorys.teach,
    };
    return Expense(
      id: json['id'],
        sum: double.parse(json['sum'].toString()),
        category: categorys[json['category']]!,
        date: DateTime.parse(json['date']),
        description: json['description']);
  }

  Map<String,dynamic> toJson(){
    return {
      "id": id,
      "sum": sum,
      "category" : category.name,
      "date": date.toString(),
      "description": description,
    };
  }
}

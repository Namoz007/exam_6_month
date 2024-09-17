import 'package:exam_6_month/bloc/expense_bloc/expense_bloc.dart';
import 'package:exam_6_month/data/models/budget.dart';

class Income extends Budget {
  String type;
  String id;
  double sum;
  incomeCategorys category;
  DateTime date;
  String description;

  Income({
    required this.type,
    required this.id,
    required this.sum,
    required this.category,
    required this.date,
    required this.description,
  });

  factory Income.fromJson(Map<String, dynamic> json) {
    Map<String, incomeCategorys> mp = {
      "salary": incomeCategorys.salary,
      "projects": incomeCategorys.projects,
      "depozite": incomeCategorys.depozite,
      "debd": incomeCategorys.debd,
    };

    return Income(
      type: json['type'],
      id: json['id'],
      sum: double.parse(json['sum']),
      category: mp[json['category']]!,
      date: DateTime.parse(json['date']),
      description: json['description'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "type": type,
      "id": id,
      "sum": sum,
      "category":category,
      "date": date,
      "description": description,
    };
  }
}

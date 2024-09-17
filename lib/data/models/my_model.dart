class MyModel {
  double totalSalary;
  double totalExpense;
  double totalIncome;

  MyModel({
    required this.totalSalary,
    required this.totalExpense,
    required this.totalIncome,
  });

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      totalSalary: double.parse(json['totalSalary'].toString()),
      totalExpense: double.parse(json['totalExpense'].toString()),
      totalIncome: double.parse(json['totalIncome'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalSalary": totalSalary,
      "totalExpense": totalExpense,
      "totalIncome": totalIncome,
    };
  }
}

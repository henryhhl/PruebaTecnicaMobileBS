import '../../domain/entities/expenses.entity.dart';

class ExpensesModel extends ExpensesEntity {
  ExpensesModel({
    required String description,
    required double amount,
    required String expenseType,
    required String expenseDate,
    required int userId,
  }) : super(
          description: description,
          amount: amount,
          expenseType: expenseType,
          expenseDate: expenseDate,
          userId: userId,
        );

  factory ExpensesModel.fromJson(Map<String, dynamic> json) {
    return ExpensesModel(
      description: json['description'],
      amount: json['amount'],
      expenseType: json['expenseType'],
      expenseDate: json['expenseDate'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['amount'] = amount;
    data['expenseType'] = expenseType;
    data['expenseDate'] = expenseDate.split('/').reversed.join('-');
    data['userId'] = userId;
    return data;
  }
}

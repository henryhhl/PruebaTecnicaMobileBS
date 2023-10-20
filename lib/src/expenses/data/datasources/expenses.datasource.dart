import 'package:dio/dio.dart';
import '../models/expenses.model.dart';

abstract class ExpensesDataSource {
  final _dio = Dio()
    ..options.baseUrl = 'uri'
    ..options.connectTimeout = const Duration(seconds: 60)
    ..options.receiveTimeout = const Duration(seconds: 60);

  Future<void> createExpense(ExpensesModel expenseModel);
}

class ExpensesService extends ExpensesDataSource {
  @override
  Future<void> createExpense(ExpensesModel expenseModel) async {
    //* THIS IS A SUCCESS RESPONSE
    await Future.delayed(
      const Duration(seconds: 2),
    );
  }
}

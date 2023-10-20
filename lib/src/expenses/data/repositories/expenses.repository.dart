import '../models/expenses.model.dart';
import '../datasources/expenses.datasource.dart';
import '../../domain/repositories/expenses.repository.dart';

class ExpensesRepositoryImpl implements ExpensesRepository {
  final ExpensesDataSource _service;

  ExpensesRepositoryImpl(this._service);

  @override
  Future<void> createExpense(ExpensesModel expense) async {
    await _service.createExpense(expense);
  }
}

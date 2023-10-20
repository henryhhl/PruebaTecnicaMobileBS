import '../../data/models/expenses.model.dart';

abstract class ExpensesRepository {
  Future<void> createExpense(ExpensesModel expense);
}

import '../models/income.model.dart';
import '../datasources/income.datasource.dart';
import '../../domain/repositories/income.repository.dart';

class IncomeRepositoryImpl implements IncomeRepository {
  final IncomeDataSource _service;

  IncomeRepositoryImpl(this._service);

  @override
  Future<void> createIncome(IncomeModel payment) {
    return _service.createPayment(payment);
  }

  @override
  Future<List<IncomeModel>> getHistorical({
    int? userId,
    Map<String, String>? query,
  }) {
    return _service.getHistorical(userId: userId, query: query);
  }
}

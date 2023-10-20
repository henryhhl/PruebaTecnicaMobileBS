import '../entities/income.entity.dart';
import '../../data/models/income.model.dart';

abstract class IncomeRepository {
  Future<void> createIncome(IncomeModel payment);

  Future<List<IncomeEntity>> getHistorical({
    int? userId,
    Map<String, String>? query,
  });
}

import 'package:dio/dio.dart';
import 'package:mobile/commons/extensions.dart';
import '../models/income.model.dart';

abstract class IncomeDataSource {
  final _dio = Dio()
    ..options.baseUrl = 'uri'
    ..options.connectTimeout = const Duration(seconds: 60)
    ..options.receiveTimeout = const Duration(seconds: 60);

  Future<IncomeModel> createPayment(IncomeModel payment);

  Future<List<IncomeModel>> getHistorical({
    int? userId,
    Map<String, String>? query,
  });
}

class IncomeService extends IncomeDataSource {
  @override
  Future<IncomeModel> createPayment(IncomeModel payment) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return payment;
  }

  @override
  Future<List<IncomeModel>> getHistorical({
    int? userId,
    Map<String, String>? query,
  }) async {
    //* THIS IS A MOCK OF THE API
    final response = await Future.delayed(
      const Duration(seconds: 2),
      () => {
        'paymentRecord': [
          {
            "description": "Pago Parcial",
            "amount": 21.0,
            "expenseType": "Parcial",
            "expenseDate": "2023-10-18",
            "userId": 1,
          },
        ]
      },
    );

    final paymentList = (response['paymentRecord'] as List)
        .map((item) => IncomeModel.fromJson(item))
        .toList();

    paymentList.sort(
      (a, b) => b.expenseDate.toTime().compareTo(a.expenseDate.toTime()),
    );
    return paymentList;
  }
}

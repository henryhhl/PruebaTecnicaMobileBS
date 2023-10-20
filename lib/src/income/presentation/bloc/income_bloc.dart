import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import '../../data/models/income.model.dart';
import '../../domain/repositories/income.repository.dart';

part 'income_event.dart';
part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  final IncomeRepository _repository;

  IncomeBloc(this._repository) : super(IncomeState()) {
    on<IncomeCreated>(_onIncomeCreated);
  }

  Future<void> _onIncomeCreated(
    IncomeCreated event,
    Emitter emit,
  ) async {
    try {
      emit(state.copyWith(status: IncomeStatus.loading));
      await _repository.createIncome(event.incomeForm);
      emit(state.copyWith(status: IncomeStatus.success));
    } on DioException catch (_) {
      emit(state.copyWith(status: IncomeStatus.failure));
    }
  }
}

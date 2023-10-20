import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import '../../data/models/expenses.model.dart';
import '../../domain/repositories/expenses.repository.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final ExpensesRepository _repository;

  ExpensesBloc(this._repository) : super(ExpensesState()) {
    on<ExpensesCreated>(_onExpensesCreated);
  }

  Future<void> _onExpensesCreated(
    ExpensesCreated event,
    Emitter emit,
  ) async {
    try {
      emit(state.copyWith(status: ExpensesStatus.loading));
      await _repository.createExpense(event.expensesForm);
      emit(state.copyWith(status: ExpensesStatus.success));
    } on DioException catch (_) {
      emit(state.copyWith(status: ExpensesStatus.failure));
    }
  }
}

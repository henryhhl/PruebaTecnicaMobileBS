part of 'income_bloc.dart';

sealed class IncomeEvent {
  const IncomeEvent();
}

class IncomeCreated extends IncomeEvent {
  final IncomeModel incomeForm;

  const IncomeCreated({
    required this.incomeForm,
  });
}

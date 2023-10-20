import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'expenses_form/expense_form.widget.dart';
import '../bloc/expenses_bloc.dart';
import '../../../shared/dialog.dart';
import '../../../shared/loading.dart';

class ExpenseViewWidget extends StatelessWidget {
  const ExpenseViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = LoadingWidget(context);
    return BlocListener<ExpensesBloc, ExpensesState>(
      listener: (context, state) {
        switch (state.status) {
          case ExpensesStatus.loading:
            loading.showOverlay();
          case ExpensesStatus.success:
            loading.hideOverlay();
            showDialogPopUpSuccess(context);
          case ExpensesStatus.failure:
            loading.hideOverlay();
            showDialogPopUpFailure(context);
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: ExpenseFormWidget(),
      ),
    );
  }
}

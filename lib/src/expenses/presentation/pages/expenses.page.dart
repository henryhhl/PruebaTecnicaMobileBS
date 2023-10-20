import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/shared/app_bar_minimal.widget.dart';
import '../../../../injection.dart';
import '../bloc/expenses_bloc.dart';
import '../widgets/expense_view.widget.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMinimal(
        textTitle: 'Registro de Gastos',
        onLeftIconTap: () => Navigator.pop(context),
      ),
      body: BlocProvider<ExpensesBloc>(
        create: (_) => Injector.getItBloc<ExpensesBloc>(),
        child: const ExpenseViewWidget(),
      ),
    );
  }
}

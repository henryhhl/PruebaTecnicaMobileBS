import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/income_bloc.dart';
import '../../../../injection.dart';
import '../widgets/income_view.widget.dart';
import '../../../shared/app_bar_minimal.widget.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMinimal(
        textTitle: 'Registro de Ingresos',
        onLeftIconTap: () => Navigator.pop(context),
      ),
      body: BlocProvider<IncomeBloc>(
        create: (_) => Injector.getItBloc<IncomeBloc>(),
        child: const IncomeViewWidget(),
      ),
    );
  }
}

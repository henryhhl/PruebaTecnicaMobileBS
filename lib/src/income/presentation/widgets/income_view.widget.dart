import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'income_form/income_form.widget.dart';
import '../bloc/income_bloc.dart';
import '../../../shared/dialog.dart';
import '../../../shared/loading.dart';

class IncomeViewWidget extends StatelessWidget {
  const IncomeViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = LoadingWidget(context);
    return BlocListener<IncomeBloc, IncomeState>(
      listener: (context, state) {
        switch (state.status) {
          case IncomeStatus.loading:
            loading.showOverlay();
          case IncomeStatus.success:
            loading.hideOverlay();
            showDialogPopUpSuccess(context);
          case IncomeStatus.failure:
            loading.hideOverlay();
            showDialogPopUpFailure(context);
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: IncomeFormWidget(),
      ),
    );
  }
}

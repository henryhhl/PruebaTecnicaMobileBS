import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/expenses_bloc.dart';
import '../../../../../../commons/info.dart';
import '../../../data/models/expenses.model.dart';
import '../../shared/commons/expense_constans.dart';
import '../expenses_field/expense_text.widget.dart';
import '../expenses_field/expense_date_field.widget.dart';
import '../expenses_field/expense_text_field.widget.dart';
import '../expenses_field/expense_select_field.widget.dart';
import '../../../../shared/components/sun_button/sun_button.dart';

class ExpenseFormWidget extends StatefulWidget {
  const ExpenseFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpenseFormWidget> createState() => _ExpenseFormWidgetState();
}

class _ExpenseFormWidgetState extends State<ExpenseFormWidget> {
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerDestination = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map<String, String> optionMap = ExpenseConstans.optionMapDestino;

  @override
  void initState() {
    super.initState();
    _controllerDate.text = 'Seleccionar Fecha';
  }

  updateDateField(String newValue) {
    setState(() {
      _controllerDate.text = newValue;
    });
  }

  updateSelectionField(dynamic newValue) {
    setState(() {
      _controllerDestination.text = newValue;
    });
  }

  String getKey(String value) {
    return optionMap.keys.lastWhere(
      (element) => optionMap[element] == value,
      orElse: () => 'VariousExpenses',
    );
  }

  @override
  void dispose() {
    _controllerDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ExpenseTextWidget(
            label:
                'Ingresa la informacion que desea registrar \n*Campos requeridos',
          ),
          ExpenseTextFieldWidget(
            label: "Descripcion de Gasto*",
            controller: _controllerDescription,
            validator: (value) {
              if (value == '' || value!.isEmpty) return '*';
              return null;
            },
          ),
          ExpenseSelectFieldWidget(
            label: 'Destino',
            controller: _controllerDestination,
            optionMap: optionMap,
            voidCallback: updateSelectionField,
            hintText: 'Seleccionar una Fuente de Gastos',
          ),
          ExpenseTextFieldWidget(
            label: "Monto",
            controller: _controllerAmount,
            keyboardType: TextInputType.number,
          ),
          ExpenseDateFieldWidget(
            label: 'Fecha',
            controller: _controllerDate,
            voidCallback: updateDateField,
          ),
          const Spacer(),
          Builder(
            builder: (context) {
              return SunButton(
                title: 'Comenzar',
                colorTitle: Theme.of(context).colorScheme.onPrimary,
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  final expensesForm = ExpensesModel(
                    description: _controllerDescription.text,
                    amount: double.parse(
                      _controllerAmount.text.isEmpty
                          ? '0'
                          : _controllerAmount.text,
                    ),
                    expenseType: getKey(_controllerDestination.text),
                    expenseDate: _controllerDate.text,
                    userId: Info.userId,
                  );
                  context.read<ExpensesBloc>().add(
                        ExpensesCreated(
                          expensesForm: expensesForm,
                        ),
                      );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/income_bloc.dart';
import '../../../../../commons/info.dart';
import '../../../data/models/income.model.dart';
import '../../shared/commons/income_constans.dart';
import '../income_field/income_form_date.widget.dart';
import '../income_field/income_form_text.widget.dart';
import '../income_field/income_form_select.widget.dart';
import '../../../../shared/components/sun_text/sun_text.dart';
import '../../../../shared/components/sun_button/sun_button.dart';

class IncomeFormWidget extends StatefulWidget {
  const IncomeFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<IncomeFormWidget> createState() => _IncomeFormWidgetState();
}

class _IncomeFormWidgetState extends State<IncomeFormWidget> {
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerDestination = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map<String, String> optionMap = IncomeConstans.optionMapType;

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
          SunText(
            text:
                'Ingresa la informacion que desea registrar \n*Campos requeridos',
            style: Theme.of(context).textTheme.labelMedium!,
          ),
          const SizedBox(height: 24),
          IncomeFormTextWidget(
            label: "Descripcion del Ingreso*",
            controller: _controllerDescription,
            validator: (value) {
              if (value == '' || value!.isEmpty) return '*';
              return null;
            },
          ),
          IncomeFormSelectWidget(
            label: 'Tipo',
            controller: _controllerDestination,
            optionMap: optionMap,
            voidCallback: updateSelectionField,
            hintText: 'Seleccionar tipo de ingreso',
          ),
          IncomeFormTextWidget(
            label: "Monto",
            controller: _controllerAmount,
            keyboardType: TextInputType.number,
          ),
          IncomeFormDateWidget(
            label: 'Fecha',
            controller: _controllerDate,
            voidCallback: updateDateField,
          ),
          const Spacer(),
          Builder(
            builder: (context) {
              return SunButton(
                title: 'Registrar',
                colorTitle: Theme.of(context).colorScheme.onPrimary,
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  final incomeForm = IncomeModel(
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
                  context.read<IncomeBloc>().add(
                        IncomeCreated(
                          incomeForm: incomeForm,
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

import 'package:flutter/material.dart';
import '../../../../shared/components/sun_text/sun_text.dart';
import '../../../../shared/components/sun_field/selection/sun_selection_field.dart';

class ExpenseSelectFieldWidget extends StatelessWidget {
  const ExpenseSelectFieldWidget({
    Key? key,
    required this.label,
    this.separator = 24,
    this.style,
    required this.controller,
    this.hintText,
    required this.voidCallback,
    required this.optionMap,
  }) : super(key: key);

  final String label;
  final double separator;
  final TextStyle? style;
  final String? hintText;
  final Function(String) voidCallback;
  final Map<String, String> optionMap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SunText(
          text: label,
          style: style ?? Theme.of(context).textTheme.labelMedium!,
        ),
        const SizedBox(height: 22),
        SunSelectionField(
          optionMap: optionMap,
          controller: controller,
          voidCallback: voidCallback,
          hintText: hintText,
        ),
        SizedBox(height: separator),
      ],
    );
  }
}

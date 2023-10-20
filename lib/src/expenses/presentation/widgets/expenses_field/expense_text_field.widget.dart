import 'package:flutter/material.dart';
import '../../../../shared/components/sun_text/sun_text.dart';
import '../../../../shared/components/sun_field/text/sun_text_field.dart';

class ExpenseTextFieldWidget extends StatelessWidget {
  const ExpenseTextFieldWidget({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.separator = 24.0,
    this.style,
    this.keyboardType,
    this.hintText,
  }) : super(key: key);

  final String label;
  final double separator;
  final TextStyle? style;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SunText(
          text: label,
          style: style ?? Theme.of(context).textTheme.labelMedium!,
        ),
        SunTextField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          hintText: hintText,
        ),
        SizedBox(height: separator),
      ],
    );
  }
}

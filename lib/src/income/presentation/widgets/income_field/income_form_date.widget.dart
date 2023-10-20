import 'package:flutter/material.dart';
import '../../../../shared/components/sun_text/sun_text.dart';
import '../../../../shared/components/sun_field/date/sun_date_field.dart';

class IncomeFormDateWidget extends StatelessWidget {
  const IncomeFormDateWidget({
    Key? key,
    required this.label,
    this.style,
    required this.controller,
    required this.voidCallback,
  }) : super(key: key);

  final String label;
  final TextStyle? style;
  final TextEditingController controller;
  final Function(String) voidCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SunText(
          text: label,
          style: style ?? Theme.of(context).textTheme.labelMedium!,
        ),
        SunDateField(
          controller: controller,
          voidCallback: voidCallback,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

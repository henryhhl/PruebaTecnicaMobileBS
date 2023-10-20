import 'package:flutter/material.dart';
import '../../../../shared/components/sun_text/sun_text.dart';

class ExpenseTextWidget extends StatelessWidget {
  const ExpenseTextWidget({
    Key? key,
    required this.label,
    this.separator = 24,
    this.style,
  }) : super(key: key);

  final String label;
  final double separator;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SunText(
          text: label,
          style: style ?? Theme.of(context).textTheme.labelMedium!,
        ),
        SizedBox(height: separator),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:samthul_qibla/core/colors/colors.dart';

class WorkSheetTextSpan extends StatelessWidget {
  final String title;
  final String value;

  const WorkSheetTextSpan({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: darkblue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " : $title",
              style: const TextStyle(
                color: darkblue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

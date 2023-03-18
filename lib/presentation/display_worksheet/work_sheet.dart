import 'package:flutter/material.dart';
import 'package:samthul_qibla/presentation/display_worksheet/widgets/worksheet_textspan.dart';

class WorkSheet extends StatelessWidget {
  const WorkSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                WorkSheetTextSpan(
                  title: 'عرض البلد',
                  value: "(0°)  0° 0'",
                ),
                WorkSheetTextSpan(
                  title: 'طول البلد',
                  value: "(0°)  0° 0'",
                ),
                WorkSheetTextSpan(
                  title: 'عرض مكة',
                  value: "(21.4225°)  21° 25'",
                ),
                WorkSheetTextSpan(
                  title: 'طول مكة',
                  value: "(39.82611111°)  39° 54'",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

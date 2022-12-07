import 'package:flutter/material.dart';

class ScreenHome2 extends StatefulWidget {
  const ScreenHome2({super.key});

  @override
  State<ScreenHome2> createState() => _ScreenHome2State();
}

class _ScreenHome2State extends State<ScreenHome2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(fillColor: Colors.amber),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFormField(),
            )
          ],
        ),
      ),
    );
  }
}

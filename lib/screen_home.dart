import 'package:flutter/material.dart';
import 'package:samthul_qibla/functions.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final aralulbaladController = TextEditingController();
  final thoolulbaladController = TextEditingController();

  String result = 'سمت القبلة';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'سمت القبلة',
          style: TextStyle(
              fontFamily: 'Sakkal Majalla',
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  cursorColor: Colors.white,
                  controller: aralulbaladController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'عرض البلد',
                    fillColor: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: thoolulbaladController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'طول البلد',
                    fillColor: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              result,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                final thoolint = double.parse(thoolulbaladController.text);
                print('$thoolint');
                splitThoolAndAral(thoolint);
              },
              icon: const Icon(Icons.navigation_rounded),
              label: Text(result),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:samthul_qibla/functions.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
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
                  textAlign: TextAlign.right,
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
                final aralulBalad = aralulbaladController.text;
                final thoolulBalad = thoolulbaladController.text;

                final aralulBaladDecimal = latlongconvertToDecimal(aralulBalad);
                final thoolulBaladDecimal =
                    latlongconvertToDecimal(thoolulBalad);

                const araluMakka = 21.41666667;

                final samthInDegree = samthulQibla(
                    aralulBaladDecimal, araluMakka, thoolulBaladDecimal);
                final samthString = convertDecimalTolatlong(samthInDegree);
                setState(() {
                  result = samthString;
                });
              },
              icon: const Icon(Icons.navigation_rounded),
              label: const Text('Get Result'),
            )
          ],
        ),
      ),
    );
  }
}

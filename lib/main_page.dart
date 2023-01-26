import 'package:flutter/material.dart';
import 'package:samthul_qibla/presentation/current_location/current_location.dart';
import 'package:samthul_qibla/presentation/location_from_map/location_map.dart';
import 'package:samthul_qibla/presentation/manual_location/manual_location.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(0);

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final pageList = [CurrentLocation(), LocationMap(), const ManualLocation()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: ((context, newIndex, _) {
          return pageList[newIndex];
        }),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    ));
  }
}

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexNotifier,
      builder: (context, newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.navigation_rounded),
                label: "Current Location"),
            BottomNavigationBarItem(
                icon: Icon(Icons.map_rounded), label: "Map"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "Manual"),
          ],
          onTap: ((value) {
            indexNotifier.value = value;
          }),
        );
      },
    );
  }
}

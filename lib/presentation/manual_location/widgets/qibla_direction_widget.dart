import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samthul_qibla/application/manual_location/manual_location_bloc.dart';

class QiblaDirectionWidget extends StatelessWidget {
  const QiblaDirectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManualLocationBloc, ManualLocationState>(
      builder: (context, state) {
        return Column(
          children: [
            const Text(
              'QIBLA DIRECTION',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              state.value.samthulQibla,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              state.value.direction,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}

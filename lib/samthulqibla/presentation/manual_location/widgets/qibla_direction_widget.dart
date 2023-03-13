import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            Text(
              'QIBLA DIRECTION',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            Text(
              state.value.samthulQibla,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w900),
            ),
            10.verticalSpace,
            Text(
              state.value.direction,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}

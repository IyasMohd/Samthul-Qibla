import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/application/location_map/location_map_bloc.dart';
import 'package:samthul_qibla/core/colors/colors.dart';

showResult(BuildContext context) {
  showModalBottomSheet(
      elevation: 0,
      context: context,
      builder: (BuildContext context) {
        return Container(
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(16.0),
              //   topRight: Radius.circular(16.0),
              // ),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 5,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: BlocBuilder<LocationMapBloc, LocationMapState>(
                      builder: (context, state) {
                        return Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            color: darkblue,
                          ),
                          child: state.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : state.isError
                                  ? const Center(
                                      child: Text('An Error Occured'))
                                  : Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          state.address.address,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: backGround,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.location_on_sharp,
                                              color: backGround,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Latitude :     ${state.value.latittude}",
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  color: backGround,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.location_on_sharp,
                                              color: backGround,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Longitude :     ${state.value.longitude}",
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  color: backGround,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Column(
                                          children: [
                                            const Text(
                                              'QIBLA DIRECTION',
                                              style: TextStyle(
                                                color: backGround,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              state.value.samthulQibla,
                                              style: const TextStyle(
                                                  color: backGround,
                                                  fontSize: 45,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'from NORTH to EAST',
                                              style: TextStyle(
                                                  color: backGround,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                        );
                      },
                    ))
              ],
            ));
      });
}

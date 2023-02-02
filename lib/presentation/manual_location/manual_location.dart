import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/application/manual_location/manual_location_bloc.dart';
import 'package:samthul_qibla/core/asset_manager.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/presentation/current_location/widgets/appbar_current_location.dart';
import 'package:samthul_qibla/presentation/manual_location/functions_manual.dart';
import 'package:samthul_qibla/presentation/manual_location/widgets/samth_text_form.dart';
import 'package:samthul_qibla/presentation/manual_location/widgets/samth_toggle_buttons.dart';

class ManualLocation extends StatelessWidget {
  ManualLocation({Key? key}) : super(key: key);

  ValueNotifier<bool> aralDirectionNorth = ValueNotifier(true);
  ValueNotifier<bool> thoolDirectionEast = ValueNotifier(true);

  //Aral Controllers

  final aralDarajaController = TextEditingController();

  final aralDaqeeqaController = TextEditingController();

  final aralThaniyaController = TextEditingController();

  //Thool Controllers

  final thoolDarajaController = TextEditingController();

  final thoolDaqeeqaController = TextEditingController();

  final thoolThaniyaController = TextEditingController();

  //Keys for validation

  final aralformKey = GlobalKey<FormState>();

  final thoolformKey = GlobalKey<FormState>();

  List<bool> isSelectedEastWest = [true, false];
  List<bool> isSelectedsouthNorth = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetManager.backGroundImage),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const AppBarCurrentLocation(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 80,
                  ),
                  child: Container(
                    color: Colors.transparent,
                    child: Form(
                      key: aralformKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Row(
                        children: [
                          SamthFormField(
                            labelText: 'Degree',
                            suffixText: '°',
                            controller: aralDarajaController,
                            validatorFunction: ((degree) {
                              if (degree!.isEmpty) {
                                return 'Enter valid number';
                              } else {
                                return null;
                              }
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SamthFormField(
                            labelText: 'Minutes',
                            suffixText: "'",
                            controller: aralDaqeeqaController,
                            validatorFunction: ((minutes) {
                              if (minutes!.isEmpty) {
                                aralDaqeeqaController.text = '0';
                                return;
                              } else {
                                return null;
                              }
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SamthFormField(
                            labelText: 'Seconds',
                            suffixText: '"',
                            controller: aralThaniyaController,
                            validatorFunction: ((seconds) {
                              if (seconds!.isEmpty) {
                                aralThaniyaController.text = '0';
                                return null;
                              } else {
                                return null;
                              }
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: SamthToggleButtons(
                              notifier: aralDirectionNorth,
                              boolList: isSelectedsouthNorth,
                              firstDirection: 'N',
                              secondDirection: 'S',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 80,
                  ),
                  child: Container(
                    color: Colors.transparent,
                    child: Form(
                      key: thoolformKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Row(
                        children: [
                          SamthFormField(
                            labelText: 'Degree',
                            suffixText: '°',
                            controller: thoolDarajaController,
                            validatorFunction: ((degree) {
                              if (degree!.isEmpty) {
                                return 'Enter valid number';
                              } else {
                                return null;
                              }
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SamthFormField(
                            labelText: 'Minutes',
                            suffixText: "'",
                            controller: thoolDaqeeqaController,
                            validatorFunction: ((minutes) {
                              if (minutes!.isEmpty) {
                                thoolDaqeeqaController.text = '0';
                                return;
                              } else {
                                return null;
                              }
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SamthFormField(
                            labelText: 'Seconds',
                            suffixText: '"',
                            controller: thoolThaniyaController,
                            validatorFunction: ((seconds) {
                              if (seconds!.isEmpty) {
                                thoolThaniyaController.text = '0';
                                return null;
                              } else {
                                return null;
                              }
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: SamthToggleButtons(
                              notifier: thoolDirectionEast,
                              boolList: isSelectedEastWest,
                              firstDirection: 'E',
                              secondDirection: 'W',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                BlocBuilder<ManualLocationBloc, ManualLocationState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 240,
                        ),
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
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
                ValueListenableBuilder(
                    valueListenable: thoolDirectionEast,
                    builder: (context, thoolvalue, _) {
                      return ValueListenableBuilder(
                        valueListenable: aralDirectionNorth,
                        builder: (context, value, _) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 20, right: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: darkblue.withOpacity(0.5),
                                  fixedSize: const Size(400, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {
                                final aralulBalad = latitudeconvertToDecimal(
                                  aralDarajaController.text,
                                  aralDaqeeqaController.text,
                                  aralThaniyaController.text,
                                  aralDirectionNorth.value,
                                );

                                final thoolulBalad = longitudeconvertToDecimal(
                                  thoolDarajaController.text,
                                  thoolDaqeeqaController.text,
                                  thoolThaniyaController.text,
                                  thoolDirectionEast.value,
                                );

                                BlocProvider.of<ManualLocationBloc>(context)
                                    .add(
                                  ManualLocationEvent.getSamth(
                                    thoolulBalad: thoolulBalad,
                                    aralulBalad: aralulBalad,
                                    directionEast: thoolDirectionEast.value,
                                    directionNorth: aralDirectionNorth.value,
                                  ),
                                );
                              },
                              child: Text(
                                'Get Samth',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );

    // Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   body: SafeArea(
    //     child: Stack(children: [
    //       Container(
    //         height: double.infinity,
    //         width: double.infinity,
    //         decoration: const BoxDecoration(
    //           image: DecorationImage(
    //             image: ExactAssetImage("lib/assets/images/kaaba.jpg"),
    //             fit: BoxFit.cover,
    //             alignment: Alignment.topCenter,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         color: Colors.black.withOpacity(0.8),
    //       ),
    //       Center(
    //         child: Column(
    //           children: [

    //             Padding(
    //               padding:
    //                   const EdgeInsets.only(top: 50, bottom: 0.5, left: 25),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   const Icon(
    //                     Icons.location_on_sharp,
    //                     color: Colors.red,
    //                   ),
    //                   Text(
    //                     'Lattitude',
    //                     style: GoogleFonts.poppins(
    //                       textStyle: const TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(
    //                   bottom: 20, top: 10, left: 20, right: 20),
    //               child: Form(
    //                 key: aralformKey,
    //                 child: Row(
    //                   children: [
    //                     SamthTextFormField(
    //                       validatorFunction: (degree) {
    //                         return '';
    //                       },
    //                       hintText: 'Degree',
    //                       suffixText: '°',
    //                       controller: aralDarajaController,
    //                     ),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    //                     SamthTextFormField(
    //                       validatorFunction: (minutes) {
    //                         return '';
    //                       },
    //                       hintText: 'Minutes',
    //                       suffixText: "'",
    //                       controller: aralDaqeeqaController,
    //                     ),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    //                     SamthTextFormField(
    //                       validatorFunction: (seconds) {
    //                         return '';
    //                       },
    //                       hintText: 'Seconds',
    //                       suffixText: '"',
    //                       controller: aralThaniyaController,
    //                     ),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    // SamthToggleButtons(
    //   boolList: isSelectedsouthNorth,
    //   firstDirection: 'N',
    //   secondDirection: 'S',
    //   toggleOnPressed: (newIndex) {
    //     setState(
    //       () {
    //         for (int index = 0;
    //             index < isSelectedsouthNorth.length;
    //             index++) {
    //           // checking for the index value
    //           if (index == newIndex) {
    //             // one button is always set to true
    //             isSelectedsouthNorth[index] = true;
    //           } else {
    //             // other two will be set to false and not selected
    //             isSelectedsouthNorth[index] = false;
    //           }
    //         }
    //         if (newIndex == 0) {
    //           aralDirectionNorth = true;
    //         } else {
    //           aralDirectionNorth = false;
    //         }
    //       },
    //     );
    //   },
    // )
    //     ],
    //   ),
    // ),
    //             ),
    //             Padding(
    //               padding:
    //                   const EdgeInsets.only(top: 20, bottom: 0.5, left: 25),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   const Icon(
    //                     Icons.location_on_sharp,
    //                     color: Colors.red,
    //                   ),
    //                   Text(
    //                     'Longitude',
    //                     style: GoogleFonts.poppins(
    //                       textStyle: const TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(
    //                   bottom: 20, top: 10, left: 20, right: 20),
    //               child: Form(
    //                 key: thoolformKey,
    //                 child: Row(
    //                   children: [
    //                     SamthTextFormField(
    //                       validatorFunction: (degree) {
    //                         return '';
    //                       },
    //                       hintText: 'Degree',
    //                       suffixText: '°',
    //                       controller: thoolDarajaController,
    //                     ),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    //                     SamthTextFormField(
    //                       validatorFunction: (minutes) {
    //                         return '';
    //                       },
    //                       hintText: 'Minutes',
    //                       suffixText: "'",
    //                       controller: thoolDaqeeqaController,
    //                     ),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    //                     SamthTextFormField(
    //                       validatorFunction: (seconds) {
    //                         return '';
    //                       },
    //                       hintText: 'Seconds',
    //                       suffixText: '"',
    //                       controller: thoolThaniyaController,
    //                     ),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    //                     SamthToggleButtons(
    // boolList: isSelectedEastWest,
    // firstDirection: 'E',
    // secondDirection: 'W',
    // toggleOnPressed: (newIndex) {
    //   setState(
    //     () {
    //       for (int index = 0;
    //           index < isSelectedEastWest.length;
    //           index++) {
    //         // checking for the index value
    //         if (index == newIndex) {
    //           // one button is always set to true
    //           isSelectedEastWest[index] = true;
    //         } else {
    //           // other two will be set to false and not selected
    //           isSelectedEastWest[index] = false;
    //         }
    //       }
    //       if (newIndex == 0) {
    //         thoolDirectionEast = true;
    //       } else {
    //         thoolDirectionEast = false;
    //       }
    //     },
    //   );
    //                       },
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
    //               child: ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                     backgroundColor: Colors.white.withOpacity(0.5),
    //                     fixedSize: const Size(400, 50),
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(30))),
    //                 onPressed: () {
    //                   final aralulBalad = latitudeconvertToDecimal(
    //                       aralDarajaController.text,
    //                       aralDaqeeqaController.text,
    //                       aralThaniyaController.text);

    //                   final thoolulBalad = longitudeconvertToDecimal(
    //                     thoolDarajaController.text,
    //                     thoolDaqeeqaController.text,
    //                     thoolThaniyaController.text,
    //                     thoolDirectionEast,
    //                   );
    //                   const araluMakka = 21.41666667;

    //                   final qausuSsamth = samthulQibla(aralulBalad, araluMakka,
    //                       thoolulBalad, thoolDirectionEast, aralDirectionNorth);
    //                   final qausuSsamthConverted =
    //                       convertDecimalTolatlong(qausuSsamth);
    //                   longitudeNotifier.value =
    //                       "${thoolDarajaController.text}° ${thoolDaqeeqaController.text}' ${thoolThaniyaController.text}''";

    //                   latitudeNotifier.value =
    //                       "${aralDarajaController.text}° ${aralDaqeeqaController.text}' ${aralThaniyaController.text}''";

    //                   resultNotifier.value = qausuSsamthConverted;
    //                   longitudeNotifier.notifyListeners();
    //                   latitudeNotifier.notifyListeners();
    //                   resultNotifier.notifyListeners();
    //                   setState(() {
    //                     result = qausuSsamthConverted;
    //                   });
    //                 },
    //                 child: Text(
    //                   'Get Samth',
    //                   style: GoogleFonts.poppins(
    //                       textStyle: const TextStyle(color: Colors.black)),
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 150),
    //               child: ValueListenableBuilder(
    //                 valueListenable: resultNotifier,
    //                 builder: (context, value, child) {
    //                   return Text(
    //                     resultNotifier.value,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: GoogleFonts.poppins(
    //                       textStyle: const TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 50,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //     ]),
    //   ),
    // );
  }
}

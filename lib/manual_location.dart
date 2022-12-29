import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/functions_manual.dart';
import 'package:samthul_qibla/widgets/samth_text_form.dart';
import 'package:samthul_qibla/widgets/samth_toggle_buttons.dart';

class ManualLocation extends StatefulWidget {
  const ManualLocation({super.key});

  @override
  State<ManualLocation> createState() => _ManualLocationState();
}

class _ManualLocationState extends State<ManualLocation> {
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

  bool thoolDirectionEast = true;
  bool aralDirectionNorth = true;

  String result = 'سمت القبلة';
  List<bool> isSelectedEastWest = [true, false];
  List<bool> isSelectedsouthNorth = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("lib/assets/images/kaaba.jpg"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    'سمت القبلة',
                    style: GoogleFonts.notoKufiArabic(
                      color: Colors.amber,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50, bottom: 0.5, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_sharp,
                        color: Colors.red,
                      ),
                      Text(
                        'Lattitude',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, top: 10, left: 20, right: 20),
                  child: Form(
                    key: aralformKey,
                    child: Row(
                      children: [
                        SamthTextFormField(
                          validatorFunction: (degree) {
                            return '';
                          },
                          hintText: 'Degree',
                          suffixText: '°',
                          controller: aralDarajaController,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SamthTextFormField(
                          validatorFunction: (minutes) {
                            return '';
                          },
                          hintText: 'Minutes',
                          suffixText: "'",
                          controller: aralDaqeeqaController,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SamthTextFormField(
                          validatorFunction: (seconds) {
                            return '';
                          },
                          hintText: 'Seconds',
                          suffixText: '"',
                          controller: aralThaniyaController,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SamthToggleButtons(
                          boolList: isSelectedsouthNorth,
                          firstDirection: 'N',
                          secondDirection: 'S',
                          toggleOnPressed: (newIndex) {
                            setState(
                              () {
                                for (int index = 0;
                                    index < isSelectedsouthNorth.length;
                                    index++) {
                                  // checking for the index value
                                  if (index == newIndex) {
                                    // one button is always set to true
                                    isSelectedsouthNorth[index] = true;
                                  } else {
                                    // other two will be set to false and not selected
                                    isSelectedsouthNorth[index] = false;
                                  }
                                }
                                if (newIndex == 0) {
                                  aralDirectionNorth = true;
                                } else {
                                  aralDirectionNorth = false;
                                }
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, bottom: 0.5, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_sharp,
                        color: Colors.red,
                      ),
                      Text(
                        'Longitude',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, top: 10, left: 20, right: 20),
                  child: Form(
                    key: thoolformKey,
                    child: Row(
                      children: [
                        SamthTextFormField(
                          validatorFunction: (degree) {
                            return '';
                          },
                          hintText: 'Degree',
                          suffixText: '°',
                          controller: thoolDarajaController,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SamthTextFormField(
                          validatorFunction: (minutes) {
                            return '';
                          },
                          hintText: 'Minutes',
                          suffixText: "'",
                          controller: thoolDaqeeqaController,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SamthTextFormField(
                          validatorFunction: (seconds) {
                            return '';
                          },
                          hintText: 'Seconds',
                          suffixText: '"',
                          controller: thoolThaniyaController,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SamthToggleButtons(
                          boolList: isSelectedEastWest,
                          firstDirection: 'E',
                          secondDirection: 'W',
                          toggleOnPressed: (newIndex) {
                            setState(
                              () {
                                for (int index = 0;
                                    index < isSelectedEastWest.length;
                                    index++) {
                                  // checking for the index value
                                  if (index == newIndex) {
                                    // one button is always set to true
                                    isSelectedEastWest[index] = true;
                                  } else {
                                    // other two will be set to false and not selected
                                    isSelectedEastWest[index] = false;
                                  }
                                }
                                if (newIndex == 0) {
                                  thoolDirectionEast = true;
                                } else {
                                  thoolDirectionEast = false;
                                }
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        fixedSize: const Size(400, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      final thoolulbalad = latlongconvertToDecimal(
                          thoolDarajaController.text,
                          thoolDaqeeqaController.text,
                          thoolThaniyaController.text);

                      final aralulBalad = latlongconvertToDecimal(
                        aralDarajaController.text,
                        aralDaqeeqaController.text,
                        aralThaniyaController.text,
                      );
                      const araluMakka = 21.41666667;

                      final qausuSsamth = samthulQibla(aralulBalad, araluMakka,
                          thoolulbalad, thoolDirectionEast, aralDirectionNorth);
                      final qausuSsamthConverted =
                          convertDecimalTolatlong(qausuSsamth);
                      setState(() {
                        result = qausuSsamthConverted;
                      });
                    },
                    child: Text(
                      'Get Samth',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Text(
                    result,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

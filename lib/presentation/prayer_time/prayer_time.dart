import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/presentation/prayer_time/widgets/list_tile_namaz_time.dart';
import 'package:samthul_qibla/presentation/prayer_time/widgets/settings/settings_page.dart';

import '../../application/bloc/prayer_time_bloc.dart';


class NamazTime extends StatelessWidget {
  NamazTime({Key? key}) : super(key: key);

  ValueNotifier<DateTime> dateNotifier = ValueNotifier(DateTime.now());

  String time = DateFormat.jm().format(DateTime.now()).toLowerCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // foregroundColor: backGround,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: backGround,
            size: 30.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => SettingsPage()),
                  ),
                );
              },
              icon: Icon(
                Icons.settings,
                color: backGround,
                size: 27.sp,
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200.h,
                decoration: BoxDecoration(color: darkblue),
              ),
              SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Zuhar',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      20.verticalSpace,
                      Text(
                        time, 
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  dateNotifier.value =
                      dateNotifier.value.subtract(Duration(days: 1));
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: darkblue,
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: dateNotifier,
                  builder: (context, value, _) {
                    final String dateFormatted =
                        DateFormat('EEE,  dd  MMM  yyyy')
                            .format(dateNotifier.value);
                    return TextButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2024));
                        if (pickedDate != null) {
                          dateNotifier.value = pickedDate;
                        } else {}
                      },
                      child: Text(
                        dateFormatted,
                        style: GoogleFonts.poppins(
                          color: darkblue,
                          fontSize: 17.sp,
                        ),
                      ),
                    );
                  }),
              IconButton(
                onPressed: () {
                  dateNotifier.value =
                      dateNotifier.value.add(Duration(days: 1));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: darkblue,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
            builder: (context, state) {
              return Card(
            child: Column(
              children: [
                ListTileNamazTime(
                  vaqth: 'Zuhr',
                  time: state.value.zuhrTime.toString(),
                  onTapIcon: () {},
                  onTapTile: () {},
                ),
                ListTileNamazTime(
                  vaqth: 'Asar',
                  time: state.value.asrTime.toString(),
                  onTapIcon: () {},
                  onTapTile: () {},
                ),
                ListTileNamazTime(
                  vaqth: 'Magrib',
                  time: state.value.magribTime.toString(),
                  onTapIcon: () {},
                  onTapTile: () {},
                ),
                ListTileNamazTime(
                  vaqth: 'Isha',
                  time: state.value.ishaTime.toString(),
                  onTapIcon: () {},
                  onTapTile: () {},
                ),
                ListTileNamazTime(
                  vaqth: 'Subh',
                  time: state.value.subhTime.toString(),
                  onTapIcon: () {},
                  onTapTile: () {},
                ),
              ],
            ),
          );
            },
          ),
          20.verticalSpace,
          ElevatedButton.icon(
              onPressed: () {
                // namazTime();
              },
              icon: Icon(Icons.cloud_download_outlined),
              label: Text('Download'))
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:samthul_qibla/application/location_map/location_map_bloc.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/presentation/location_from_map/location_map_functions.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LocationMap extends StatelessWidget {
  LocationMap({Key? key}) : super(key: key);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(11.42796133580664, 75.085749655962),
    zoom: 0.0,
  );

  final Marker marker = const Marker(
    markerId: MarkerId('1'),
  );

  ValueNotifier<bool> isDrawerOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // BlocProvider.of<LocationMapBloc>(context)
    //     .add(const LocationMapEvent.refreshUI());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30.sp,
          ),
        ),
        title: Text(
          'QIBLA DIRECTION',
          style: GoogleFonts.poppins(
            color: Colors.black,
            letterSpacing: 3.5.w,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Icon(
              Icons.info_outline_rounded,
              color: Colors.black,
              size: 27.sp,
            ),
          )
        ],
      ),
      body: SlidingUpPanel(
        backdropEnabled: true,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 8.0.r,
            color: Color.fromRGBO(
              0,
              0,
              0,
              0.05,
            ),
          )
        ],
        onPanelOpened: () {
          isDrawerOpen.value = true;
        },
        onPanelClosed: () {
          isDrawerOpen.value = false;
        },
        minHeight: 65.h,
        maxHeight: 380.h,
        body: Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: selectedPosition,
              builder: ((context, value, _) {
                return GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  markers: {
                    Marker(
                      markerId: const MarkerId('Id-1'),
                      position: value,
                      icon: BitmapDescriptor.defaultMarker,
                      draggable: true,
                    )
                  },
                  mapToolbarEnabled: false,
                  onTap: (LatLng latLng) {
                    selectedPosition.value = latLng;
                    BlocProvider.of<LocationMapBloc>(context)
                        .add(const LocationMapEvent.getSamthFromMap());
                    // showResult(context);
                  },
                );
              }),
            ),
          ],
        ),
        // header:
        color: Colors.transparent,
        panel: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: BlocBuilder<LocationMapBloc, LocationMapState>(
              builder: (context, state) {
            return Wrap(
              children: [
                Column(
                  children: [
                    Container(
                      height: 4.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    3.verticalSpace,
                    ValueListenableBuilder(
                        valueListenable: isDrawerOpen,
                        builder: (context, value, _) {
                          return Container(
                              width: double.infinity,
                              height: 380.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0.r),
                                  topRight: Radius.circular(20.0.r),
                                ),
                                color: darkblue,
                              ),
                              child: !state.isLocationSelected
                                  ? isDrawerOpen.value
                                      ? Center(
                                          child: Text(
                                            "Select a location from Map",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: lightblue,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                            top: 12.h,
                                          ),
                                          child: Text(
                                            "Select a location from Map",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: lightblue,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        )
                                  : state.isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : state.isError
                                          ? Center(
                                              child: Text(
                                              'An Error Occured',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: lightblue,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ))
                                          : isDrawerOpen.value
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // SizedBox(
                                                    //   height:
                                                    //       size.height * 0.013,
                                                    // ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30.w),
                                                      child: Text(
                                                        state.address.address,
                                                        maxLines: 4,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            color: lightblue,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    25.verticalSpace,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_sharp,
                                                          color: lightblue,
                                                          size: 18.sp,
                                                        ),
                                                        7.horizontalSpace,
                                                        Text(
                                                          "Latitude :     ${state.value.latittude}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              color: lightblue,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    10.verticalSpace,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_sharp,
                                                          color: lightblue,
                                                          size: 18.sp,
                                                        ),
                                                        7.horizontalSpace,
                                                        Text(
                                                          "Longitude :     ${state.value.longitude}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              color: lightblue,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    25.verticalSpace,
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'QIBLA DIRECTION',
                                                          style: TextStyle(
                                                            color: lightblue,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        5.verticalSpace,
                                                        Text(
                                                          state.value
                                                              .samthulQibla,
                                                          style: TextStyle(
                                                              color: lightblue,
                                                              fontSize: 30.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                        10.verticalSpace,
                                                        Text(
                                                          state.value.direction,
                                                          style: TextStyle(
                                                              color: lightblue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14.sp),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 12.h,
                                                    right: 40.w,
                                                    left: 40.w,
                                                  ),
                                                  child: Text(
                                                    state.address.address,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                        color: lightblue,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ));
                        }),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

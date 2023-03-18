import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

ValueNotifier<LatLng> selectedPosition =
    ValueNotifier(const LatLng(37.42796133580664, -122.085749655962));

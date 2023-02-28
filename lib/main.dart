import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:samthul_qibla/domain/core/di/injectable.dart';
import 'package:samthul_qibla/presentation/material_app/material_app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

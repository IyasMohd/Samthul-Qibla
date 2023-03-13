import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:samthul_qibla/domain/core/di/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  getIt.init();
}

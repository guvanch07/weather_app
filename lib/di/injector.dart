import 'package:domain/di/injector.dart';
import 'package:presentation/di/injector.dart';
import 'package:data/di/injector.dart';
import 'package:data/datasource/local/init/init_hive.dart';

Future<void> initInjector() async {
  await initHive();
  await injectPresentationModule();
  await injectDomainModule();
  await injectDataModule();
}

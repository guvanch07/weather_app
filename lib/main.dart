import 'package:flutter/material.dart';
import 'package:presentation/pages/app.dart';
import 'package:weather_app_own_bloc/di/injector.dart';

void main() async {
  await initInjector();
  runApp(const MyApp());
}

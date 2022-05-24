import 'package:flutter/material.dart';
import 'package:presentation/core/colors/theme_app.dart';

abstract class Styles {
  static const TextStyle headline1 = TextStyle(
      fontSize: 80,
      fontWeight: FontWeight.w400,
      fontFamily: "Merriweather",
      color: AppColors.textMain);

  static const TextStyle headline2 = TextStyle(
    color: AppColors.textMain,
    fontSize: 30,
    fontWeight: FontWeight.w500,
    fontFamily: "Merriweather",
  );

  static const TextStyle headline3 = TextStyle(
    color: AppColors.textMain,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: "Merriweather",
  );
  static const TextStyle headline4 = TextStyle(
    color: AppColors.textMain,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: "Merriweather",
  );
}

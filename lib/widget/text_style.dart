import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:flutter/material.dart';

mixin AppTextStyle {
  static const primaryText =
      TextStyle(fontSize: 18, color: Colors.white, fontFamily: "SourceSansPro");
  static const chooseText = TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontFamily: "SourceSansPro");
  static TextStyle style(
          {double fontSize = 18,
          Color color = Colors.white,
          FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: "SourceSansPro",
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight);
  static const titleLarge = TextStyle(
    fontSize: 30,
    color: AppColors.black,
    fontFamily: "SourceSansPro",
    fontWeight: FontWeight.bold,
  );
  static const titleSmall = TextStyle(
    fontSize: 17,
    color: AppColors.dark,
    fontFamily: "SourceSansPro",
    fontWeight: FontWeight.w400,
  );
  static const changePassText = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontFamily: "SourceSansPro",
    fontWeight: FontWeight.bold,
  );
  static const signOutText = TextStyle(
    fontSize: 16,
    color: AppColors.primary,
    fontFamily: "SourceSansPro",
    fontWeight: FontWeight.bold,
  );
}

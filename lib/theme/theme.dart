import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The default theme configuration.
ThemeData defaultTheme = ThemeData(
    primaryColor: AppColors.primary,
    cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.w300))),
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    primaryIconTheme: const IconThemeData(color: Colors.white));

import 'package:doan_chuyen_nganh/UI/sign_in/student_login.dart';
import 'package:doan_chuyen_nganh/UI/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class ManagerRoutes {
  ManagerRoutes._();
  static String loginScreen = '/loginScreen';
  static String splashScreen = '/splasScreen';
  // MANAGERS
  static Map<String, Widget Function(BuildContext context)> manager = {
    loginScreen: (context) => const StudentLoginScreen(),
    splashScreen: (context) => const SplashScreen(),
  };
}

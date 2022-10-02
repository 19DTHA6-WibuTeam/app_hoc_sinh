import 'package:doan_chuyen_nganh/UI/sign_in_first_screen.dart';
import 'package:flutter/material.dart';

class ManagerRoutes {
  ManagerRoutes._();
  static String loginScreen = '/loginScreen';
  // MANAGERS
  static Map<String, Widget Function(BuildContext context)> manager = {
    loginScreen: (context) => const SignInFirstScreen(),
  };
}

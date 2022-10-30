import 'package:doan_chuyen_nganh/manager/shared_preferences.dart';

Future<bool> logout() async {
  await BaseSharedPreferences.remove('MaNguoiDung');
  await BaseSharedPreferences.remove('HoTen');
  await BaseSharedPreferences.remove('Email');
  await BaseSharedPreferences.remove('token');
  return true;
}

import 'package:doan_chuyen_nganh/manager/shared_preferences.dart';
import 'package:doan_chuyen_nganh/models/user.dart';

Future<bool> saveLogin(User user) async {
  await BaseSharedPreferences.setString('user_id', user.user_id);
  await BaseSharedPreferences.setString('user_fullname', user.user_fullname);
  await BaseSharedPreferences.setString('user_email', user.user_email);
  await BaseSharedPreferences.setString('user_token', user.user_token ?? '');
  return true;
}

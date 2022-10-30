import 'dart:convert';

import 'package:doan_chuyen_nganh/models/user.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:http/http.dart' as http;

Future<User?> getUser(Future<String> _userId, Future<String> _token) async {
  String userId = await _userId;
  String token = await _token;

  final response = await http.get(
      Uri.parse('${Dimens.API_URL}NguoiDung/$userId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      });

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['success'] == false) return null;
    return User.fromJson(data['data']);
  } else
    return null;
}

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

Future<bool> changePassword(
    Future<String> _token, String oldPass, String newPass) async {
  String token = await _token;
  var map = new Map<String, dynamic>();
  map['MatKhauCu'] = oldPass;
  map['MatKhauMoi'] = newPass;
  final response = await http.post(
    Uri.parse('${Dimens.API_URL}NguoiDung/DoiMatKhau'),
    headers: <String, String>{
      'Authorization': 'Bearer $token',
    },
    body: map,
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['success'];
  } else {
    return false;
  }
}

Future<List<User>?> getTutorList(Future<String> _token) async {
  String token = await _token;
  final response = await http.get(
      Uri.parse("${Dimens.API_URL}NguoiDung?LaGiaSu=1"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      });
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['success'] == false) return null;
    List<User> tutorList = [];
    for (var item in data['data']) {
      tutorList.add(User.fromJson(item));
    }

    return tutorList;
  } else {
    throw Exception('Failed to load subject list');
  }
}

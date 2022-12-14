import 'dart:convert';

import 'package:doan_chuyen_nganh/models/calender.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:http/http.dart' as http;

Future<List<CalenderData>?> getCalender(
    Future<String> _userId, Future<String> _token) async {
  String userId = await _userId;
  String token = await _token;
  final response = await http.get(
      Uri.parse("${Dimens.API_URL}ThoiKhoaBieu?k=MaHocSinh&v=$userId"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      });

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['success'] == false) return null;
    List<CalenderData> sessionList = [];
    for (var item in data['data']) {
      sessionList.add(CalenderData.fromJson(item));
    }
    return sessionList;
  } else {
    throw Exception('Failed to load subject list');
  }
}

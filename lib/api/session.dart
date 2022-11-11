import 'dart:convert';

import 'package:doan_chuyen_nganh/models/session.dart';

import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:http/http.dart' as http;

Future<List<Datum>?> getSessionList(
    Future<String> _userId, Future<String> _token) async {
  String userId = await _userId;
  String token = await _token;
  final response = await http.get(
      Uri.parse("${Dimens.API_URL}KhoaHoc?k=MaHocSinh&v=$userId"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      });

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['success'] == false) return null;
    List<Datum> sessionList = [];
    for (var item in data['data']) {
      sessionList.add(Datum.fromJson(item));
    }
    return sessionList;
  } else {
    throw Exception('Failed to load subject list');
  }
}

Future<Datum?> getSession(sessionId, Future<String> _token) async {
  String token = await _token;
  final response = await http.get(
      Uri.parse("${Dimens.API_URL}KhoaHoc/$sessionId"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      });

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['success'] == false) return null;

    return Datum.fromJson(data['data']);
  } else {
    throw Exception('Failed to load subject list');
  }
}

Future<bool> deleteSession(Future<String> _token, int sessionId) async {
  String token = await _token;
  final response = await http.delete(
      Uri.parse("${Dimens.API_URL}KhoaHoc/$sessionId"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      });

  if (response.statusCode == 200)
    return jsonDecode(response.body)['success'];
  else
    return false;
}

Future<bool> postSession(
    Future<String> _token,
    String maMonHoc,
    String khoiLop,
    String hoTen,
    String address,
    String sdt,
    String soTuan,
    String soTien,
    String maCahoc,
    String maThu,
    String ghiChu) async {
  String token = await _token;
  var map = new Map<String, dynamic>();
  map['MaMonHoc'] = maMonHoc;
  map['KhoiLop'] = khoiLop;
  map['HoTen'] = hoTen;
  map['DiaChi'] = address;
  map['SDT'] = sdt;
  map['SoTuan'] = soTuan;
  map['SoTien'] = soTien;
  map['MaCaHoc'] = maCahoc;
  map['MaThu'] = maThu;
  map['GhiChu'] = ghiChu;
  print(map);
  final response = await http.post(
    Uri.parse("${Dimens.API_URL}KhoaHoc"),
    headers: <String, String>{
      'Authorization': 'Bearer $token',
    },
    body: map,
  );
  print(response.body);
  if (response.statusCode == 200)
    return jsonDecode(response.body)['success'];
  else
    return false;
}

import 'dart:convert';

import 'package:doan_chuyen_nganh/models/time&subject.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:http/http.dart' as http;

Future<List<MonHoc>?> getSubjectList() async {
  final response = await http.get(Uri.parse("${Dimens.API_URL}ThongTinDangKy"));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['success'] == false) return null;
    List<MonHoc> subjectList = [];
    for (var item in data['data']['MonHoc']) {
      subjectList.add(MonHoc.fromJson(item));
    }

    return subjectList;
  } else {
    throw Exception('Failed to load subject list');
  }
}

Future<List<CaHoc>?> getSessionTimeList() async {
  final response = await http.get(Uri.parse("${Dimens.API_URL}ThongTinDangKy"));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['success'] == false) return null;
    List<CaHoc> sessionTimeList = [];
    for (var item in data['data']['CaHoc']) {
      sessionTimeList.add(CaHoc.fromJson(item));
    }
    return sessionTimeList;
  } else {
    throw Exception('Failed to load subject list');
  }
}

Future<List<SoTienBuoiHoc>?> getFeeList() async {
  final response = await http.get(Uri.parse("${Dimens.API_URL}ThongTinDangKy"));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['success'] == false) return null;
    List<SoTienBuoiHoc> feeList = [];
    for (var item in data['data']['SoTienBuoiHoc']) {
      feeList.add(SoTienBuoiHoc.fromJson(item));
    }
    return feeList;
  } else {
    throw Exception('Failed to load subject list');
  }
}

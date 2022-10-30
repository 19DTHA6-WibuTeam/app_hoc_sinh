import 'dart:convert';

import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:http/http.dart' as http;

Future<bool?> fetchRegister(String fullname, String email, String password,
    String address, String birthday, String gender, String phone) async {
  var map = new Map<String, dynamic>();
  map['HoTen'] = fullname;
  map['NgaySinh'] = birthday;
  map['GioiTinh'] = gender;
  map['DiaChi'] = address;
  map['SDT'] = phone;
  map['Email'] = email;
  map['MatKhau'] = password;

  final response = await http.post(
    Uri.parse('${Dimens.API_URL}NguoiDung/register'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    },
    body: map,
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['success'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return null;
    // throw Exception('Failed to load info');
  }
}

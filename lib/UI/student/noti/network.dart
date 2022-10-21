import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Network {
  static Future<String?> fetchUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final reponse = await http.get(uri, headers: headers);
      if (reponse.statusCode == 200) {
        return reponse.body;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}

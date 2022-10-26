import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = "";

class BaseClient {
  var client = http.Client();

  //Get
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'auth',
      'api_key': 'key',
    };
    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  //Post
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var headers = {
      'Authorization': 'auth',
      'api_key': 'key',
      'Content-Type': 'application/json',
    };
    var response = await client.post(url, body: payload, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  //Put
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var headers = {
      'Authorization': 'auth',
      'api_key': 'key',
      'Content-Type': 'application/json',
    };
    var response = await client.put(url, body: payload, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  //Delete
  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'auth',
      'api_key': 'key',
    };
    var response = await client.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}

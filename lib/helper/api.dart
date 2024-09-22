import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There is a problem with a status code: ${response.statusCode}");
    }
  }

  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "There is a problem with a status code: ${response.statusCode} and body: ${jsonDecode(response.body)}",
      );
    }
  }

  Future<dynamic> put({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      "Content-Type": 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    print("url = $url body = $body token = $token ");
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "There is a problem with a status code: ${response.statusCode} and body: ${jsonDecode(response.body)}",
      );
    }
  }
}

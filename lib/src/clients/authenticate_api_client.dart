import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tsumitabe_frontend/src/models/user.dart';

class AuthenticateAPIClient {
  Future<User?> me() async {
    final backendUrl = dotenv.env["BACKEND_URL"];
    if (backendUrl == null) {
      throw "環境変数にBACKEND_URLがありません";
    }
    final uri = Uri.parse('$backendUrl/api/login/');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      throw response.body;
    } else {
      throw response.body;
    }
  }

  Future<String?> login(String email, String password) async {
    final backendUrl = dotenv.env["BACKEND_URL"];
    if (backendUrl == null) {
      throw "環境変数にBACKEND_URLがありません";
    }

    var cookieJar = CookieJar();
    var dio = Dio();
    dio.interceptors.add(CookieManager(cookieJar));

    var response = await dio.get('$backendUrl/api/csrftoken/');

    List<Cookie> cookies =
        await cookieJar.loadForRequest(Uri.parse(backendUrl));
    String csrfToken = cookies.firstWhere((c) => c.name == 'csrftoken').value;
    print(csrfToken);

    final uri = Uri.parse('$backendUrl/api/login/');
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-CSRFToken': csrfToken
    };
    String body = json.encode({
      'email': email,
      'password': password,
      'csrfmiddlewaretoken': csrfToken
    });
    final response2 = await dio.post(
      '$backendUrl/api/login/',
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    // print(response2.body);
  }
}

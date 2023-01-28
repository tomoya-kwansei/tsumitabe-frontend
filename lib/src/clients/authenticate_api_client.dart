import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tsumitabe_frontend/src/models/authorization_token.dart';
import 'package:tsumitabe_frontend/src/models/user.dart';

class AuthenticateAPIClient {
  Future<User?> me(String token) async {
    final backendUrl = dotenv.env["BACKEND_URL"];
    if (backendUrl == null) {
      throw "環境変数にBACKEND_URLがありません";
    }
    var dio = Dio();
    final response = await dio.get('$backendUrl/api/login/',
        options: Options(headers: {"Authorization": "Token $token"}));
    if (response.statusCode == 200) {
      return User.fromJson(response.data as dynamic);
    } else {
      throw response.data;
    }
  }

  Future<AuthorizationToken> login(String email, String password) async {
    final backendUrl = dotenv.env["BACKEND_URL"];
    if (backendUrl == null) {
      throw "環境変数にBACKEND_URLがありません";
    }

    var cookieJar = CookieJar();
    var dio = Dio();
    dio.interceptors.add(CookieManager(cookieJar));

    var response = await dio.post('$backendUrl/api/api-token-auth/',
        data: <String, String>{"username": email, "password": password});
    return AuthorizationToken.fromJson(response.data);
  }
}

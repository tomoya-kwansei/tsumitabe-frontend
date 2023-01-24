import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tsumitabe_frontend/src/models/user.dart';

class UserAPIClient {
  Future<List<User>?> fetchList() async {
    final backendUrl = dotenv.env["BACKEND_URL"];
    if (backendUrl == null) {
      throw "環境変数にBACKEND_URLがありません";
    }
    final dio = Dio();
    final url = '$backendUrl/api/users';
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      try {
        final datas = response.data as List<dynamic>;
        final list = datas.map((e) => User.fromJson(e)).toList();
        return list;
      } catch (e) {
        throw e;
      }
    }
  }
}

import 'package:dio/dio.dart';
import 'package:tsumitabe_frontend/src/models/user.dart';

class UserAPIClient {
  Future<List<User>?> fetchList() async {
    final dio = Dio();
    const url = 'http://127.0.0.1:8000/api/users';
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

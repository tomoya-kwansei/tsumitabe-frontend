import 'package:tsumitabe_frontend/src/clients/user_client_api.dart';

class Repository {
  final api = UserAPIClient();
  dynamic fetchList() async {
    return await api.fetchList();
  }
}

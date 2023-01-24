import 'package:tsumitabe_frontend/src/clients/authenticate_api_client.dart';
import 'package:tsumitabe_frontend/src/clients/user_client_api.dart';

class Repository {
  final api = UserAPIClient();
  dynamic fetchList() async {
    return await api.fetchList();
  }
}

class AuthenticateRepository {
  final api = AuthenticateAPIClient();

  dynamic me() async {
    return await api.me();
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsumitabe_frontend/src/models/user.dart';
import 'package:tsumitabe_frontend/src/repositories/repository.dart';

final repositoryProvider = Provider((ref) => Repository());
final authenticateRepository = Provider((ref) => AuthenticateRepository());

final listProvider = FutureProvider<List<User>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return await repository.fetchList();
});

final meProvider = FutureProvider<User>((ref) async {
  final repository = ref.read(authenticateRepository);
  return await repository.me("");
});

final getSharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final dashboardProvider = FutureProvider<User>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");
  if (token == null) {
    throw NullThrownError();
  }
  final repository = ref.read(authenticateRepository);
  return await repository.me(token);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumitabe_frontend/src/models/user.dart';
import 'package:tsumitabe_frontend/src/repositories/repository.dart';

final repositoryProvider = Provider((ref) => Repository());

final listProvider = FutureProvider<List<User>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return await repository.fetchList();
});

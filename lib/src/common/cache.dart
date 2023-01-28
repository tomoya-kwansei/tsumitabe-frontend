import 'package:tsumitabe_frontend/src/models/user.dart';

class CacheClass {
  // Singleton Patternを実現
  static final CacheClass _instance = CacheClass._internal();
  CacheClass._internal();
  factory CacheClass() => _instance;

  // キャッシュで保持するデータ
  late User user;
}

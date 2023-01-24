import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumitabe_frontend/src/pages/login_page.dart';
import 'package:tsumitabe_frontend/src/pages/profile_page.dart';
import 'package:tsumitabe_frontend/src/view_model/provider.dart';
// import 'package:universal_platform/universal_platform.dart';

Future main() async {
  if (kDebugMode) {
    await dotenv.load(fileName: "assets/.env-local");
  } else {
    await dotenv.load(fileName: "assets/.env");
  }
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(meProvider);
    return MaterialApp(
      title: 'Tsumitabe',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: value.when(
          data: (data) {
            return ProfilePage();
          },
          error: (error, _) => LoginPage(),
          loading: () => const CircularProgressIndicator()),
    );
  }
}

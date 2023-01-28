import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumitabe_frontend/src/pages/dashboard_page.dart';
import 'package:tsumitabe_frontend/src/pages/login_page.dart';
// import 'package:universal_platform/universal_platform.dart';

Future main() async {
  if (kDebugMode) {
    await dotenv.load(fileName: "assets/.env-local");
  } else {
    await dotenv.load(fileName: "assets/.env");
  }
  runApp(const ProviderScope(child: TsumitabeApp()));
}

class TsumitabeApp extends StatelessWidget {
  const TsumitabeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tsumitabe',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        routes: <String, WidgetBuilder>{
          '/': (_) => new LoginPage(),
          '/dashboard': (_) => new DashboardPage(),
        });
  }
}

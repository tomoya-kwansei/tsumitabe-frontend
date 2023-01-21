import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumitabe_frontend/src/pages/login_page.dart';
// import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tsumitabe',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LoginPage(),
    );
  }
}

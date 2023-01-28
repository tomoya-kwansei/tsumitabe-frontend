import 'package:flutter/material.dart';
import 'package:tsumitabe_frontend/src/clients/authenticate_api_client.dart';
import 'package:tsumitabe_frontend/src/clients/user_client_api.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  String email = '';
  String password = '';
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tsumitabe App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Stack(
        children: [Text("Hello, World")],
      )),
    );
  }
}

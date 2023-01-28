import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumitabe_frontend/src/view_model/provider.dart';

import '../models/user.dart';

class DashboardPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User> user = ref.watch(dashboardProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tsumitabe App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: user.when(
          data: (data) => SafeArea(
                  child: Stack(
                children: [Text(data.email)],
              )),
          error: (error, _) => SafeArea(child: Text("Error: $error")),
          loading: () => SafeArea(child: CircularProgressIndicator())),
    );
  }
}

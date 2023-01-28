import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumitabe_frontend/src/components/profile_page/profile_widget.dart';
import 'package:tsumitabe_frontend/src/view_model/provider.dart';

class SafeAreaPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(getSharedPreferencesProvider);
    return Center(
        child: value.when(
      data: (prefs) {
        final token = prefs.getString("token");
        if (token == null) {
          Navigator.of(context).pushNamed("/login");
        } else {
          Navigator.of(context).pushNamed("/dashboard");
        }
      },
      loading: () => CircularProgressIndicator(),
      error: (error, _) => Text(error.toString()),
    ));
  }
}

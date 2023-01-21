import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumitabe_frontend/src/components/profile_page/profile_widget.dart';
import 'package:tsumitabe_frontend/src/view_model/provider.dart';

class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(listProvider);
    return Center(
        child: value.when(
      data: (data) {
        return ListView(
            children: data.map((user) => ProfileWidget(user: user)).toList());
      },
      loading: () => CircularProgressIndicator(),
      error: (error, _) => Text(error.toString()),
    ));
  }
}

import 'package:flutter/material.dart';

class PageList extends StatelessWidget {
  const PageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: const BoxDecoration(color: Colors.orange),
            child: const Text('Tsumitabe'),
          ),
          ListTile(
            title: const Text('プロファイル'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('環境設定'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

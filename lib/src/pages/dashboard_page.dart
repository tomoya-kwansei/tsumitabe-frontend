import 'package:flutter/material.dart';
import 'package:tsumitabe_frontend/src/common/cache.dart';
import 'package:tsumitabe_frontend/src/components/dashboard_page/dashboard_component.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = CacheClass().user;
    final tabBar = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tsumitabe App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(child: Container(child: DashboardComponent(user: user))),
        bottomNavigationBar: tabBar);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

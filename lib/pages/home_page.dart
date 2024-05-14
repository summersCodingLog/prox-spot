
import 'package:flutter/material.dart';
import 'package:prox_spot/pages/map_page.dart';

import '../service/location_service.dart';
import 'favorite_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List<Widget> _children = [
    const MapPage(),
    const FavoriteListPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    LocationService().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff154406),
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: ""
          )
        ],
      ),
    );
  }

}
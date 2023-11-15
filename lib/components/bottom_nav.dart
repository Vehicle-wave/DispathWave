import 'package:flutter/material.dart';
import 'package:wave_dispatch/pages/home.dart';
import 'package:wave_dispatch/pages/myload.dart';
import 'package:wave_dispatch/pages/profile_page.dart';
import 'package:wave_dispatch/utils/constants.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [DispatchHome(), MyProfile(), MyLoads()];
  void _onTapTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedFontSize: 11,
        unselectedIconTheme: IconThemeData(size: 14),
        backgroundColor: secondaryColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _onTapTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'My Load',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

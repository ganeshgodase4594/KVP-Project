import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kvp/screen/assesment.dart';
import 'package:kvp/screen/homescreen.dart';

import '../profilepage.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.blueAccent.withOpacity(0.5),
        height: 60,
        backgroundColor: Colors.transparent,
        items: _navigationItems,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}

final List<Widget> _screens = [
  const HomeScreen(),
  const AssessmentPage(),
  const ProfilePage(),
];

final List<Widget> _navigationItems = [
  const Icon(Icons.home),
  const Icon(Icons.assignment_add),
  const Icon(Icons.person)
];

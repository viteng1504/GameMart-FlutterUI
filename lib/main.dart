import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const GameMartApp());
}

class GameMartApp extends StatelessWidget {
  const GameMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameMart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A9B86)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [
      const HomeScreen(),
      Center(
        child: Text(
          'Library',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      Center(
        child: Text('Sales', style: Theme.of(context).textTheme.headlineMedium),
      ),
      Center(
        child: Text('Chat', style: Theme.of(context).textTheme.headlineMedium),
      ),
      Center(
        child: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screens = _buildScreens(context);
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.1))),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF0A9B86),
          unselectedItemColor: Colors.black,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.home_outlined, 0),
              activeIcon: _buildNavIcon(Icons.home_filled, 0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.grid_3x3_outlined, 1),
              activeIcon: _buildNavIcon(Icons.grid_3x3, 1),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.shopping_bag_outlined, 2),
              activeIcon: _buildNavIcon(Icons.shopping_bag, 2),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.message_outlined, 3),
              activeIcon: _buildNavIcon(Icons.message, 3),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.person_outline, 4),
              activeIcon: _buildNavIcon(Icons.person, 4),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedIndex == index
            ? const Color(0xFF0A9B86).withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(icon, size: 24),
    );
  }
}

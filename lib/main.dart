import 'package:flutter/material.dart';
import 'package:game_mart/screens/cart/my_cart_screen.dart';
import 'package:game_mart/screens/chat/chat_bot_screen.dart';
import 'package:game_mart/screens/home_screen.dart';
import 'package:game_mart/screens/profile/profile_screen.dart';
import 'package:game_mart/screens/search/category_screen.dart';

import 'screens/auth/splash_screen.dart';

void main() {
  runApp(const GameMartApp());
}

class GameMartApp extends StatelessWidget {
  const GameMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameMart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF149CFF)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
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

  // final List<Widget> _screens = const [
  //   HomeScreen(),
  //   ChatBotScreen(),
  //   MyOrdersScreen(),
  //   MyCartScreen(),
  //   ProfileScreen(),
  // ];
  final List<Widget> _screens = const [
    CategoryScreen(),
    MyCartScreen(),
    HomeScreen(),
    ChatBotScreen(),
    ProfileScreen(),
  ];

  final List<_NavItemData> _navItems = const [
    _NavItemData(icon: Icons.grid_view_rounded),
    _NavItemData(icon: Icons.shopping_cart_rounded),
    _NavItemData(icon: Icons.home_rounded),
    _NavItemData(icon: Icons.inventory_2_rounded),
    _NavItemData(icon: Icons.person_rounded),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF272E4C),

        extendBody: true,
        body: _screens[_selectedIndex],
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.only(left: 4, right: 4, bottom: 8),
          child: Container(
            height: 76,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF72778E),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _navItems.length,
                (index) => _ModernNavItem(
                  data: _navItems[index],
                  isSelected: _selectedIndex == index,
                  onTap: () => _onItemTapped(index),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ModernNavItem extends StatelessWidget {
  final _NavItemData data;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModernNavItem({
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF111111) : Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          data.icon,
          size: 25,
          color: isSelected ? Colors.white : const Color(0xFF111111),
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;

  const _NavItemData({required this.icon});
}

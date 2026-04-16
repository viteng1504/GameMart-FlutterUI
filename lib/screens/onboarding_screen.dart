import 'package:flutter/material.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'Discover Your Perfect\nGame Account',
      'description':
          'Browse thousands of verified game accounts across popular games.',
    },
    {
      'title': 'Safe and Trusted Trading',
      'description':
          'Buy and sell accounts securely with verified sellers and protected transactions.',
    },
    {
      'title': 'Smart Recommendations',
      'description':
          'Get AI-powered suggestions based on your gaming preferences.',
    },
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      setState(() {
        currentPage++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = pages[currentPage];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://api.builder.io/api/v1/image/assets/TEMP/7575479f93017167127c8a334d1cc1992df02020?width=804',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00E2D573),
                    Color(0xE0E2D573),
                    Color(0xFFE4D7C5),
                  ],
                  stops: [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Column(
                    children: [
                      Image.network(
                        'https://api.builder.io/api/v1/image/assets/TEMP/292aaa208a9582b4687d839acdbcc3a06d732545?width=494',
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'GameMart',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 3),
                  Text(
                    page['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    page['description']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6D6D6D),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? Colors.black
                              : Colors.white70,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        currentPage == pages.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

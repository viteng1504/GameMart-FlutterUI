import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: MediaQuery.of(context).size.height * 0.45,
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
            child: Column(
              children: [
                const Spacer(flex: 2),
                Column(
                  children: [
                    Image.network(
                      'https://api.builder.io/api/v1/image/assets/TEMP/292aaa208a9582b4687d839acdbcc3a06d732545?width=494',
                      width: 200,
                      height: 177,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'GameMart',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const OnboardingScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 4,
                        shadowColor: Colors.black.withOpacity(0.25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

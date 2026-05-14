import 'package:flutter/material.dart';
import 'package:game_mart/assets/app_asset.dart';

import '../../main.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  Widget otpBox() {
    return Container(
      width: 48,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(AppAsset.logo, fit: BoxFit.cover)),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white38,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(28, 36, 28, 36),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 52, 58, 79),
                        Color(0xFF6B75FF),
                      ],
                      stops: [0.09, 1],
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'We sent you a 4 digit code to verify your email address (user@gmail.com).\nEnter in the field below.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          otpBox(),
                          const SizedBox(width: 10),
                          otpBox(),
                          const SizedBox(width: 10),
                          otpBox(),
                          const SizedBox(width: 10),
                          otpBox(),
                        ],
                      ),
                      const SizedBox(height: 28),
                      const Text.rich(
                        TextSpan(
                          text: "Didn’t get the code? ",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          children: [
                            TextSpan(
                              text: "Resend",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Expires in 01:00',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 54, 49, 95),
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MainScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

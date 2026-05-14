import 'package:flutter/material.dart';

class OrderAddedScreen extends StatelessWidget {
  const OrderAddedScreen({super.key});

  static const Color bgColor = Color(0xFF28304F);
  static const Color textColor = Color(0xFFF5F6FF);

  static const String avatarUrl =
      'https://images.unsplash.com/photo-1578632767115-351597cf2477?q=80&w=300';

  static const String bannerUrl =
      'https://images.unsplash.com/photo-1542751371-adc38448a05e?q=80&w=800';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.4),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),

              const SizedBox(height: 20),

              // Avatar online
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    avatarUrl,
                    width: 96,
                    height: 96,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return Container(
                        width: 96,
                        height: 96,
                        alignment: Alignment.center,
                        color: Colors.white.withOpacity(0.1),
                        child: const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 96,
                        height: 96,
                        color: Colors.white.withOpacity(0.1),
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Center(
                child: Text(
                  'Your order has been\nadded to the account!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    height: 0.95,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Banner online
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.network(
                    bannerUrl,
                    width: 256,
                    height: 194,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return Container(
                        width: 256,
                        height: 194,
                        alignment: Alignment.center,
                        color: Colors.white.withOpacity(0.1),
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 194,
                        alignment: Alignment.center,
                        color: Colors.white.withOpacity(0.1),
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.white,
                          size: 36,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 26),

              const Center(
                child: Text(
                  'Arknights: Endfield Account\nCharacter Service Starter All Server',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor, fontSize: 14, height: 1.1),
                ),
              ),

              const SizedBox(height: 14),

              Center(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    '• Have a specific request in mind?\n'
                    '• Looking For 2~5 x 6* Characters\n'
                    '   like Yvonne + Laevatain/Last\n'
                    '   Rite/Gilberta and More?.',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      height: 1.18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: const Text(
                  'Tell us what you’re looking for and\n'
                  'we’ll assist you in finding the right\n'
                  'account.',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    height: 1.12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

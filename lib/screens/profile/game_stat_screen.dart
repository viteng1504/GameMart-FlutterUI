import 'package:flutter/material.dart';

class GameStatScreen extends StatelessWidget {
  const GameStatScreen({super.key});

  static const Color _bgColor = Color(0xFF252D4B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Container(
              width: double.infinity,
              color: _bgColor,
              padding: const EdgeInsets.fromLTRB(15, 22, 15, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _playtimeBadge(),
                  const SizedBox(height: 20),
                  const Text(
                    "Achievements: 60/100",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _achievementItem(
                    imageUrl:
                        "https://images.steamusercontent.com/ugc/1778338718706727319/C733F9F7742400D050460FA7A3E24E5E89CBA7EF/",
                    title: "Regenerated",
                    subtitle: "Acquire all Silk Hearts",
                  ),
                  _achievementItem(
                    imageUrl:
                        "https://images.steamusercontent.com/ugc/1778338718706727319/C733F9F7742400D050460FA7A3E24E5E89CBA7EF/",
                    title: "Connected",
                    subtitle: "Open all of Pharloom’s Bellways",
                  ),
                  _achievementItem(
                    imageUrl:
                        "https://images.steamusercontent.com/ugc/1778338718706727319/C733F9F7742400D050460FA7A3E24E5E89CBA7EF/",
                    title: "Resident",
                    subtitle: "Acquire your own Bellhome",
                  ),
                  _achievementItem(
                    imageUrl:
                        "https://images.steamusercontent.com/ugc/1778338718706727319/C733F9F7742400D050460FA7A3E24E5E89CBA7EF/",
                    title: "Heretic",
                    subtitle: "Defeat First Sinner",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 264,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://cdn.cloudflare.steamstatic.com/steam/apps/1030300/header.jpg",
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                color: Colors.black26,
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              );
            },
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),

          Positioned(
            left: 12,
            top: 38,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),

          Positioned(
            left: 30,
            bottom: 24,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://cdn.cloudflare.steamstatic.com/steam/apps/1030300/capsule_184x69.jpg",
                width: 82,
                height: 82,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            left: 160,
            right: 18,
            bottom: 57,
            child: Text(
              "Hollow Knight: Silksong\nTeam Cherry",
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 21,
                height: 1.15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          Positioned(
            left: 196,
            right: 0,
            bottom: 27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _platformIcon(Icons.sports_esports),
                const SizedBox(width: 17),
                _platformText("PS"),
                const SizedBox(width: 17),
                _platformIcon(Icons.window_rounded),
                const SizedBox(width: 19),
                Container(
                  width: 1,
                  height: 19,
                  color: Colors.white.withOpacity(0.35),
                ),
                const SizedBox(width: 3),
                const Icon(Icons.star, color: Color(0xFFFFC83D), size: 20),
                const SizedBox(width: 5),
                const Text(
                  "4.8",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _playtimeBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFE7E7E7),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        "Playtime: 50hrs",
        style: TextStyle(
          color: Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _achievementItem({
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3A1E25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.emoji_events,
                    color: Colors.white,
                    size: 38,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _platformIcon(IconData icon) {
    return Icon(icon, color: Colors.white, size: 21);
  }

  Widget _platformText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 19,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

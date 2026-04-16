import 'package:flutter/material.dart';

const Color kBackground = Color(0xFFF6F8FC);
const Color kCard = Colors.white;
const Color kTextPrimary = Color(0xFF111827);
const Color kTextSecondary = Color(0xFF6B7280);
const Color kAccent = Color.fromARGB(255, 180, 200, 78);
const Color kAccentSoft = Color(0xFFEEF2FF);

const String kProfileImage =
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=800&q=80';

final List<String> kFavoriteImages = [
  'https://images.unsplash.com/photo-1542751371-adc38448a05e?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1511512578047-dfb367046420?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1511882150382-421056c89033?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1593305841991-05c297ba4575?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1603481546579-65d935ba9cdd?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1605901309584-818e25960a8f?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1560253023-3ec5d502959f?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1535223289827-42f1e9919769?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1512446733611-9099a758e295?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1486572788966-cfd3df1f5b42?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1545239351-1141bd82e8a6?auto=format&fit=crop&w=800&q=80',
];

final List<String> kScreenshotImages = [
  'https://images.unsplash.com/photo-1542751110-97427bbecf20?auto=format&fit=crop&w=1200&q=80',
  'https://images.unsplash.com/photo-1511882150382-421056c89033?auto=format&fit=crop&w=1200&q=80',
  'https://images.unsplash.com/photo-1603481546579-65d935ba9cdd?auto=format&fit=crop&w=1200&q=80',
  'https://images.unsplash.com/photo-1511512578047-dfb367046420?auto=format&fit=crop&w=1200&q=80',
];

// --- 1. MÀN HÌNH CHÍNH (PROFILE) ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 88),
            _buildStats(),
            _buildGridMenu(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 230,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 154, 176, 84), Color.fromARGB(255, 185, 192, 66), Color.fromARGB(255, 130, 150, 40)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28),
            ),
          ),
        ),
        Positioned(
          top: 52,
          left: 16,
          child: _circleAction(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () {},
          ),
        ),
        Positioned(
          top: 52,
          right: 16,
          child: _circleAction(
            icon: Icons.logout_rounded,
            onTap: () => _showLogoutDialog(context),
          ),
        ),
        Positioned(
          bottom: -68,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.95),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 24,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(kProfileImage),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: kTextPrimary,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: kAccentSoft,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  "Premium Member",
                  style: TextStyle(
                    color: kAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _circleAction({required IconData icon, required VoidCallback onTap}) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: onTap,
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(child: _statCard("3", "game played", "this month")),
          const SizedBox(width: 12),
          Expanded(child: _statCard("5", "purchases", "this year")),
        ],
      ),
    );
  }

  Widget _statCard(String number, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x120F172A),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 26,
              color: kTextPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: kTextPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(color: kTextSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildGridMenu(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'icon': Icons.favorite_rounded,
        'title': 'Liked games',
        'page': const FavoriteScreen(),
      },
      {
        'icon': Icons.star_rounded,
        'title': 'Wishlist',
        'page': const WishlistScreen(),
      },
      {'icon': Icons.link_rounded, 'title': 'Linked accounts', 'page': null},
      {'icon': Icons.people_alt_rounded, 'title': 'Friends', 'page': null},
      {
        'icon': Icons.bar_chart_rounded,
        'title': 'Game stats',
        'page': GameStatsScreen(),
      },
      {
        'icon': Icons.crop_original_rounded,
        'title': 'Screenshots',
        'page': const ScreenshotsScreen(),
      },
      {
        'icon': Icons.local_activity_rounded,
        'title': 'My activity',
        'page': null,
      },
      {
        'icon': Icons.assignment_ind_rounded,
        'title': 'Edit profile',
        'page': const EditProfileScreen(),
      },
      {
        'icon': Icons.lock_outline_rounded,
        'title': 'Change Password',
        'page': null,
      },
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 22,
        crossAxisSpacing: 14,
        childAspectRatio: 0.85,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (items[index]['page'] != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => items[index]['page']),
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: kCard,
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x120F172A),
                  blurRadius: 24,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: kAccentSoft,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(items[index]['icon'], size: 26, color: kAccent),
                ),
                const SizedBox(height: 10),
                Text(
                  items[index]['title'],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.25,
                    fontWeight: FontWeight.w600,
                    color: kTextPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 30,
                offset: Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1F2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  color: Colors.redAccent,
                  size: 34,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                "You are going to logout",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: kTextPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Are you sure you want to continue?",
                textAlign: TextAlign.center,
                style: TextStyle(color: kTextSecondary, fontSize: 14),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        side: const BorderSide(color: Color(0xFFE5E7EB)),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: kTextPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.redAccent,
                        minimumSize: const Size.fromHeight(50),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 2. MÀN HÌNH EDIT PROFILE ---
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 190,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 173, 192, 65), Color.fromARGB(255, 189, 199, 94)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                ),
                Positioned(
                  top: 52,
                  left: 16,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -46,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x22000000),
                          blurRadius: 24,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(kProfileImage),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 62),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x120F172A),
                      blurRadius: 24,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: kTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _inputField("First Name", "Sabrina"),
                    _inputField("Last Name", "Aryan"),
                    _inputField("Username", "@Sabrina"),
                    _inputField("Email", "SabrinaAry208@gmail.com"),
                    _inputField("Phone Number", "+234 904 6470"),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: kAccent,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          "Update",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextField(
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: kTextSecondary),
          filled: true,
          fillColor: const Color(0xFFF8FAFC),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: kAccent, width: 1.4),
          ),
        ),
      ),
    );
  }
}

// --- 3. MÀN HÌNH GAME STATS ---
class GameStatsScreen extends StatelessWidget {
  final List<Map<String, String>> games = [
    {
      'name': 'PRAGMATA',
      'time': '10hrs played',
      'ach': '60/100',
      'progress': '0.6',
      'image':
          'https://images.unsplash.com/photo-1542751371-adc38448a05e?auto=format&fit=crop&w=600&q=80',
    },
    {
      'name': 'Hollow Knight: Silksong',
      'time': '50hrs played',
      'ach': '60/100',
      'progress': '0.6',
      'image':
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?auto=format&fit=crop&w=600&q=80',
    },
    {
      'name': 'RESIDENT EVIL REQUIEM',
      'time': '12hrs played',
      'ach': '60/100',
      'progress': '0.6',
      'image':
          'https://images.unsplash.com/photo-1603481546579-65d935ba9cdd?auto=format&fit=crop&w=600&q=80',
    },
    {
      'name': 'Monster Hunter: Wilds',
      'time': '143hrs played',
      'ach': '60/100',
      'progress': '0.6',
      'image':
          'https://images.unsplash.com/photo-1511882150382-421056c89033?auto=format&fit=crop&w=600&q=80',
    },
    {
      'name': 'ELDEN RING',
      'time': '80hrs played',
      'ach': '60/100',
      'progress': '0.6',
      'image':
          'https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=600&q=80',
    },
  ];

  GameStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: _modernAppBar(context, "Game Stats"),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x120F172A),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    game['image']!,
                    width: 68,
                    height: 68,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        game['name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: kTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        game['time']!,
                        style: const TextStyle(
                          color: kTextSecondary,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: LinearProgressIndicator(
                          minHeight: 8,
                          value: double.parse(game['progress']!),
                          backgroundColor: const Color(0xFFE5E7EB),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            kAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: kAccentSoft,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    game['ach']!,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: kAccent,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- 4. MÀN HÌNH FAVORITE ---
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: _modernAppBar(context, "Favorite"),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.72,
        ),
        itemCount: kFavoriteImages.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey[200],
            boxShadow: const [
              BoxShadow(
                color: Color(0x120F172A),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(kFavoriteImages[index], fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

// --- 5. MÀN HÌNH WISHLIST ---
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Black Myth: Wukong',
        'price': '\$59.99',
        'image':
            'https://images.unsplash.com/photo-1542751110-97427bbecf20?auto=format&fit=crop&w=600&q=80',
      },
      {
        'title': 'Star Wars Outlaws',
        'price': '\$69.99',
        'image':
            'https://images.unsplash.com/photo-1511882150382-421056c89033?auto=format&fit=crop&w=600&q=80',
      },
      {
        'title': 'Dragon’s Dogma 2',
        'price': '\$54.99',
        'image':
            'https://images.unsplash.com/photo-1511512578047-dfb367046420?auto=format&fit=crop&w=600&q=80',
      },
      {
        'title': 'Silent Hill 2',
        'price': '\$49.99',
        'image':
            'https://images.unsplash.com/photo-1603481546579-65d935ba9cdd?auto=format&fit=crop&w=600&q=80',
      },
      {
        'title': 'Avowed',
        'price': '\$59.99',
        'image':
            'https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=600&q=80',
      },
    ];

    return Scaffold(
      backgroundColor: kBackground,
      appBar: _modernAppBar(context, "Wishlist"),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x120F172A),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  items[index]['image']!,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  items[index]['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: kTextPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: kAccentSoft,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  items[index]['price']!,
                  style: const TextStyle(
                    color: kAccent,
                    fontWeight: FontWeight.w700,
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

// --- 6. MÀN HÌNH SCREENSHOTS ---
class ScreenshotsScreen extends StatelessWidget {
  const ScreenshotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: _modernAppBar(context, "Screenshots"),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kScreenshotImages.length,
        itemBuilder: (context, index) => Container(
          height: 210,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x120F172A),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.network(kScreenshotImages[index], fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget _modernAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(color: kTextPrimary, fontWeight: FontWeight.w800),
    ),
    backgroundColor: kBackground,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: kTextPrimary),
      onPressed: () => Navigator.pop(context),
    ),
  );
}

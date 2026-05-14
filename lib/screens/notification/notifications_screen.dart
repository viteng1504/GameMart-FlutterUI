import 'package:flutter/material.dart';
import 'package:game_mart/screens/notification/order_added_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const Color bgColor = Color(0xFF28304F);
  static const Color titleColor = Color(0xFFF3F4FF);
  static const Color subtitleColor = Color(0xFF777F9D);
  static const Color timeColor = Color(0xFF6E7692);

  final List<NotificationItem> items = const [
    NotificationItem(
      imageUrl: 'https://i.imgur.com/8Km9tLL.jpeg',
      title: 'Your order has been added to the\naccount.',
      subtitle: 'Arknights: Endfield',
      time: '2 hours ago',
    ),
    NotificationItem(
      imageUrl: 'https://i.imgur.com/YQ6Xo3R.jpeg',
      title: 'Your order has been added to the\naccount.',
      subtitle: 'Wuthering Waves',
      time: '2 hours ago',
    ),
    NotificationItem(
      imageUrl: 'https://i.imgur.com/Vx1QZ6v.jpeg',
      title: 'Your order has been added to the\naccount.',
      subtitle: 'Zenless Zone Zero',
      time: '2 hours ago',
    ),
    NotificationItem(
      imageUrl: 'https://i.imgur.com/7QKQZxF.jpeg',
      title: 'A new product has been added!',
      subtitle: 'Chaos Zero Nightmare',
      time: '1 day ago',
    ),
    NotificationItem(
      imageUrl: 'https://i.imgur.com/WxNkK7J.jpeg',
      title: 'A new product has been added!',
      subtitle: 'NIKKE: Goddess of Victory',
      time: '5 days ago',
    ),
    NotificationItem(
      imageUrl: 'https://i.imgur.com/0y8Ftya.jpeg',
      title: 'A product sale is about to end!',
      subtitle: 'Genshin Impact',
      time: '2 weeks ago',
    ),
    NotificationItem(
      imageUrl: 'https://i.imgur.com/xK9zT8N.jpeg',
      title: 'Your order has been added to the\naccount.',
      subtitle: 'Blue Archive',
      time: '3 weeks ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),

            const Text(
              'Notifications',
              style: TextStyle(
                color: titleColor,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 22),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 22),
                itemBuilder: (context, index) {
                  return NotificationTile(item: items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.item});

  final NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const OrderAddedScreen()),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              item.imageUrl,
              width: 74,
              height: 74,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.image, color: Colors.white54),
                );
              },
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: NotificationsScreen.titleColor,
                      fontSize: 16,
                      height: 1.15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      color: NotificationsScreen.subtitleColor,
                      fontSize: 14,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 8),

          Padding(
            padding: const EdgeInsets.only(top: 38),
            child: Text(
              item.time,
              style: const TextStyle(
                color: NotificationsScreen.timeColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String time;

  const NotificationItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.time,
  });
}

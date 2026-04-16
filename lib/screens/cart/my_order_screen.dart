import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  bool isOngoing = true;

  final List<OrderItem> ongoingOrders = [
    OrderItem(
      title: 'Fresh Starter - Sunna',
      subtitle: 'Zenless Zone Zero',
      price: 21.98,
      imageUrl:
          'https://images.unsplash.com/photo-1550745165-9bc0b252726f?q=80&w=400&auto=format&fit=crop',
    ),
    OrderItem(
      title: 'Hollow Knight: Silksong',
      subtitle: 'Base Game',
      price: 19.99,
      imageUrl:
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?q=80&w=400&auto=format&fit=crop',
    ),
    OrderItem(
      title: 'Character Service',
      subtitle: 'Arknights: Endfield',
      price: 10.99,
      imageUrl:
          'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  final List<OrderItem> completedOrders = [
    OrderItem(
      title: 'Starter Pack Alpha',
      subtitle: 'Wuthering Waves',
      price: 15.99,
      imageUrl:
          'https://images.unsplash.com/photo-1542751371-adc38448a05e?q=80&w=400&auto=format&fit=crop',
    ),
    OrderItem(
      title: 'Premium Account',
      subtitle: 'Honkai: Star Rail',
      price: 29.99,
      imageUrl:
          'https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final orders = isOngoing ? ongoingOrders : completedOrders;

    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: const Color(0xFFF4F4F4)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Color.fromARGB(0, 34, 34, 34),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'My Orders',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none,
                          color: Color(0xFF222222),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9DD4F6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isOngoing = true;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: isOngoing
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Ongoing',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isOngoing
                                      ? const Color(0xFF222222)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isOngoing = false;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: !isOngoing
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Completed',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: !isOngoing
                                      ? const Color(0xFF222222)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: orders.isEmpty
                        ? Center(
                            child: Text(
                              isOngoing
                                  ? 'No ongoing orders'
                                  : 'No completed orders',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: orders.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 14),
                            itemBuilder: (context, index) {
                              final item = orders[index];
                              return _OrderCard(
                                item: item,
                                buttonText: isOngoing
                                    ? 'Leave Review'
                                    : 'Buy Again',
                                onPressed: () {},
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final OrderItem item;
  final String buttonText;
  final VoidCallback onPressed;

  const _OrderCard({
    required this.item,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFB8B8B8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 64,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8A8A8A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '\$ ${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF222222),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 24,
                        child: ElevatedButton(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF12A8FF),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            buttonText,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
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
        ],
      ),
    );
  }
}

class OrderItem {
  final String title;
  final String subtitle;
  final double price;
  final String imageUrl;

  OrderItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
  });
}

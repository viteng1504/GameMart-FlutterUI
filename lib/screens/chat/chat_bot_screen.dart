import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  int selectedOrderIndex = 0;

  final List<_OrderOption> orders = [
    _OrderOption(
      orderId: '#92287157',
      deliveryType: 'Standard Delivery',
      itemCount: 3,
      status: 'Ordered',
      imageUrl:
          'https://images.unsplash.com/photo-1550745165-9bc0b252726f?q=80&w=400&auto=format&fit=crop',
    ),
    _OrderOption(
      orderId: '#92287157',
      deliveryType: 'Standard Delivery',
      itemCount: 2,
      status: 'Received',
      imageUrl:
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FB),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Container(
                color: const Color(0xFFF7F7F8),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBotBubble(),
                            const SizedBox(height: 22),
                            _buildOrderSelectionCard(),
                          ],
                        ),
                      ),
                    ),
                    _buildInputBar(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF2F4F8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.shopping_bag_rounded,
              color: Color(0xFF149CFF),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chat Bot',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF149CFF),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Customer Care Service',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3D3D3D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE8F6FF),
              border: Border.all(color: const Color(0xFFB9E5FF)),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_outlined,
                color: Color(0xFF149CFF),
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBotBubble() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 250),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFE9EEFA),
          borderRadius: BorderRadius.circular(
            14,
          ).copyWith(bottomLeft: const Radius.circular(4)),
        ),
        child: const Text(
          'Hello, Amanda! Welcome to Customer Care Service. We will be happy to help you. Please, provide us more details about your issue before we can start.',
          style: TextStyle(
            fontSize: 15,
            height: 1.55,
            color: Color(0xFF2C2C2C),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSelectionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F8),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E6EF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select one of your orders',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF222222),
            ),
          ),
          const SizedBox(height: 14),
          ...List.generate(
            orders.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == orders.length - 1 ? 0 : 12,
              ),
              child: _buildOrderItem(
                order: orders[index],
                isSelected: selectedOrderIndex == index,
                onTap: () {
                  setState(() {
                    selectedOrderIndex = index;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF149CFF),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFF149CFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required _OrderOption order,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? const Color(0xFF149CFF) : const Color(0xFFD9DEE8),
          width: isSelected ? 1.4 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: const Color(0xFF149CFF).withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              order.imageUrl,
              width: 76,
              height: 76,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Order ${order.orderId}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2A2A2A),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${order.itemCount} items',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4E4E4E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  order.deliveryType,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF7B7B7B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            order.status,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF222222),
                            ),
                          ),
                          if (order.status.toLowerCase() == 'received') ...[
                            const SizedBox(width: 8),
                            Container(
                              width: 22,
                              height: 22,
                              decoration: const BoxDecoration(
                                color: Color(0xFF149CFF),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: onTap,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        height: 34,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF149CFF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF149CFF),
                            width: 1.4,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          isSelected ? 'Selected' : 'Select',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF149CFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFFEAF0FF), const Color(0xFFDCE7FB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: const Border(top: BorderSide(color: Color(0xFFE1E6F2))),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Message',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF149CFF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _buildBottomIcon(Icons.image_outlined),
          const SizedBox(width: 12),
          _buildBottomIcon(Icons.menu_rounded),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF149CFF)),
      ),
      child: Icon(icon, color: const Color(0xFF149CFF), size: 24),
    );
  }
}

class _OrderOption {
  final String orderId;
  final String deliveryType;
  final int itemCount;
  final String status;
  final String imageUrl;

  _OrderOption({
    required this.orderId,
    required this.deliveryType,
    required this.itemCount,
    required this.status,
    required this.imageUrl,
  });
}

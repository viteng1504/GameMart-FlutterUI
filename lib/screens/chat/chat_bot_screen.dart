import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _issueKey = GlobalKey();
  final GlobalKey _orderKey = GlobalKey();
  final GlobalKey _connectingKey = GlobalKey();

  int step = 0;
  int selectedIssueIndex = 0;
  int selectedOrderIndex = 0;

  static const bgColor = Color(0xFF465173);
  static const headerColor = Color(0xFF28304F);
  static const cardColor = Color(0xFFF8F8FA);
  static const botBubbleColor = Color(0xFF303858);
  static const cyanColor = Color(0xFF16DAD2);

  final List<String> issues = [
    'Order issues',
    'Account Issues',
    'Payment Issues',
    'Technical Assistance',
    'Other',
  ];

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
      status: 'Recieved',
      imageUrl:
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  void _scrollTo(GlobalKey key) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = key.currentContext;
      if (context == null) return;

      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
        alignment: 0.08,
      );
    });
  }

  void _nextStep() {
    if (step == 0) {
      setState(() => step = 1);
      _scrollTo(_orderKey);
    } else if (step == 1) {
      setState(() => step = 2);
      _scrollTo(_connectingKey);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBotBubble(),
                    const SizedBox(height: 56),

                    if (step == 0)
                      Container(key: _issueKey, child: _buildIssueCard()),

                    if (step >= 1) ...[
                      _buildSelectedIssueBubble(),
                      const SizedBox(height: 12),
                      Container(
                        key: _orderKey,
                        child: _buildOrderSelectionCard(),
                      ),
                    ],

                    if (step >= 2) ...[
                      const SizedBox(height: 20),
                      _buildSelectedOrderBubble(),
                      const SizedBox(height: 170),
                      Container(
                        key: _connectingKey,
                        child: _buildConnectingAgent(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: headerColor,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                '09:41',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Spacer(),
              Icon(Icons.signal_cellular_alt, color: Colors.white, size: 16),
              SizedBox(width: 4),
              Icon(Icons.wifi, color: Colors.white, size: 16),
              SizedBox(width: 4),
              Icon(Icons.battery_full, color: Colors.white, size: 18),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: Color(0xFF273653),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shopping_bag_rounded,
                  color: cyanColor,
                  size: 18,
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
                        color: cyanColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Customer Care Service',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF24618A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.home_outlined,
                  color: cyanColor,
                  size: 26,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBotBubble() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 250),
      padding: const EdgeInsets.fromLTRB(12, 9, 12, 9),
      decoration: BoxDecoration(
        color: botBubbleColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        'Hello, Amanda! Welcome to\nCustomer Care Service. We will be\nhappy to help you. Please, provide\nus more details about your issue\nbefore we can start.',
        style: TextStyle(color: Colors.white, fontSize: 10, height: 1.55),
      ),
    );
  }

  Widget _buildIssueCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 10, 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What's your issue?",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF22232A),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 26),

          ...List.generate(issues.length, (index) {
            final isSelected = selectedIssueIndex == index;

            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: GestureDetector(
                onTap: () {
                  setState(() => selectedIssueIndex = index);
                },
                child: Container(
                  height: 33,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? cyanColor : Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: cyanColor),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSelected) ...[
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 13,
                          ),
                        ),
                        const SizedBox(width: 7),
                      ],
                      Text(
                        issues[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : cyanColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 33,
                  child: ElevatedButton(
                    onPressed: _nextStep,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cyanColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _buildCloseButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSelectionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select one of your orders',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF22232A),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 22),

          ...List.generate(orders.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _buildOrderItem(
                order: orders[index],
                isSelected: selectedOrderIndex == index,
                onTap: () {
                  setState(() => selectedOrderIndex = index);
                },
              ),
            );
          }),

          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 33,
                  child: ElevatedButton(
                    onPressed: _nextStep,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cyanColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _buildCloseButton(),
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
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: cyanColor, width: 1.2),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              order.imageUrl,
              width: 72,
              height: 62,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ClipRect(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Order ${order.orderId}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF22232A),
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F6F7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${order.itemCount} items',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    order.deliveryType,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        order.status,
                        style: const TextStyle(
                          color: Color(0xFF22232A),
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      if (order.status.toLowerCase().contains('recieved')) ...[
                        const SizedBox(width: 8),
                        Container(
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: cyanColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ],
                      const Spacer(),
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          width: 69,
                          height: 24,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: cyanColor),
                          ),
                          child: const Text(
                            'Select',
                            style: TextStyle(color: cyanColor, fontSize: 12),
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

  Widget _buildSelectedIssueBubble() {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
            decoration: BoxDecoration(
              color: cyanColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 19,
                  height: 19,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Icon(Icons.check, size: 12, color: Colors.black),
                ),
                const SizedBox(width: 8),
                Text(
                  issues[selectedIssueIndex],
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 9),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1578632767115-351597cf2477?q=80&w=200&auto=format&fit=crop',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedOrderBubble() {
    final order = orders[selectedOrderIndex];

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 246,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: cyanColor, width: 1.2),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                order.imageUrl,
                width: 72,
                height: 62,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ClipRect(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Order ${order.orderId}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF22232A),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          color: const Color(0xFFF6F6F7),
                          child: Text(
                            '${order.itemCount} items',
                            style: const TextStyle(fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      order.deliveryType,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF303030),
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      order.status,
                      style: const TextStyle(
                        color: Color(0xFF22232A),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
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

  Widget _buildConnectingAgent() {
    return Row(
      children: [
        const Text(
          '•••',
          style: TextStyle(
            color: cyanColor,
            fontSize: 22,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Text(
            'Connecting you with an agent',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildCloseButton() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: cyanColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Icon(Icons.close_rounded, color: Colors.white, size: 20),
    );
  }

  Widget _buildInputBar() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: headerColor,
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Message',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: cyanColor, fontSize: 14),
            ),
          ),
          _bottomIcon(Icons.image_outlined),
          const SizedBox(width: 12),
          _bottomIcon(Icons.menu_rounded),
        ],
      ),
    );
  }

  Widget _bottomIcon(IconData icon) {
    return Container(
      width: 23,
      height: 23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: cyanColor, width: 2),
      ),
      child: Icon(icon, color: cyanColor, size: 17),
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

import 'package:flutter/material.dart';
import 'package:game_mart/screens/checkout/checkout_screen.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final List<CartItem> cartItems = [
    CartItem(
      title: 'Fresh Starter - Sunna',
      subtitle: 'Zenless Zone Zero',
      price: 10.99,
      quantity: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1550745165-9bc0b252726f?q=80&w=400&auto=format&fit=crop',
    ),
    CartItem(
      title: 'Hollow Knight: Silksong',
      subtitle: 'Base Game',
      price: 19.99,
      quantity: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?q=80&w=400&auto=format&fit=crop',
    ),
    CartItem(
      title: 'Character Service',
      subtitle: 'Arknights: Endfield',
      price: 10.99,
      quantity: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  double get vat => 0.00;

  double get total => subtotal + vat;

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void clearAll() {
    setState(() {
      cartItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1D1D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: const Color(0xFFF6F6F6)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
                  child: Row(
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
                        child: Center(
                          child: Text(
                            'My Cart',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF222222),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none,
                          size: 24,
                          color: Color(0xFF222222),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        Expanded(
                          child: cartItems.isEmpty
                              ? const Center(
                                  child: Text(
                                    'Your cart is empty',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemCount: cartItems.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 12),
                                  itemBuilder: (context, index) {
                                    final item = cartItems[index];
                                    return _CartItemCard(
                                      item: item,
                                      onIncrease: () => increaseQuantity(index),
                                      onDecrease: () => decreaseQuantity(index),
                                      onDelete: () => removeItem(index),
                                    );
                                  },
                                ),
                        ),
                        const SizedBox(height: 10),
                        if (cartItems.isNotEmpty)
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: clearAll,
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Clear all',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 12),
                        _SummaryRow(
                          label: 'Sub-total',
                          value: '\$ ${subtotal.toStringAsFixed(2)}',
                          labelColor: const Color(0xFF9A9A9A),
                          valueColor: const Color(0xFF222222),
                        ),
                        const SizedBox(height: 12),
                        _SummaryRow(
                          label: 'VAT (%)',
                          value: '\$ ${vat.toStringAsFixed(2)}',
                          labelColor: const Color(0xFF9A9A9A),
                          valueColor: const Color(0xFF222222),
                        ),
                        const SizedBox(height: 14),
                        const Divider(thickness: 1, color: Color(0xFFE2E2E2)),
                        const SizedBox(height: 12),
                        _SummaryRow(
                          label: 'Total',
                          value: '\$ ${total.toStringAsFixed(2)}',
                          labelColor: const Color(0xFF6D6D6D),
                          valueColor: const Color(0xFF222222),
                          isBold: true,
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CheckoutScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF12A8FF),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Go To Checkout',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward, size: 20),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  const _CartItemCard({
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFD8D8D8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.imageUrl,
              width: 58,
              height: 58,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: onDelete,
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9A9A9A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF222222),
                        ),
                      ),
                      const Spacer(),
                      _QtyButton(icon: Icons.remove, onTap: onDecrease),
                      Container(
                        width: 28,
                        alignment: Alignment.center,
                        child: Text(
                          '${item.quantity}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF555555),
                          ),
                        ),
                      ),
                      _QtyButton(icon: Icons.add, onTap: onIncrease),
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

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD8D8D8)),
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Icon(icon, size: 12, color: const Color(0xFF7A7A7A)),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor;
  final Color valueColor;
  final bool isBold;

  const _SummaryRow({
    required this.label,
    required this.value,
    required this.labelColor,
    required this.valueColor,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontSize: 16,
      fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
      color: labelColor,
    );

    final valueStyle = TextStyle(
      fontSize: 22,
      fontWeight: isBold ? FontWeight.w800 : FontWeight.w700,
      color: valueColor,
    );

    return Row(
      children: [
        Text(label, style: labelStyle),
        const Spacer(),
        Text(value, style: valueStyle),
      ],
    );
  }
}

class CartItem {
  final String title;
  final String subtitle;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

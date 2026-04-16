import 'package:flutter/material.dart';

class GameProductDetailScreen extends StatefulWidget {
  const GameProductDetailScreen({super.key});

  @override
  State<GameProductDetailScreen> createState() =>
      _GameProductDetailScreenState();
}

class _GameProductDetailScreenState extends State<GameProductDetailScreen> {
  bool isAddedToCart = false;

  void _openAddToCartSheet() {
    int quantity = 1;
    const double unitPrice = 10.99;
    bool confirmed = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final totalPrice = (unitPrice * quantity).toStringAsFixed(2);

            return Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.fromLTRB(18, 14, 18, 20),
              decoration: BoxDecoration(
                color: const Color(0xFFDDECF8),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                child: confirmed
                    ? _AddedState(
                        key: const ValueKey('added_state'),
                        quantity: quantity,
                        totalPrice: totalPrice,
                        onContinue: () {
                          Navigator.pop(context);
                        },
                      )
                    : _ChooseAmountState(
                        key: const ValueKey('choose_state'),
                        quantity: quantity,
                        totalPrice: totalPrice,
                        onIncrease: () {
                          setModalState(() {
                            quantity++;
                          });
                        },
                        onDecrease: () {
                          if (quantity > 1) {
                            setModalState(() {
                              quantity--;
                            });
                          }
                        },
                        onConfirm: () {
                          setState(() {
                            isAddedToCart = true;
                          });
                          setModalState(() {
                            confirmed = true;
                          });
                        },
                      ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://api.builder.io/api/v1/image/assets/TEMP/7575479f93017167127c8a334d1cc1992df02020?width=804',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            bottom: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1511512578047-dfb367046420?q=80&w=300&auto=format&fit=crop',
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Arknights: Endfield',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'GRYPHLINE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.sports_esports,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.play_arrow, color: Colors.white, size: 16),
                          SizedBox(width: 10),
                          Icon(Icons.window, color: Colors.white, size: 16),
                        ],
                      ),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFFFACB3D), size: 18),
                    SizedBox(width: 4),
                    Text(
                      '4.8',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
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

  Widget _buildProductCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Products',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E1E1E),
            ),
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1550745165-9bc0b252726f?q=80&w=900&auto=format&fit=crop',
              width: 210,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Arknights: Endfield Account\nCharacter Service Starter All Server',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              height: 1.35,
              fontWeight: FontWeight.w500,
              color: Color(0xFF111111),
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BulletText('Have a specific request in mind?'),
                SizedBox(height: 4),
                _BulletText('Looking For 2~5 × 6* Characters'),
                SizedBox(height: 4),
                _BulletText('You can leave a note/order'),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Tell us what you’re looking for and\nwe’ll assist you in finding the right\naccount.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              height: 1.4,
              color: Color(0xFF222222),
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: _openAddToCartSheet,
              style: OutlinedButton.styleFrom(
                backgroundColor: isAddedToCart
                    ? const Color(0xFF1DA1F2)
                    : Colors.white,
                side: BorderSide(
                  color: const Color(0xFF1DA1F2),
                  width: isAddedToCart ? 0 : 1.7,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                isAddedToCart ? 'ADDED TO CART' : 'ADD TO CART',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: isAddedToCart ? Colors.white : const Color(0xFF1DA1F2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5), // nền mờ
                borderRadius: BorderRadius.circular(111),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: null,
        actions: null,
      ),
      body: SingleChildScrollView(
        child: Column(children: [_buildHeader(), _buildProductCard()]),
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String text;

  const _BulletText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      '• $text',
      style: const TextStyle(
        fontSize: 14,
        height: 1.35,
        color: Color(0xFF111111),
      ),
    );
  }
}

class _ChooseAmountState extends StatelessWidget {
  final int quantity;
  final String totalPrice;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onConfirm;

  const _ChooseAmountState({
    super.key,
    required this.quantity,
    required this.totalPrice,
    required this.onIncrease,
    required this.onDecrease,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 46,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Choose the amount:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111111),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://images.unsplash.com/photo-1550745165-9bc0b252726f?q=80&w=400&auto=format&fit=crop',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Amount: ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        width: 34,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Price: \$$totalPrice',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                _QuantityButton(icon: Icons.add, onTap: onIncrease),
                const SizedBox(height: 8),
                _QuantityButton(icon: Icons.remove, onTap: onDecrease),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 160,
          height: 42,
          child: ElevatedButton(
            onPressed: onConfirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1DA1F2),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            child: const Text(
              'Confirm',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

class _AddedState extends StatelessWidget {
  final int quantity;
  final String totalPrice;
  final VoidCallback onContinue;

  const _AddedState({
    super.key,
    required this.quantity,
    required this.totalPrice,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 46,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'Added item to cart!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111111),
          ),
        ),
        const SizedBox(height: 18),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://images.unsplash.com/photo-1550745165-9bc0b252726f?q=80&w=400&auto=format&fit=crop',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amount: $quantity',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Price: \$$totalPrice',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.shopping_cart, color: Color(0xFF1DA1F2), size: 42),
          ],
        ),
        const SizedBox(height: 22),
        TextButton(
          onPressed: onContinue,
          child: const Text(
            'Continue shopping?',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1DA1F2),
            ),
          ),
        ),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 54,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF7EC9F7)),
          ),
          child: Icon(icon, color: const Color(0xFF1DA1F2), size: 18),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedPayment = 0;
  final TextEditingController promoController = TextEditingController();

  @override
  void dispose() {
    promoController.dispose();
    super.dispose();
  }

  void _showSuccessPopup() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF18A72E),
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Color(0xFF18A72E),
                    size: 34,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF222222),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Your order has been placed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8A8A8A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF12A8FF),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Track Your Order',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaymentChip({
    required int index,
    required String label,
    required IconData icon,
  }) {
    final isSelected = selectedPayment == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = index;
        });
      },
      child: Container(
        height: 28,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF12A8FF) : Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF12A8FF)
                : const Color(0xFFE0E0E0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: isSelected ? Colors.white : const Color(0xFF12A8FF),
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : const Color(0xFF12A8FF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow({
    required String title,
    required String value,
    bool isTotal = false,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isTotal ? FontWeight.w500 : FontWeight.w400,
            color: isTotal ? const Color(0xFF5B5B5B) : const Color(0xFF9C9C9C),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: const Color(0xFF222222),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: const Color(0xFFF4F4F4)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 18, 14, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 22,
                          color: Color(0xFF222222),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'Checkout',
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
                          size: 22,
                          color: Color(0xFF222222),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildPaymentChip(
                        index: 0,
                        label: 'Card',
                        icon: Icons.credit_card,
                      ),
                      const SizedBox(width: 8),
                      _buildPaymentChip(
                        index: 1,
                        label: 'Cash',
                        icon: Icons.payments_outlined,
                      ),
                      const SizedBox(width: 8),
                      _buildPaymentChip(
                        index: 2,
                        label: 'Pay',
                        icon: Icons.apple,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE2E2E2)),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'VISA',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF222222),
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            '**** **** **** 2512',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF4B4B4B),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: Color(0xFF222222),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Order Summary',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildSummaryRow(title: 'Sub-total', value: '\$ 5,870'),
                  const SizedBox(height: 10),
                  _buildSummaryRow(title: 'VAT (%)', value: '\$ 0.00'),
                  const SizedBox(height: 12),
                  const Divider(thickness: 1, color: Color(0xFFE4E4E4)),
                  const SizedBox(height: 10),
                  _buildSummaryRow(
                    title: 'Total',
                    value: '\$ 5,950',
                    isTotal: true,
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFE0E0E0)),
                          ),
                          child: TextField(
                            controller: promoController,
                            decoration: const InputDecoration(
                              hintText: 'Enter promo code',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFB5B5B5),
                              ),
                              prefixIcon: Icon(
                                Icons.local_offer_outlined,
                                size: 16,
                                color: Color(0xFFC0C0C0),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 74,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF12A8FF),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: _showSuccessPopup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF12A8FF),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

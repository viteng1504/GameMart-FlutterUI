import 'package:flutter/material.dart';

class ReviewBottomSheet extends StatefulWidget {
  const ReviewBottomSheet({super.key});

  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  int rating = 5;
  final TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: MediaQuery.of(context).viewInsets.bottom + 22,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 62,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(height: 52),

          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFFEDEDED),
          ),

          const SizedBox(height: 42),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Please give your rating and also your review.',
              style: TextStyle(
                color: Color(0xFF8E8E8E),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    rating = starIndex;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    starIndex <= rating
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    color: const Color(0xFFFFA11B),
                    size: 36,
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: reviewController,
            maxLines: 5,
            style: const TextStyle(color: Colors.black87, fontSize: 15),
            decoration: InputDecoration(
              hintText: 'Write your review...',
              hintStyle: const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 16,
              ),
              contentPadding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFE1E1E1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF18D8D1),
                  width: 1.2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                final review = reviewController.text.trim();

                Navigator.pop(context);

                debugPrint('Rating: $rating');
                debugPrint('Review: $review');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 24, 126, 216),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

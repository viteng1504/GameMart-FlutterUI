import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const GenreCard({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F2333),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imageUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40,
                  height: 40,
                  color: Colors.white12,
                  child: const Icon(
                    Icons.image,
                    color: Colors.white54,
                    size: 22,
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:game_mart/screens/detail/game_product_detail_screen.dart';

class GameDetailScreen extends StatelessWidget {
  const GameDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeaderSection(),
              const SizedBox(height: 16),
              const _TagSection(),
              const SizedBox(height: 12),
              const _AboutSection(),
              const SizedBox(height: 20),
              const _PreviewImagesSection(),
              const SizedBox(height: 20),
              const _ProductsSection(),
              const SizedBox(height: 20),
              const _SimilarGamesSection(),
              const SizedBox(height: 20),
              const _ReviewsSection(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1542751371-adc38448a05e?q=80&w=1200&auto=format&fit=crop',
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
                    Colors.black.withOpacity(0.25),
                    Colors.black.withOpacity(0.85),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white.withOpacity(0.25),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            left: 18,
            right: 18,
            bottom: 18,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1511512578047-dfb367046420?q=80&w=300&auto=format&fit=crop',
                    width: 82,
                    height: 82,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Arknights: Endfield',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'GRYPHLINE',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      _PlatformRow(),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFFFFC940), size: 18),
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
}

class _PlatformRow extends StatelessWidget {
  const _PlatformRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.sports_esports, color: Colors.white, size: 18),
        SizedBox(width: 10),
        Icon(Icons.play_arrow, color: Colors.white, size: 18),
        SizedBox(width: 10),
        Icon(Icons.window, color: Colors.white, size: 18),
      ],
    );
  }
}

class _TagSection extends StatelessWidget {
  const _TagSection();

  @override
  Widget build(BuildContext context) {
    final tags = ['RPG', 'Sci-fi', 'Anime', 'Action'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 34,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.black, width: 1.8),
              ),
              alignment: Alignment.center,
              child: Text(
                tags[index],
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About game',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF222222),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Welcome to Talos-II, a world both magnificent and perilous. The first settlers overcame war and natural disasters, and after more than 150 years of relentless effort, they established a foothold, laying a new foundation for civilization and hope.',
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewImagesSection extends StatelessWidget {
  const _PreviewImagesSection();

  @override
  Widget build(BuildContext context) {
    final images = [
      'https://images.unsplash.com/photo-1542751371-adc38448a05e?q=80&w=1200&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1511512578047-dfb367046420?q=80&w=500&auto=format&fit=crop',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 140,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(images[0], height: 140, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(images[1], height: 140, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductsSection extends StatelessWidget {
  const _ProductsSection();

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'image':
            'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?q=80&w=600&auto=format&fit=crop',
        'title': 'Starter Account',
      },
      {
        'image':
            'https://images.unsplash.com/photo-1550745165-9bc0b252726f?q=80&w=600&auto=format&fit=crop',
        'title': 'Premium Account',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Products',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF222222),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const GameProductDetailScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            item['image']!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            item['title']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SimilarGamesSection extends StatelessWidget {
  const _SimilarGamesSection();

  @override
  Widget build(BuildContext context) {
    final games = [
      'https://images.unsplash.com/photo-1511512578047-dfb367046420?q=80&w=300&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1542751371-adc38448a05e?q=80&w=300&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?q=80&w=300&auto=format&fit=crop',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Similar games',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF222222),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children:
                games
                    .map(
                      (image) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(image, fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList()
                  ..removeLast(),
          ),
        ],
      ),
    );
  }
}

class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF222222),
            ),
          ),
          SizedBox(height: 14),
          _ReviewItem(),
          SizedBox(height: 18),
          _ReviewItem(),
          SizedBox(height: 18),
          _ReviewItem(),
        ],
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=200&auto=format&fit=crop',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Veronika',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF222222),
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xFFFFB400), size: 18),
                  Icon(Icons.star, color: Color(0xFFFFB400), size: 18),
                  Icon(Icons.star, color: Color(0xFFFFB400), size: 18),
                  Icon(Icons.star, color: Color(0xFFFFB400), size: 18),
                  Icon(Icons.star_half, color: Color(0xFFFFB400), size: 18),
                ],
              ),
              SizedBox(height: 6),
              Text(
                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  color: Color(0xFF555555),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:game_mart/screens/detail/game_detail_screen.dart';

import '../models/game_model.dart';
import '../widgets/game_card.dart';
import '../widgets/game_list_item.dart';
import '../widgets/genre_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search and Notification Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey[700],
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Badge(
                      label: const Text('1'),
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Recommended Section
            _buildSectionHeader(context, 'Recommended', ''),
            _buildRecommendedCarousel(context),
            const SizedBox(height: 24),
            // Featured Games Section
            _buildSectionHeader(context, 'Featured games', 'See All'),
            _buildFeaturedGamesCarousel(context),
            const SizedBox(height: 24),
            // Suggested for You Section
            _buildSectionHeader(context, 'Suggested for You', 'See All'),
            _buildSuggestedGamesCarousel(context),
            const SizedBox(height: 24),
            // Genres Section
            _buildGenresSection(context),
            const SizedBox(height: 24),
            // Paid Games Section
            _buildSectionHeader(context, 'Paid Games', 'See All'),
            _buildPaidGamesCarousel(context),
            const SizedBox(height: 24),
            // Products Section
            _buildSectionHeader(context, 'Products', 'See All'),
            _buildProductsCarousel(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    String action,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          if (action.isNotEmpty)
            GestureDetector(
              onTap: () {},
              child: Text(
                action,
                style: TextStyle(
                  color: const Color(0xFF0A9B86),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRecommendedCarousel(BuildContext context) {
    final List<String> images = [
      'https://api.builder.io/api/v1/image/assets/TEMP/505d1bc0ec6958b4ac6a358fa39f9aa871cc79f9?width=616',
      'https://api.builder.io/api/v1/image/assets/TEMP/b3f9a779b25709ebfb70812107c299be83a0f8e9?width=486',
      'https://api.builder.io/api/v1/image/assets/TEMP/7d4cf20dde48a00f97d0724810d0df72c4220485?width=486',
      'https://api.builder.io/api/v1/image/assets/TEMP/505d1bc0ec6958b4ac6a358fa39f9aa871cc79f9?width=616',
      'https://api.builder.io/api/v1/image/assets/TEMP/b3f9a779b25709ebfb70812107c299be83a0f8e9?width=486',
      'https://api.builder.io/api/v1/image/assets/TEMP/7d4cf20dde48a00f97d0724810d0df72c4220485?width=486',
      'https://api.builder.io/api/v1/image/assets/TEMP/505d1bc0ec6958b4ac6a358fa39f9aa871cc79f9?width=616',
      'https://api.builder.io/api/v1/image/assets/TEMP/b3f9a779b25709ebfb70812107c299be83a0f8e9?width=486',
      'https://api.builder.io/api/v1/image/assets/TEMP/7d4cf20dde48a00f97d0724810d0df72c4220485?width=486',
      'https://api.builder.io/api/v1/image/assets/TEMP/505d1bc0ec6958b4ac6a358fa39f9aa871cc79f9?width=616',
      'https://api.builder.io/api/v1/image/assets/TEMP/b3f9a779b25709ebfb70812107c299be83a0f8e9?width=486',
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const GameDetailScreen()),
        );
      },
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.error)),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedGamesCarousel(BuildContext context) {
    final games = GameModel.getFeaturedGames();

    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GameListItem(game: games[index]),
          );
        },
      ),
    );
  }

  Widget _buildSuggestedGamesCarousel(BuildContext context) {
    final games = GameModel.getSuggestedGames();

    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GameListItem(game: games[index]),
          );
        },
      ),
    );
  }

  Widget _buildGenresSection(BuildContext context) {
    final genres = [
      {'name': 'Adventure', 'icon': Icons.terrain},
      {'name': 'Action', 'icon': Icons.bolt},
      {'name': 'Sci-fi', 'icon': Icons.rocket},
      {'name': 'RPG', 'icon': Icons.shield},
      {'name': 'Singleplayer', 'icon': Icons.person},
      {'name': 'Multiplayer', 'icon': Icons.group},
      {'name': '2D', 'icon': Icons.dashboard},
      {'name': '3D', 'icon': Icons.view_in_ar},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Genres',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
            children: List.generate(genres.length, (index) {
              final genre = genres[index];
              return GenreCard(
                name: genre['name'] as String,
                icon: genre['icon'] as IconData,
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildPaidGamesCarousel(BuildContext context) {
    final games = GameModel.getPaidGames();

    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GameCard(game: games[index]),
          );
        },
      ),
    );
  }

  Widget _buildProductsCarousel(BuildContext context) {
    final games = GameModel.getProductGames();

    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GameCard(game: games[index]),
          );
        },
      ),
    );
  }
}

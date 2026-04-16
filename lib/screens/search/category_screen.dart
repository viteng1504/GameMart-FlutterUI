import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> genres = [
    {'title': 'Adventure', 'image': 'https://picsum.photos/100?1'},
    {'title': 'Action', 'image': 'https://picsum.photos/100?2'},
    {'title': 'Singleplayer', 'image': 'https://picsum.photos/100?3'},
    {'title': 'Multiplayer', 'image': 'https://picsum.photos/100?4'},
    {'title': 'Sci-fi', 'image': 'https://picsum.photos/100?5'},
    {'title': 'RPG', 'image': 'https://picsum.photos/100?6'},
    {'title': '2D', 'image': 'https://picsum.photos/100?7'},
    {'title': '3D', 'image': 'https://picsum.photos/100?8'},
    {'title': 'Pixel', 'image': 'https://picsum.photos/100?9'},
    {'title': 'Puzzle', 'image': 'https://picsum.photos/100?10'},
    {'title': 'Anime', 'image': 'https://picsum.photos/100?11'},
    {'title': 'Horror', 'image': 'https://picsum.photos/100?12'},
    {'title': 'Co-op', 'image': 'https://picsum.photos/100?13'},
    {'title': 'Visual Novel', 'image': 'https://picsum.photos/100?14'},
    {'title': 'Tower Defense', 'image': 'https://picsum.photos/100?15'},
    {'title': 'Sport', 'image': 'https://picsum.photos/100?16'},
    {'title': 'Role-play', 'image': 'https://picsum.photos/100?17'},
    {'title': 'Turn-based', 'image': 'https://picsum.photos/100?18'},
  ];

  final List<_GameCardData> recommendedGames = [
    _GameCardData(
      title: 'CounterSide',
      subtitle: 'RPG',
      image: 'https://picsum.photos/300/300?21',
    ),
    _GameCardData(
      title: 'Eternal Return',
      subtitle: '3D, Multiplayer',
      image: 'https://picsum.photos/300/300?22',
    ),
  ];

  final List<_GameCardData> newestProducts = [
    _GameCardData(
      title: 'Genshin Impact a...',
      subtitle: 'From 1.99\$',
      image: 'https://picsum.photos/300/300?23',
    ),
    _GameCardData(
      title: 'Arknight Endfield...',
      subtitle: 'From 1.99\$',
      image: 'https://picsum.photos/300/300?24',
    ),
  ];

  final List<_GameCardData> topSaleGames = [
    _GameCardData(
      title: 'Hollow Knight: Sil...',
      subtitle: 'From 1.99\$',
      image: 'https://picsum.photos/300/300?25',
    ),
    _GameCardData(
      title: 'Elden Ring',
      subtitle: 'From 1.99\$',
      image: 'https://picsum.photos/300/300?26',
    ),
  ];

  final List<_DiscoveryItemData> discoveryItems = [
    _DiscoveryItemData(
      banner: 'https://picsum.photos/800/300?31',
      avatar: 'https://picsum.photos/100/100?32',
      title: 'Arknights: Endfield',
      subtitle: 'GRYPHLINE',
    ),
    _DiscoveryItemData(
      banner: 'https://picsum.photos/800/300?33',
      avatar: 'https://picsum.photos/100/100?34',
      title: 'Chaos Zero Nightmare',
      subtitle: 'SMILEGATE',
    ),
    _DiscoveryItemData(
      banner: 'https://picsum.photos/800/300?35',
      avatar: 'https://picsum.photos/100/100?36',
      title: 'Upload Yourself',
      subtitle: 'SAVE THE WORLD',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFE9E7E7),
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 13, color: Color(0xFF595959)),
                prefixIcon: Icon(Icons.search, color: Colors.black87, size: 22),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFFE9E7E7),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.black87,
                  size: 22,
                ),
              ),
              Positioned(
                top: 9,
                right: 9,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      unselectedLabelColor: const Color(0xFF707070),
      indicatorColor: const Color(0xFF73D6CF),
      indicatorWeight: 2,
      dividerColor: Colors.transparent,
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      tabs: const [
        Tab(text: 'Genres'),
        Tab(text: 'For You'),
        Tab(text: 'Discovery'),
      ],
    );
  }

  Widget _buildSectionHeader(String title, {String? action}) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        if (action != null)
          Text(
            action,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2EAFA7),
            ),
          ),
      ],
    );
  }

  Widget _buildGenresTab() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 16, bottom: 20),
      itemCount: genres.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 12,
        childAspectRatio: 2.15,
      ),
      itemBuilder: (context, index) {
        final item = genres[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  item['image']!,
                  width: 22,
                  height: 22,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item['title']!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHorizontalGameList(List<_GameCardData> items) {
    return SizedBox(
      height: 168,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            width: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item.image,
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF444444),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildForYouTab() {
    return ListView(
      padding: const EdgeInsets.only(top: 16, bottom: 20),
      children: [
        _buildSectionHeader('Recommended games', action: 'See All'),
        const SizedBox(height: 10),
        _buildHorizontalGameList(recommendedGames),
        const SizedBox(height: 16),
        _buildSectionHeader('Newest products', action: 'See All'),
        const SizedBox(height: 10),
        _buildHorizontalGameList(newestProducts),
        const SizedBox(height: 16),
        _buildSectionHeader('Top sale games', action: 'See All'),
        const SizedBox(height: 10),
        _buildHorizontalGameList(topSaleGames),
      ],
    );
  }

  Widget _buildDiscoveryCard(_DiscoveryItemData item, {bool isLast = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            item.banner,
            width: double.infinity,
            height: 124,
            fit: BoxFit.cover,
          ),
        ),
        if (!isLast) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item.avatar,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildDiscoveryTab() {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16, bottom: 20),
      itemCount: discoveryItems.length,
      separatorBuilder: (_, __) => const SizedBox(height: 18),
      itemBuilder: (context, index) {
        final item = discoveryItems[index];
        return _buildDiscoveryCard(
          item,
          isLast: index == discoveryItems.length - 1,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
          child: Column(
            children: [
              _buildSearchBar(),
              const SizedBox(height: 10),
              _buildTabBar(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildGenresTab(),
                    _buildForYouTab(),
                    _buildDiscoveryTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameCardData {
  final String title;
  final String subtitle;
  final String image;

  _GameCardData({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

class _DiscoveryItemData {
  final String banner;
  final String avatar;
  final String title;
  final String subtitle;

  _DiscoveryItemData({
    required this.banner,
    required this.avatar,
    required this.title,
    required this.subtitle,
  });
}

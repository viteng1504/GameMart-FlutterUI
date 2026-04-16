class Game {
  final String id;
  final String name;
  final String developer;
  final String coverImage;
  final String? iconImage;
  final String? price;
  final double rating;

  Game({
    required this.id,
    required this.name,
    required this.developer,
    required this.coverImage,
    this.iconImage,
    this.price,
    this.rating = 4.5,
  });
}

class GameModel {
  static List<Game> getFeaturedGames() {
    return [
      Game(
        id: '1',
        name: 'Arknights: Endfield',
        developer: 'GRYPHLINE',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/d5984a9891c5f21bfe23456752c724e3e317f491?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/a61bb7742ed5dc92ca7c860f740223f8121e1e99?width=152',
      ),
      Game(
        id: '2',
        name: 'Arknights',
        developer: 'HYPERGRYPH',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/d5984a9891c5f21bfe23456752c724e3e317f491?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/a61bb7742ed5dc92ca7c860f740223f8121e1e99?width=152',
      ),
      Game(
        id: '3',
        name: 'Genshin Impact',
        developer: 'HOYOVERSE',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/d5984a9891c5f21bfe23456752c724e3e317f491?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/a61bb7742ed5dc92ca7c860f740223f8121e1e99?width=152',
      ),
      Game(
        id: '4',
        name: 'NIKKE: Goddess of Victory',
        developer: 'SHIFTUP',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/d5984a9891c5f21bfe23456752c724e3e317f491?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/a61bb7742ed5dc92ca7c860f740223f8121e1e99?width=152',
      ),
      Game(
        id: '5',
        name: 'Chaos Zero Nightmare',
        developer: 'SMILEGATE',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/d5984a9891c5f21bfe23456752c724e3e317f491?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/a61bb7742ed5dc92ca7c860f740223f8121e1e99?width=152',
      ),
      Game(
        id: '6',
        name: 'Blue Archive',
        developer: 'NEXON',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/d5984a9891c5f21bfe23456752c724e3e317f491?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/a61bb7742ed5dc92ca7c860f740223f8121e1e99?width=152',
      ),
      Game(
        id: '7',
        name: 'Wuthering Waves',
        developer: 'KUROGAME',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/d5984a9891c5f21bfe23456752c724e3e317f491?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/a61bb7742ed5dc92ca7c860f740223f8121e1e99?width=152',
      ),
      Game(
        id: '8',
        name: 'Zenless Zone Zero',
        developer: 'HOYOVERSE',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/d5984a9891c5f21bfe23456752c724e3e317f491?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/a61bb7742ed5dc92ca7c860f740223f8121e1e99?width=152',
      ),
      Game(
        id: '9',
        name: 'Honkai: Star Rail',
        developer: 'HOYOVERSE',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/d5984a9891c5f21bfe23456752c724e3e317f491?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/a61bb7742ed5dc92ca7c860f740223f8121e1e99?width=152',
      ),
    ];
  }

  static List<Game> getSuggestedGames() {
    return [
      Game(
        id: '10',
        name: 'Neural Cloud',
        developer: 'DARKWINTER',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b666b981d339ff1af5e986ee4dd6e9c7c841d59c?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/581159719fe042f5baaef36e4cad80af7dee4569?width=152',
      ),
      Game(
        id: '11',
        name: 'Honkai Impact 3rd',
        developer: 'HOYOVERSE',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b666b981d339ff1af5e986ee4dd6e9c7c841d59c?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/581159719fe042f5baaef36e4cad80af7dee4569?width=152',
      ),
      Game(
        id: '1',
        name: 'Arknights: Endfield',
        developer: 'GRYPHLINE',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b666b981d339ff1af5e986ee4dd6e9c7c841d59c?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/581159719fe042f5baaef36e4cad80af7dee4569?width=152',
      ),
      Game(
        id: '2',
        name: 'Arknights',
        developer: 'HYPERGRYPH',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b666b981d339ff1af5e986ee4dd6e9c7c841d59c?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/581159719fe042f5baaef36e4cad80af7dee4569?width=152',
      ),
      Game(
        id: '3',
        name: 'Genshin Impact',
        developer: 'HOYOVERSE',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b666b981d339ff1af5e986ee4dd6e9c7c841d59c?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/581159719fe042f5baaef36e4cad80af7dee4569?width=152',
      ),
      Game(
        id: '4',
        name: 'NIKKE: Goddess of Victory',
        developer: 'SHIFTUP',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b666b981d339ff1af5e986ee4dd6e9c7c841d59c?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/581159719fe042f5baaef36e4cad80af7dee4569?width=152',
      ),
      Game(
        id: '5',
        name: 'Chaos Zero Nightmare',
        developer: 'SMILEGATE',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b666b981d339ff1af5e986ee4dd6e9c7c841d59c?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/581159719fe042f5baaef36e4cad80af7dee4569?width=152',
      ),
    ];
  }

  static List<Game> getPaidGames() {
    return [
      Game(
        id: '20',
        name: 'Arknights: Endfie...',
        developer: '',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/9711e7069b45271c25c9ddf5caf7812a9d60e1bf?width=330',
        price: '1.99\$',
      ),
      Game(
        id: '21',
        name: 'Honkai Star Rail R..',
        developer: '',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/9711e7069b45271c25c9ddf5caf7812a9d60e1bf?width=330',
        price: '1.99\$',
      ),
      Game(
        id: '22',
        name: 'Genshin Impact Zi...',
        developer: '',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/9711e7069b45271c25c9ddf5caf7812a9d60e1bf?width=330',
        price: '5.99\$',
      ),
      Game(
        id: '23',
        name: 'Chaos Zero Night...',
        developer: '',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/9711e7069b45271c25c9ddf5caf7812a9d60e1bf?width=330',
        price: '1.99\$',
      ),
      Game(
        id: '24',
        name: 'Blue Archive Res...',
        developer: '',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/9711e7069b45271c25c9ddf5caf7812a9d60e1bf?width=330',
        price: '1.99\$',
      ),
    ];
  }

  static List<Game> getProductGames() {
    return [
      Game(
        id: '30',
        name: 'Hollow Knight: Silksong',
        developer: 'Team Cherry',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/7d43205423e34162cfccf49d6caf63ff5573ac44?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b5834075fe4d530fcc8748bcb58ddcc5ad28e0a9?width=152',
      ),
      Game(
        id: '31',
        name: 'Clair Obscur: Expedition 33',
        developer: 'Sandfall Interactive',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/7d43205423e34162cfccf49d6caf63ff5573ac44?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b5834075fe4d530fcc8748bcb58ddcc5ad28e0a9?width=152',
      ),
      Game(
        id: '32',
        name: 'Balatro',
        developer: 'LocalThunk',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/7d43205423e34162cfccf49d6caf63ff5573ac44?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b5834075fe4d530fcc8748bcb58ddcc5ad28e0a9?width=152',
      ),
      Game(
        id: '33',
        name: 'ELDEN RING',
        developer: 'FromSoftware',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/7d43205423e34162cfccf49d6caf63ff5573ac44?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b5834075fe4d530fcc8748bcb58ddcc5ad28e0a9?width=152',
      ),
      Game(
        id: '34',
        name: 'Resident Evil Requiem',
        developer: 'CAPCOM',
        coverImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/7d43205423e34162cfccf49d6caf63ff5573ac44?width=522',
        iconImage:
            'https://api.builder.io/api/v1/image/assets/TEMP/b5834075fe4d530fcc8748bcb58ddcc5ad28e0a9?width=152',
      ),
    ];
  }
}

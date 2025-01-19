class Game {
  final int gameId;
  final List<GameGroup> groups;

  Game({required this.gameId, required this.groups});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      gameId: json['gameId'],
      groups: (json['groups'] as List)
          .map((group) => GameGroup.fromJson(group))
          .toList(),
    );
  }
}

class GameGroup {
  final String title;
  final List<String> items;
  final String color;

  GameGroup({required this.title, required this.items, required this.color});

  factory GameGroup.fromJson(Map<String, dynamic> json) {
    return GameGroup(
      title: json['title'],
      items: List<String>.from(json['items']),
      color: json['color'],
    );
  }

  bool containsAllItems(List<String> items) {
    return items.every((item) => this.items.contains(item.toUpperCase()));
  }

  bool hasItem(String item) {
    return items.any((groupItem) => 
      groupItem.toUpperCase() == item.toUpperCase());
  }
}

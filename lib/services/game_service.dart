import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/game_model.dart';

class GameService {
  Future<Game> loadGame(int gameId) async {
    final String jsonString = await rootBundle.loadString('lib/games.json');
    final jsonData = json.decode(jsonString);
    final games = (jsonData['games'] as List)
        .map((game) => Game.fromJson(game))
        .toList();
    
    return games.firstWhere((game) => game.gameId == gameId);
  }

  List<String> getAllGameWords(Game game) {
    List<String> allWords = [];
    for (var group in game.groups) {
      allWords.addAll(group.items);
    }
    allWords.shuffle(); // Randomize the initial order
    return allWords;
  }
}

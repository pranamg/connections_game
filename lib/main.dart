import 'package:flutter/material.dart';
import 'components/game_header.dart';
import 'components/name_grid.dart';
import 'components/mistakes_indicator.dart';
import 'components/action_buttons.dart';
import 'models/game_model.dart';
import 'services/game_service.dart';
import 'components/completed_groups.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Names Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GameService _gameService = GameService();
  late Future<Game> _gameFuture;
  List<String> names = [];
  int mistakesRemaining = 5;
  final List<String> selectedNames = [];
  final List<GameGroup> completedGroups = [];
  Game? currentGame;
  bool _shouldShake = false;

  @override
  void initState() {
    super.initState();
    _gameFuture = _loadGame();
  }

  Future<Game> _loadGame() async {
    final game = await _gameService.loadGame(1);
    currentGame = game;
    names = _gameService.getAllGameWords(game);
    return game;
  }

  void _toggleSelection(String name) {
    setState(() {
      if (selectedNames.contains(name)) {
        selectedNames.remove(name);
      } else if (selectedNames.length < 4) {
        selectedNames.add(name);
      }
    });
  }

  void _deselectAll() {
    setState(() {
      selectedNames.clear();
    });
  }

  void _onSubmit() {
    if (selectedNames.length != 4 || currentGame == null) return;

    for (var group in currentGame!.groups) {
      if (group.containsAllItems(selectedNames) &&
          !completedGroups.contains(group)) {
        setState(() {
          completedGroups.add(group);
          names.removeWhere((name) => 
            group.hasItem(name));
          selectedNames.clear();
          _shouldShake = false;
        });
        return;
      }
    }

    // If we get here, the selection was incorrect
    setState(() {
      mistakesRemaining--;
      selectedNames.clear();
      _shouldShake = true;
    });

    // Reset shake after animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _shouldShake = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.lightbulb),
          Icon(Icons.bar_chart),
          Icon(Icons.help),
        ],
      ),
      body: FutureBuilder<Game>(
        future: _gameFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const GameHeader(),
                if (completedGroups.isNotEmpty)
                  CompletedGroups(completedGroups: completedGroups),
                const SizedBox(height: 16),
                NameGrid(
                  names: names,
                  selectedNames: selectedNames,
                  onNameSelected: _toggleSelection,
                  shake: _shouldShake,
                ),
                const SizedBox(height: 16),
                MistakesIndicator(mistakesRemaining: mistakesRemaining),
                const SizedBox(height: 16),
                ActionButtons(
                  onShuffle: () {
                    setState(() {
                      names.shuffle();
                    });
                  },
                  onDeselectAll: _deselectAll,
                  onSubmit: _onSubmit,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

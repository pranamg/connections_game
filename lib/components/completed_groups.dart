import 'package:flutter/material.dart';
import '../models/game_model.dart';

class CompletedGroups extends StatelessWidget {
  final List<GameGroup> completedGroups;

  const CompletedGroups({
    super.key,
    required this.completedGroups,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,  // Make children full width
      children: completedGroups.map((group) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(int.parse(group.color.replaceFirst('#', '0xFF'))),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                group.title.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                group.items.join(', '),
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

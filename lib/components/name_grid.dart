import 'package:flutter/material.dart';
import 'shake_widget.dart';

class NameGrid extends StatelessWidget {
  final List<String> names;
  final List<String> selectedNames;
  final Function(String) onNameSelected;
  final bool shake;

  const NameGrid({
    super.key,
    required this.names,
    required this.selectedNames,
    required this.onNameSelected,
    this.shake = false,
  });

  @override
  Widget build(BuildContext context) {
    return ShakeWidget(
      shake: shake,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: names.map((name) {
          final bool isSelected = selectedNames.contains(name);
          return ElevatedButton(
            onPressed: () => onNameSelected(name),
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.blue[200] : Colors.grey[200],
              padding: const EdgeInsets.all(12),
            ),
            child: Text(name),
          );
        }).toList(),
      ),
    );
  }
}

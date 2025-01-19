
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onShuffle;
  final VoidCallback onDeselectAll;
  final VoidCallback onSubmit;

  const ActionButtons({
    super.key,
    required this.onShuffle,
    required this.onDeselectAll,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(onPressed: onShuffle, child: const Text("Shuffle")),
        ElevatedButton(onPressed: onDeselectAll, child: const Text("Deselect All")),
        ElevatedButton(onPressed: onSubmit, child: const Text("Submit")),
      ],
    );
  }
}
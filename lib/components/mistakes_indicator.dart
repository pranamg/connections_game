
import 'package:flutter/material.dart';

class MistakesIndicator extends StatelessWidget {
  final int mistakesRemaining;

  const MistakesIndicator({super.key, required this.mistakesRemaining});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        mistakesRemaining,
        (index) => const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            radius: 4,
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
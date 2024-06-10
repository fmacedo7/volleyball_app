import 'package:flutter/material.dart';

class EndGameScore extends StatelessWidget {
  final String teamName;
  final int aceScore;
  final int attackScore;
  final int blockScore;
  final int errorScore;
  final int finalScore;

  const EndGameScore(
      {super.key,
      required this.teamName,
      required this.aceScore,
      required this.attackScore,
      required this.blockScore,
      required this.errorScore,
      required this.finalScore,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          teamName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Container(
          color: Colors.black45,
          height: 1.5,
          width: 50,
        ),
        Text('ACE: $aceScore'),
        Text('Attack: $aceScore'),
        Text('Block: $blockScore'),
        Text('Error: $errorScore'),
        Text('Final Score: $finalScore'),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class VolleyTeams extends StatelessWidget {
  final String teamName;
  final int numberPlayers;
  final double screenWidth;
  final VoidCallback onPressed;

  const VolleyTeams(
      {super.key,
      required this.teamName,
      required this.numberPlayers,
      required this.screenWidth, required this.onPressed,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          teamName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.yellowAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            numberPlayers.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.white,
            ),
          ),
        ),
        const RotatedBox(
          quarterTurns: 3,
          child: Text(
            'players',
            style: TextStyle(
              fontSize: 10,
              color: Colors.yellowAccent,
            ),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.03,
        ),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.delete_forever),),
      ],
    );
  }
}

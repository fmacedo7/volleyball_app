import 'package:flutter/material.dart';
import 'package:volleyball/ui/widgets/end_game_score.dart';
import 'dart:ui';

import 'package:volleyball/utils/score_provider.dart';

class VictoryGame extends StatelessWidget {
  final String winningTeam;
  final Map<String, int> teamAStats;
  final Map<String, int> teamBStats;

  const VictoryGame({
    super.key,
    required this.winningTeam,
    required this.teamAStats,
    required this.teamBStats,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ScoreProvider scoreProvider = ScoreProvider();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: screenHeight * 0.65,
              width: screenWidth * 0.65,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent, Colors.yellowAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Finish',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text(
                            '$winningTeam wins',
                            style: const TextStyle(fontSize: 20),
                          ),
                          TextButton(
                            onPressed: () {
                              scoreProvider.resetScores();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'New Game',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              EndGameScore(
                                teamName: 'Team A',
                                aceScore: teamAStats['ace']!,
                                attackScore: teamAStats['attack']!,
                                blockScore: teamAStats['block']!,
                                errorScore: teamAStats['error']!,
                                finalScore: teamAStats['final']!,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              EndGameScore(
                                teamName: 'Team B',
                                aceScore: teamBStats['ace']!,
                                attackScore: teamBStats['attack']!,
                                blockScore: teamBStats['block']!,
                                errorScore: teamBStats['error']!,
                                finalScore: teamBStats['final']!,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text('Total time: 1:12\'00\'\''),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

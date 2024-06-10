import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:volleyball/theme/colors.dart';
import 'package:volleyball/ui/widgets/function_buttons.dart';
import 'package:volleyball/ui/widgets/play_zone_game.dart';
import 'package:volleyball/utils/score_provider.dart';

import '../widgets/team_side.dart';
import 'victory_game.dart';

class GameZone extends StatefulWidget {
  final String teamOneName;
  final String teamTwoName;

  const GameZone(
      {super.key, required this.teamOneName, required this.teamTwoName});

  @override
  State<GameZone> createState() => _GameZoneState();
}

class _GameZoneState extends State<GameZone> {
  int teamAAces = 0;
  int teamAAttacks = 0;
  int teamABlocks = 0;
  int teamAErrors = 0;

  int teamBAces = 0;
  int teamBAttacks = 0;
  int teamBBlocks = 0;
  int teamBErrors = 0;

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _navigateToVictoryScreen(BuildContext context, String winner) {
    final scoreProvider = Provider.of<ScoreProvider>(context, listen: false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VictoryGame(
          winningTeam: winner,
          teamAStats: {
            'ace': teamAAces,
            'attack': teamAAttacks,
            'block': teamABlocks,
            'error': teamAErrors,
            'final': scoreProvider.teamAScore,
          },
          teamBStats: {
            'ace': teamBAces,
            'attack': teamBAttacks,
            'block': teamBBlocks,
            'error': teamBErrors,
            'final': scoreProvider.teamBScore,
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundScreenColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Consumer<ScoreProvider>(
            builder: (context, scoreProvider, child) {
              if (scoreProvider.winner.isNotEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _navigateToVictoryScreen(context, scoreProvider.winner);
                });
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          scoreProvider.resetScores();
                          setState(() {
                            teamAAces = 0;
                            teamAAttacks = 0;
                            teamABlocks = 0;
                            teamAErrors = 0;
                            teamBAces = 0;
                            teamBAttacks = 0;
                            teamBBlocks = 0;
                            teamBErrors = 0;
                          });
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        text: 'Ace',
                        onPressed: scoreProvider.winner.isEmpty
                            ? () {
                                scoreProvider.incrementTeamAScore();
                                teamAAces++;
                              }
                            : null,
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        text: 'Attack',
                        onPressed: scoreProvider.winner.isEmpty
                            ? () {
                                scoreProvider.incrementTeamAScore();
                                teamAAttacks++;
                              }
                            : null,
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        text: 'Block',
                        onPressed: scoreProvider.winner.isEmpty
                            ? () {
                                scoreProvider.incrementTeamAScore();
                                teamABlocks++;
                              }
                            : null,
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        text: 'Error',
                        onPressed: scoreProvider.winner.isEmpty
                            ? () {
                                scoreProvider.incrementTeamAScore();
                                teamAErrors++;
                              }
                            : null,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TeamSide(
                              teamName: widget.teamOneName,
                              teamSide: 'A',
                            ),
                            TeamSide(
                              teamName: widget.teamTwoName,
                              teamSide: 'B',
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          PlayZoneGame(
                            width: screenWidth * 0.25,
                            height: screenWidth * 0.2,
                            score: scoreProvider.teamAScore,
                          ),
                          Container(
                            color: Colors.white,
                            height: screenWidth * 0.15,
                            width: 3,
                          ),
                          PlayZoneGame(
                            width: screenWidth * 0.25,
                            height: screenWidth * 0.2,
                            score: scoreProvider.teamBScore,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Gaming Time: 1:14\'00\'\'',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: scoreProvider.winner.isEmpty
                            ? null
                            : () {
                                scoreProvider.resetScores();
                                setState(() {
                                  teamAAces = 0;
                                  teamAAttacks = 0;
                                  teamABlocks = 0;
                                  teamAErrors = 0;
                                  teamBAces = 0;
                                  teamBAttacks = 0;
                                  teamBBlocks = 0;
                                  teamBErrors = 0;
                                });
                              },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Text(
                            'Play Again',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings),
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        iconPosition: IconPosition.right,
                        text: 'Ace',
                        onPressed: scoreProvider.winner.isEmpty
                            ? () {
                                scoreProvider.incrementTeamBScore();
                                teamBAces++;
                              }
                            : null,
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        iconPosition: IconPosition.right,
                        text: 'Attack',
                        onPressed: scoreProvider.winner.isEmpty
                            ? () {
                                scoreProvider.incrementTeamBScore();
                                teamBAttacks++;
                              }
                            : null,
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        iconPosition: IconPosition.right,
                        text: 'Block',
                        onPressed: scoreProvider.winner.isEmpty
                            ? () {
                                scoreProvider.incrementTeamBScore();
                                teamBBlocks++;
                              }
                            : null,
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        iconPosition: IconPosition.right,
                        text: 'Error',
                        onPressed: scoreProvider.winner.isEmpty
                            ? () {
                                scoreProvider.incrementTeamBScore();
                                teamBErrors++;
                              }
                            : null,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volleyball/theme/colors.dart';
import 'package:volleyball/theme/text_styles.dart';
import 'package:volleyball/ui/pages/game_zone.dart';
import 'package:volleyball/ui/pages/new_team.dart';
import 'package:volleyball/ui/widgets/volley_teams.dart';
import 'package:volleyball/utils/team_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundScreenColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            height: screenHeight * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/ui/icons/volleyball.png',
                      height: screenWidth * 0.15,
                      width: screenWidth * 0.15,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Text>[
                          Text(
                            'Volley',
                            style: TextStyle(
                              color: lettersColor,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          Text(
                            'on weekend',
                            style: TextStyle(
                              color: lettersColor,
                              fontSize: 9,
                              height: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: screenWidth * 0.7,
                          width: screenWidth * 0.15,
                          color: const Color.fromRGBO(110, 197, 202, 1),
                          child: const RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'Teams',
                              style: TextStyle(
                                color: lettersColor,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Consumer<TeamProvider>(
                            builder: (context, teamProvider, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: teamProvider.teams.map((team) {
                              return VolleyTeams(
                                teamName: team.name,
                                numberPlayers: team.numberOfPlayers,
                                screenWidth: screenWidth,
                              );
                            }).toList(),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
                const Text(
                  'Match Game',
                  style: TextStyle(
                      color: lettersColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameZone()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.3,
                      vertical: 10,
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
                      'Play',
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
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewTeam()));
        },
        backgroundColor: Colors.blue[800],
        child: const Icon(Icons.add),
      ),
    );
  }
}

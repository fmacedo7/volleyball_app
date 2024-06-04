import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volleyball/theme/colors.dart';
import 'package:volleyball/ui/widgets/function_buttons.dart';
import 'package:volleyball/ui/widgets/landscape_widget.dart';
import 'package:volleyball/ui/widgets/play_zone_game.dart';

import '../widgets/team_side.dart';

class GameZone extends StatelessWidget {
  const GameZone({super.key});

  void _restoreOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        _restoreOrientation();
        return true;
      },
      child: LandscapeWidget(
        child: Scaffold(
          backgroundColor: backgroundScreenColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
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
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        text: 'Ace',
                        onPressed: () {},
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        text: 'Attack',
                        onPressed: () {},
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        text: 'Block',
                        onPressed: () {},
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        text: 'Error',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TeamSide(
                              teamName: 'Ishtar',
                              teamSide: 'A',
                            ),
                            TeamSide(
                              teamName: 'Enkidu',
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
                            score: 1,
                            image: 'assets/ui/icons/volleyball.png',
                          ),
                          Container(
                            color: Colors.white,
                            height: screenWidth * 0.15,
                            width: 3,
                          ),
                          PlayZoneGame(
                            width: screenWidth * 0.25,
                            height: screenWidth * 0.2,
                            score: 3,
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GameZone()));
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
                        onPressed: () {},
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        iconPosition: IconPosition.right,
                        text: 'Attack',
                        onPressed: () {},
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        iconPosition: IconPosition.right,
                        text: 'Block',
                        onPressed: () {},
                      ),
                      FunctionButtons(
                        icon: Icons.add,
                        iconPosition: IconPosition.right,
                        text: 'Error',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

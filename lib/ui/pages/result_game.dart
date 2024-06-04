import 'package:flutter/material.dart';
import 'package:volleyball/theme/colors.dart';
import 'package:volleyball/theme/text_styles.dart';
import 'package:volleyball/ui/widgets/play_zone_game.dart';

class ResultGame extends StatelessWidget {
  const ResultGame({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundScreenColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Column(
                    children: [
                      Icon(
                        Icons.bar_chart,
                        color: iconColor,
                        size: 30,
                      ),
                      Icon(
                        Icons.bar_chart,
                        color: iconColor,
                        size: 30,
                      ),
                      Icon(
                        Icons.bar_chart,
                        color: iconColor,
                        size: 30,
                      ),
                      Icon(
                        Icons.bar_chart,
                        color: iconColor,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Results',
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Row(
                    children: [
                      PlayZoneGame(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.45,
                      ),
                      Container(
                        height: screenHeight * 0.3,
                        color: Colors.white,
                        width: 3,
                      ),
                      PlayZoneGame(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.45,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.4,
                        vertical: 25,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(110, 197, 202, 1),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Row(
                        children: [
                          // Type every text info from the game here
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.insights),
                  ),
                  const Column(
                    children: <Text>[
                      Text(
                        '0:24\'90\'\'',
                        style: timerStyle,
                      ),
                      Text(
                        '0:24\'90\'\'',
                        style: timerStyle,
                      ),
                      Text(
                        '0:24\'90\'\'',
                        style: timerStyle,
                      ),
                      Text(
                        '0:24\'90\'\'',
                        style: timerStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

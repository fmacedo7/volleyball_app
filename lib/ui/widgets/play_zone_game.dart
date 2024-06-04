import 'package:flutter/material.dart';

class PlayZoneGame extends StatelessWidget {
  final double width;
  final double height;
  final int? score;
  final String? image;

  const PlayZoneGame({
    super.key,
    required this.width,
    required this.height,
    this.score,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            Image.asset(
              image!,
              width: 40,
              height: 40,
            ),
          if (score != null)
            Text(
              score.toString(),
              style: const TextStyle(
                fontSize: 70,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
        ],
      ),
    );
  }
}

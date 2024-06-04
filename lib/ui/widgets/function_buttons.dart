import 'package:flutter/material.dart';

class FunctionButtons extends StatelessWidget {
  final IconData icon;
  final String text;
  final IconPosition iconPosition;
  final VoidCallback? onPressed;

  const FunctionButtons(
      {super.key,
      required this.icon,
      required this.text,
      this.iconPosition = IconPosition.left,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[800], // Cor de fundo
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPosition == IconPosition.left) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (iconPosition == IconPosition.right) ...[
            const SizedBox(width: 8),
            Icon(icon, color: Colors.white),
          ],
        ],
      ),
    );
  }
}

enum IconPosition { left, right }
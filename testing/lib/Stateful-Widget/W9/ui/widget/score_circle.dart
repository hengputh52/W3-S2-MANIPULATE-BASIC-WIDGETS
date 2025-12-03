import 'package:flutter/material.dart';

class ScoreCircle extends StatelessWidget {
  final String text;
  final Color backgroundColor;


  const ScoreCircle({
    super.key,
    required this.text,
    required this.backgroundColor,

  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

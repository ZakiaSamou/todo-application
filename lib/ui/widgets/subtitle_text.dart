import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  SubtitleText(this.text,
      {super.key,
      this.size = 19,
      this.weight = FontWeight.w500,
      this.color = const Color(0xFF7E7E7E)});
  String text;
  double size;
  FontWeight weight;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}

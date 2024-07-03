import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText(this.text,
      {super.key, this.size = 22, this.weight = FontWeight.bold, this.color});
  String text;
  double size;
  FontWeight weight;
  Color? color;
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

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/ui/pages/add_task/add_tasl_page.dart';
import 'package:flutter_todo_app/ui/style/colors/app_colors.dart';
import 'package:flutter_todo_app/ui/widgets/Small_text.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {super.key,
      required this.onTap,
      this.height = 60,
      this.width = 130,
      this.color = AppColors.primaryColor,
      required this.text});
  void Function() onTap;
  double height;
  double width;
  Color color;
  String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        child: SmallText(
          text,
          color: Colors.white,
          size: 16,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}

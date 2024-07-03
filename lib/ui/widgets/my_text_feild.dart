import 'package:flutter/material.dart';
import 'package:flutter_todo_app/ui/widgets/big_text.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.title,
      this.hint = '',
      this.suffix,
      required this.controller,
      this.type});
  String title;
  String hint;
  Widget? suffix;
  TextEditingController controller = TextEditingController();
  TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          title,
          size: 15,
        ),
        TextFormField(
          controller: controller,
          keyboardType: type,
          style: TextStyle(
            fontSize: 14,
          ),
          decoration: InputDecoration(
              hintText: hint,
              suffixIcon: suffix,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ],
    );
  }
}

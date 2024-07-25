import '/constants/ui/colors.dart';
import "package:flutter/material.dart";

class BigText extends StatelessWidget {
  BigText({
    super.key,
    required this.text,
    required this.sizeBool,
    required this.colorBool,
  });
  final String text;
  bool sizeBool = true;
  bool colorBool = true;
  double fontSize = 24;
  Color color = AppColors.black;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: sizeBool ? fontSize : fontSize = 16,
          color: colorBool ? color : color = AppColors.gray700,
          fontWeight: FontWeight.bold),
    );
  }
}

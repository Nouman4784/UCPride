import 'package:flutter/material.dart';
import 'package:usama/config/appcolors.dart';

enum ButtonVariant {
  filled,
  bordered,
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonName,
      required this.height,
      required this.width,
      this.type,
      this.onPressed,
      required this.color})
      : super(key: key);

  final ButtonVariant? type;
  final VoidCallback? onPressed;
  final Color color;
  final String buttonName;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final isFilled = type == ButtonVariant.filled;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isFilled ? color : AppColor.primarybackgroundColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: isFilled ? 0 : 2,
            color: color,
          ),
        ),
        child: Center(
            child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: isFilled ? AppColor.primarybackgroundColor : color,
          ),
        )),
      ),
    );
  }
}

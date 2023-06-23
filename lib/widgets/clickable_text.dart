import 'package:flutter/material.dart';
import 'package:usama/config/appcolors.dart';

class ClickableText extends StatelessWidget {
  final void Function()? onPressed;
  final String name;
  final Color? color;
  final double? fontsize;
  final bool underline;
  final FontWeight? weight;

  const ClickableText(
      {Key? key,
      this.onPressed,
      required this.name,
      this.color,
      this.fontsize,
      this.underline = true,
      this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        name,
        style: TextStyle(
            fontSize: 12,
            fontWeight: weight,
            decoration:
                underline ? TextDecoration.underline : TextDecoration.none,
            color: color ?? AppColor.textColor),
      ),
    );
  }
}

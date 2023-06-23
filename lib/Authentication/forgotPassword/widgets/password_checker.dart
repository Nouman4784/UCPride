import 'package:flutter/material.dart';
import 'package:usama/config/appcolors.dart';

class CheckerRow extends StatelessWidget {
  const CheckerRow({Key? key, required this.text, required this.check})
      : super(key: key);
  final String text;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        check
            ? const Icon(Icons.add_reaction_outlined)
            : const Icon(Icons.add_reaction),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            color: check ? AppColor.pri2maryColor : AppColor.pri1maryColor,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomTileAccount extends StatelessWidget {
  final String? iconPath;
  final String title;
  final String subTitle;
  final String? departureLocation;
  final String? madeOfTransportation;
  final String? noOfSeats;
  final Color? titleColor;
  final Color? subTitleColor;
  final double? verticalpadding;
  final double? horizontalpadding;
  final VoidCallback? onPressed;
  final bool isDivider;

  const CustomTileAccount(
      {Key? key,
      this.iconPath,
      required this.title,
      required this.subTitle,
      this.onPressed,
      this.isDivider = true,
      this.departureLocation,
      this.titleColor,
      this.subTitleColor,
      this.verticalpadding,
      this.horizontalpadding,
      this.madeOfTransportation,
      this.noOfSeats})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: verticalpadding ?? 20,
                  horizontal: horizontalpadding ?? 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: titleColor ?? Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                            fontSize: 17, color: subTitleColor ?? Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            if (isDivider)
              const Divider(
                color: Colors.white,
                thickness: 0.5,
              )
          ],
        ),
      ),
    );
  }
}

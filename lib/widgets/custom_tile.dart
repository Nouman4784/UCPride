import 'package:flutter/material.dart';
import 'package:usama/config/appcolors.dart';

class CustomTile extends StatelessWidget {
  final String? iconPath;
  final String title;
  final String? arrivalTime;
  final String? departureLocation;
  final String? madeOfTransportation;
  final String? noOfSeats;
  final Color? titleColor;
  final Color? subTitleColor;
  final double? verticalpadding;
  final double? horizontalpadding;
  final VoidCallback? onPressed;
  final bool isDivider;

  const CustomTile(
      {Key? key,
      this.iconPath,
      required this.title,
      this.arrivalTime,
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
                            color: titleColor ?? AppColor.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                arrivalTime!,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: subTitleColor ?? Colors.black),
                              ),
                              Text(
                                departureLocation!,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: subTitleColor ?? Colors.black),
                              ),
                              Text(
                                madeOfTransportation!,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: subTitleColor ?? Colors.black),
                              ),
                              Text(
                                noOfSeats!,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: subTitleColor ?? Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward)
                ],
              ),
            ),
            if (isDivider)
              const Divider(
                color: Colors.black,
                thickness: 0.5,
              )
          ],
        ),
      ),
    );
  }
}

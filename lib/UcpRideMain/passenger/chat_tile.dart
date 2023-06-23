import 'package:flutter/material.dart';
import 'package:usama/config/appcolors.dart';

enum MessageType { myMessage, otherMessage }

class ChatTile extends StatelessWidget {
  final String name, time, message;
  final MessageType? type;
  const ChatTile(
      {Key? key,
      required this.name,
      required this.time,
      required this.message,
      this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMyMessage = type == MessageType.myMessage;

    TextStyle style1 = TextStyle(
        fontSize: 16, color: AppColor.textColor, fontWeight: FontWeight.w600);
    TextStyle style2 = TextStyle(fontSize: 10, color: AppColor.appGrey);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment:
            isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                isMyMessage ? time : name,
                style: isMyMessage ? style2 : style1,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                isMyMessage ? name : time,
                style: isMyMessage ? style1 : style2,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: isMyMessage
                ? const EdgeInsets.only(left: 10)
                : const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: isMyMessage
                  ? BorderRadius.circular(5)
                      .copyWith(topRight: const Radius.circular(0))
                  : BorderRadius.circular(5)
                      .copyWith(topLeft: const Radius.circular(0)),
              color: isMyMessage
                  ? AppColor.disableshifColor
                  : AppColor.pri1maryColor,
            ),
            child: Text(
              message,
              style: TextStyle(
                  fontSize: 14,
                  color: isMyMessage ? AppColor.textColor : Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

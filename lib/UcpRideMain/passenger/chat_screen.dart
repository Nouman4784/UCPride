import 'package:flutter/material.dart';
import 'package:usama/UcpRideMain/passenger/chat_tile.dart';
import 'package:usama/config/appcolors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primarybackgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 4,
        shadowColor: AppColor.hintTextColor,
        centerTitle: true,
        backgroundColor: AppColor.primarybackgroundColor,
        toolbarHeight: 50,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '03007654321',
              style: TextStyle(
                fontSize: 16,
                color: AppColor.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.pri1maryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20).copyWith(top: 0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: const [
                    ChatTile(
                      type: MessageType.myMessage,
                      name: 'You.',
                      time: '2:49 AM',
                      message:
                          'Where are you?. How long it would take to start the ride?',
                    ),
                    ChatTile(
                      type: MessageType.otherMessage,
                      name: 'Driver',
                      time: '2:50 AM',
                      message: 'On my way. just 15 minutes',
                    )
                  ],
                ),
              ),
            ),
            SafeArea(
                child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: messageTC,
                      cursorColor: AppColor.textColor,
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        fillColor: AppColor.disableshifColor,
                        filled: true,
                        hintText: 'Write a message',
                        hintStyle: TextStyle(
                          color: AppColor.appGrey,
                          fontSize: 16,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: AppColor.disableshifColor),
                    child: const Center(child: Icon(Icons.send)),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

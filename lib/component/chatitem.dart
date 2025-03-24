import 'package:flutter/material.dart';
import 'package:flutter_application_2/component/chatbox.dart';
import 'package:get/get.dart';

import '../controller/chatroomController.dart';

class Chatitem extends StatelessWidget {
  const Chatitem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final Chatroomcontroller controller = Get.find();
    return Container(
      margin: EdgeInsets.all(5),
      // color: const Color.fromARGB(255, 151, 144, 115),
      child: Row(
        mainAxisAlignment:
            controller.messages[index].sender == controller.name.value
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
        children: [Chatbox(index: index)],
      ),
    );
  }
}

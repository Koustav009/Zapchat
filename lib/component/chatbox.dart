import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/chatroomController.dart';

class Chatbox extends StatelessWidget {
  const Chatbox({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final Chatroomcontroller controller = Get.find();

    return Obx(
      () => Container(
        constraints: BoxConstraints(
          minWidth: 80, // Minimum width to avoid small messages collapsing
          maxWidth:
              MediaQuery.of(context).size.width * 0.7, // 70% of screen width
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 250, 202, 178),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment:
              controller.messages[index].sender == controller.name.value
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          children: [
            Text(
              "${controller.messages[index].sender}",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(
              "${controller.messages[index].content}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

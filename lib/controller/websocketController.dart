import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/chatroomController.dart';
import 'package:get/get.dart';
import '../api/websocket.dart';

class Websocketcontroller extends GetxController {
  Websocket socket = Websocket();
  TextEditingController sendMessegeController = TextEditingController();

  final Chatroomcontroller controller = Get.find<Chatroomcontroller>();

  final FocusNode focusnode = FocusNode();
  var iskeyboardopen = false.obs;

  @override
  void onInit() {
    super.onInit();
    focusnode.addListener(() {
      print("focus listener hits....${focusnode.hasFocus}");
      if (focusnode.hasFocus) {
        print("INSIDE IF......focus listener hits....${focusnode.hasFocus}");
        controller.scrollController
            .jumpTo(controller.scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void onClose() {
    focusnode.dispose();
    super.onClose();
  }

  void connectToWebsocket() {
    socket.connectWebSocket();
  }

  void disConnectToWebsocket() {
    socket.disconnect();
  }

  void sendMessaage() {
    // print("Blank or not==== ${sendMessegeController.text.trim()}");
    if (!sendMessegeController.text.trim().isEmpty)
      socket.sendMessage(sendMessegeController.text.trim());
  }
}

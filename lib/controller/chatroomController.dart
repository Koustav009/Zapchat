// import 'dart:io';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/message.dart';

import 'package:get/get.dart';
import '../api/chatRoomApi.dart';

class Chatroomcontroller extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController roomidcontroller = TextEditingController();

  final ScrollController scrollController = ScrollController();

  var roomId = 'xyz'.obs;
  var name = 'xyz'.obs;
  var messages = [].obs;

  final chatRoomApi api = chatRoomApi();
  final message msgmodel = message();
  // final Websocket websocket = Websocket();

  Future<bool> createRoom() async {
    // if(!roomidcontroller.text.trim().isEmpty )
    this.roomId.value = roomidcontroller.text;
    this.name.value = namecontroller.text;
    var response = await api.createRoom(this.roomId.value);
    if (!response.roomId!.contains('error')) {
      //response reciverd successfully
      print("response in controller == ${response.toJson()}");
      messages.value = response.messages ?? [];
      return true;
    } else {
      print("Eror occured... this is controller");
      print("${response.roomId}");
      return false;
    }
  }

  Future<bool> joinRoom() async {
    this.roomId.value = roomidcontroller.text;
    this.name.value = namecontroller.text;
    var response = await api.joinRoom(this.roomId.value);
    if (!response.roomId!.contains('error')) {
      //response reciverd successfully
      print("response in controller == ${response.toJson()}");
      // print("${response.messages?[0]}");
      messages.value = response.messages ?? [];
      return true;
    } else {
      print("Eror occured... this is controller");
      print("${response.roomId}");
      return false;
    }
  }

  void addMessage(message msg) {
    messages.add(msg);
    scrollToBottom();
  }

  void scrollToBottom() {
    Future.delayed(
      Duration(milliseconds: 100),
      () {
        // if (scrollController.hasClients)
        //   scrollController.animateTo(
        //     scrollController.position.maxScrollExtent,
        //     duration: Duration(microseconds: 10),
        //     curve: Curves.easeOut,
        //   );

        if (scrollController.hasClients)
          scrollController.jumpTo(
            scrollController.position.maxScrollExtent,
          );
      },
    );
  }

  void randomRoomId() {
    const String nums = '0123456789';
    Random random = Random();
    roomidcontroller.text =
        List.generate(5, (index) => nums[random.nextInt(nums.length)]).join();
  }
}

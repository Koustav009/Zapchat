import 'dart:convert';

import 'package:flutter_application_2/model/message.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
// import 'package:stomp_dart_client/src/';
import 'package:get/get.dart';

import '../controller/chatroomController.dart';

class Websocket {
  final String wsUrl = "https://api.koustavmanna.tech/chat";
  // final String wsUrl = "http://localhost:8080/chat";

  late StompClient? stompClient;
  final Chatroomcontroller controller = Get.find<Chatroomcontroller>();

  void connectWebSocket() {
    stompClient = StompClient(
      config: StompConfig.sockJS(
          url: wsUrl,
          onConnect: (StompFrame frame) {
            print("Connected to Websocket");
            stompClient!.subscribe(
              destination: '/topic/room/${controller.roomId.value}',
              callback: (StompFrame frame) {
                if (frame.body != null) {
                  print("sent/recived");
                  print("Message : ${frame.body}");

                  Map<String, dynamic> msge = jsonDecode(frame.body!);
                  print("Message json obj : $msge");

                  message mes = message.fromJson(msge);
                  print("Message dart obj : ${mes.toJson()}");

                  // controller.messages.add(mes);
                  controller.addMessage(mes);
                } else {
                  print("Error occured in Websocket file");
                }
              },
            );
          },
          onWebSocketError: (dynamic error) => {
                print("Websocket Eroor : $error"),
              }),
    );
    stompClient!.activate();
  }

  void sendMessage(String messg) {
    if (stompClient != null && stompClient!.connected) {
      final message msg = message(
        sender: '${controller.name.value}',
        content: messg,
        roomId: '${controller.roomId.value}',
      );

      stompClient!.send(
        destination: '/app/sendmessage/${controller.roomId.value}',
        body: jsonEncode(msg.toJson()),
      );
      print("Message send... ${jsonEncode(msg.toJson())}");
    }
  }

  void disconnect() {
    stompClient!.deactivate();
  }
}

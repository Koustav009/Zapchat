import 'package:flutter_application_2/model/message.dart';

class room {
  String? id;
  String? roomId;
  List<dynamic>? messages = [];

  room({
    this.id,
    this.roomId,
    this.messages,
  });

  room.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    roomId = json['roomId'];
    if (json['messages'].length != 0) {
      // messages = <Null>[];
      print("Message IS NOT EMPTY");
      print("${json['messages']}");

      json['messages'].forEach((v) {
        print("message added");
        print(v);
        message mes = message.fromJson(v);
        messages!.add(mes);
      });
    } else {
      print("Message IS EMPTY");
    }
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = <String, dynamic>{};
    return {
      "name": id,
      "roomid": roomId,
      "messages": messages?.map((msg) => msg.toJson()).toList() ?? [],
    };
  }
}

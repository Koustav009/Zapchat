// import 'package:flutter_application_2/controller/chatroomController.dart';

class message {
  String? id;
  String? roomId;
  String? sender;
  String? content;
  String? timestamp;

  message({this.id, this.roomId, this.sender, this.content, this.timestamp});

  message.fromJson(Map<String, dynamic> json) {
    print("message model working");
    id = json['id'];
    roomId = json['roomId'];

    sender = json['sender'];

    content = json['content'];

    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = <String, dynamic>{};
    return {
      "id": id,
      "roomId": roomId,
      "sender": sender,
      "content": content,
      "timestamp": timestamp,
    };
  }
}

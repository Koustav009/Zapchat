import 'package:dio/dio.dart';
import '../model/roomdetails.dart';

class chatRoomApi {
  final Dio _dio = Dio();

  final String baseUrl = "https://api.koustavmanna.tech";

  // room rom = room();

  Future<room> createRoom(String roomId) async {
    try {
      Response response = await _dio.post(
        "$baseUrl/rooms/createroom/$roomId",
      );
      print("Request on = $baseUrl/rooms/createroom/$roomId");
      if (response.statusCode != 200 ||
          response.statusCode != 201 ||
          response.statusCode != 201)
        return room.fromJson(response.data);
      else {
        return room.fromJson(
            {"roomId": "error [${response.statusCode}]", "messages": []});
      }
    } catch (e) {
      print("Error is == : $e Error ends//");
      return room.fromJson(
        {"roomId": "error", "messages": []},
      );
    }
  }

  Future<room> joinRoom(String roomId) async {
    try {
      Response response = await _dio.get(
        "$baseUrl/rooms/joinroom/$roomId",
      );
      print("Request on = $baseUrl/rooms/joinroom/$roomId");
      if (response.statusCode != 200 ||
          response.statusCode != 201 ||
          response.statusCode != 201) {
        return room.fromJson(response.data);
      } else {
        return room.fromJson(
            {"roomId": "error [${response.statusCode}]", "messages": []});
      }
    } catch (e) {
      print("Error is == : $e Error ends//");
      return room.fromJson(
        {"roomId": "error", "messages": []},
      );
    }
  }
}

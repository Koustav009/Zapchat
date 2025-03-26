import 'package:flutter/material.dart';
import '../controller/chatroomController.dart';
import '../controller/websocketController.dart';
import 'package:get/get.dart';

class Roomscreen extends StatelessWidget {
  const Roomscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Chatroomcontroller controller = Get.put(Chatroomcontroller());
    Websocketcontroller socketcontroller = Get.put(Websocketcontroller());

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF6F6F),
            ),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back)),
          ),
        ),
        // toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        backgroundColor: const Color.fromARGB(255, 255, 226, 211),
      ),
      body: Container(
          // width: double.infinity,
          // color: const Color.fromARGB(255, 202, 231, 255),
          child: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Zapchat",
                style: TextStyle(
                  // backgroundColor: Colors.cyan,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF241437),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              TextField(
                  controller: controller.namecontroller,
                  decoration: InputDecoration(

                      // label: Text("Full Name"),
                      hintText: "Enter Your Name",
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 3.5),
                      ))),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "RoomID",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              TextField(
                controller: controller.roomidcontroller,
                // obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.auto_fix_high),
                      onPressed: () {
                        controller.randomRoomId();
                      },
                    ),
                    // label: Text("Full Name"),

                    hintText: "Enter Room id  OR  Click here ---->",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 3.5),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var ok = await controller.createRoom();

                      if (ok) {
                        socketcontroller.connectToWebsocket();
                        Get.toNamed('/chatroom');
                        Get.snackbar(
                          "Success",
                          "You Created The Room",
                          duration: Duration(seconds: 2),
                          titleText: Text(
                            "Success",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          messageText: (Text(
                            "You Created The Room",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                          icon: Icon(Icons.done_all_outlined),
                          backgroundColor:
                              const Color.fromARGB(169, 102, 187, 106),
                        );
                      } else {
                        Get.snackbar(
                            "RoomID Already Exist", "Please Change the RoomID",
                            duration: Duration(seconds: 2),
                            titleText: Text(
                              "RoomID Already Exist",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            messageText: (Text(
                              "Please Change the RoomID",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                            icon: Icon(Icons.error_outline),
                            backgroundColor:
                                const Color.fromARGB(169, 244, 67, 54));
                      }
                    },
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            const WidgetStatePropertyAll(Color(0xFFE8505B))),
                    child: const Text(
                      "Create Room",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var ok = await controller.joinRoom();

                      if (ok) {
                        socketcontroller.connectToWebsocket();
                        Get.toNamed('/chatroom');
                        Get.snackbar(
                          "Success",
                          "You have Entered The Room",
                          duration: Duration(seconds: 2),
                          titleText: Text(
                            "Success",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          messageText: (Text(
                            "You have Entered The Room",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                          icon: Icon(Icons.done),
                          backgroundColor:
                              const Color.fromARGB(169, 102, 187, 106),
                        );
                      } else {
                        Get.snackbar(
                          "No Room Found",
                          "Please Enter Correct RoomID",
                          duration: Duration(seconds: 2),
                          titleText: Text(
                            "No Room Found",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          messageText: (Text(
                            "Please Enter Correct RoomID",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                          icon: Icon(Icons.error_outline),
                          backgroundColor:
                              const Color.fromARGB(169, 244, 67, 54),
                        );
                      }
                    },
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            const WidgetStatePropertyAll(Color(0xFF455A64))),
                    child: const Text(
                      "  Join Room  ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/component/chatitem.dart';
import 'package:flutter_application_2/controller/chatroomController.dart';
import 'package:flutter_application_2/controller/websocketController.dart';
import 'package:get/get.dart';

class chatRoom extends StatelessWidget {
  const chatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final Chatroomcontroller controller = Get.put(Chatroomcontroller());
    final Websocketcontroller socketcontroller = Get.put(Websocketcontroller());

    controller.scrollToBottom();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => {
        if (!didPop)
          {
            Get.defaultDialog(
                // backgroundColor:
                // Theme.of(context).colorScheme.errorContainer,
                title: "Do You Want to Exit?",
                content: const Text(
                  "Are you Sure?",
                  style: TextStyle(fontSize: 20),
                ),
                contentPadding: const EdgeInsets.all(10),
                actions: [
                  TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                            const Color.fromARGB(255, 189, 83, 83)),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Cancel")),
                  const SizedBox(
                    width: 40,
                  ),
                  FilledButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            const Color.fromARGB(255, 189, 83, 83)),
                      ),
                      onPressed: () {
                        // Get.toNamed('/roomdetails');
                        Get.back();
                        Get.back();
                        socketcontroller.disConnectToWebsocket();
                      },
                      child: const Text("Confirm")),
                ])
          }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                    Get.defaultDialog(
                        // backgroundColor:
                        // Theme.of(context).colorScheme.errorContainer,
                        title: "Do You Want to Exit?",
                        content: const Text(
                          "Are you Sure?",
                          style: TextStyle(fontSize: 20),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        actions: [
                          TextButton(
                              style: ButtonStyle(
                                foregroundColor: WidgetStatePropertyAll(
                                    const Color.fromARGB(255, 189, 83, 83)),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("Cancel")),
                          const SizedBox(
                            width: 40,
                          ),
                          FilledButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    const Color.fromARGB(255, 189, 83, 83)),
                              ),
                              onPressed: () {
                                // Get.toNamed('/roomdetails');
                                Get.back();
                                Get.back();
                                socketcontroller.disConnectToWebsocket();
                              },
                              child: const Text("Confirm")),
                        ]);
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
          ),
          title: Obx(
            () => Text(
              "Room:${controller.roomId.value}    User:${controller.name.value}",
              style: TextStyle(fontWeight: FontWeight.w500),
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
          padding: EdgeInsets.all(20),
          // color: Colors.amber,
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () => Container(
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)
                        // color: Colors.red,
                        ),
                    child: Center(
                      child: ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          // print();
                          return Chatitem(
                            index: index,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom -
                        MediaQuery.of(context).viewInsets.bottom),
                // bottom: 2),
                // color: Colors.red,
                child: TextField(
                  focusNode: socketcontroller.focusnode,
                  controller: socketcontroller.sendMessegeController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        socketcontroller.sendMessaage();
                        socketcontroller.sendMessegeController.clear();
                      },
                      icon: Icon(Icons.send_rounded),
                    ),
                    // label: Text("Full Name"),
                    hintText: "Enter Messages",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 3.5),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

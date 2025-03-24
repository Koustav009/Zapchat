import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        backgroundColor: const Color.fromARGB(255, 255, 226, 211),
        // backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        // flexibleSpace: Padding(
        //   padding: EdgeInsets.fromLTRB(35, 45, 0, 0),
        //   child: Container(
        //     // color: Colors.red,
        //     child: const Text(
        //       "",
        //       style: TextStyle(
        //         fontSize: 40,
        //         fontWeight: FontWeight.bold,
        //         color: Color(0xFF241437),
        //       ),
        //     ),
        //   ),
        // ),
        // bottom: Tab(
        //   height: (MediaQuery.of(context).size.height / 5) - 56,
        //   child: Container(
        //     width: double.infinity,
        //     // color: Colors.amber,
        //     padding: EdgeInsets.fromLTRB(35, 30, 20, 20),
        //     child: const Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           "From quick chats to deep conversations ZapChat keeps you connected",
        //           style: TextStyle(
        //               fontWeight: FontWeight.w500,
        //               color: Color(
        //                 0xFF241437,
        //               ),
        //               fontSize: 18),
        //         )
        //       ],
        //     ),
        //     // color: Colors.yellow,
        //   ),
        // ),
      ),
      body: Container(
          width: double.infinity,
          // color: const Color.fromARGB(255, 202, 231, 255),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
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
                Container(
                  // color: Colors.amber,
                  child: Image.asset(
                    'assets/images/homepage.png',
                    height: 350,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Welcome to Zapchat.!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF241437),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "The Seemless Way of Chatting",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF241437),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/signup');
                        Get.toNamed('/signup');
                      },
                      style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              const WidgetStatePropertyAll(Color(0xFFE8505B))),
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/login');
                        Get.toNamed('/login');
                      },
                      style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              const WidgetStatePropertyAll(Color(0xFF455A64))),
                      child: const Text(
                        " Login ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

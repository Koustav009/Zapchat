import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 5),
          child: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  Get.toNamed('/roomdetails');
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
            ],
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
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            // leading: Icon(Icons.arrow_back),
            backgroundColor: const Color.fromARGB(255, 255, 226, 211),
            title: Text(""),
            bottom: Tab(
              height: (MediaQuery.of(context).size.height / 5) - 56,
              child: Container(
                width: double.infinity,
                // color: Colors.amber,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login Your Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF241437),
                      ),
                    ),
                    Text(
                      "Organizing your customes help you create quicker quotes and keep track of them earier ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF241437)),
                    )
                  ],
                ),
                // color: Colors.yellow,
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
          // color: const Color.fromARGB(57, 71, 73, 168),
          child: ListView(children: [
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    // label: Text("Full Name"),
                    hintText: "employee@example.com",
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
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
            TextField(
                obscureText: true,
                decoration: InputDecoration(
                    // label: Text("Full Name"),

                    hintText: "Abc123@#\$",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 3.5),
                    ))),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  backgroundColor:
                      const WidgetStatePropertyAll(Color(0xFFFF6F6F))),
              child: const Text(
                "Submit",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  backgroundColor: const WidgetStatePropertyAll(
                      Color.fromARGB(255, 231, 231, 231))),
              child: const Text(
                "Cancel",
                style: TextStyle(
                    color: Color.fromARGB(255, 77, 77, 77), fontSize: 18),
              ),
            )
          ]),
        ));
  }
}

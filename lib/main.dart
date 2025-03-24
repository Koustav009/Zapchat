import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/chatRoom.dart';
import 'package:flutter_application_2/screens/roomScreen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_2/screens/Login.dart';
import 'package:flutter_application_2/screens/Signup.dart';
import 'package:flutter_application_2/screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/signup': (context) => const CreateAccountscreen(),
        '/login': (context) => const LoginPage(),
        '/roomdetails': (context) => const Roomscreen(),
        '/chatroom': (context) => const chatRoom(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
    );
  }
}

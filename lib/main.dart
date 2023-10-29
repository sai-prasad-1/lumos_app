import 'package:flutter/material.dart';
import 'package:lumos/screens/ChatList.dart';
import 'package:lumos/screens/add_event2.dart';
import 'package:lumos/screens/chatMessages.dart';
import 'package:lumos/screens/home.dart';
import 'package:lumos/screens/home_main.dart';
import 'package:lumos/screens/login.dart';
import 'package:lumos/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lumos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Set the initial route (optional)
      routes: {
        '/': (context) => BottomNavBarExample(), // Home screen
        '/login': (context) => LoginScreen(),
        '/signup':(context)=>SignUpScreen(),
        '/chat-list':(context)=>Notoifications(),
        '/chat':(context)=>ChatScreen(),
        '/add-event':(context)=>AddEvent2(),

      },
    );
  }
}

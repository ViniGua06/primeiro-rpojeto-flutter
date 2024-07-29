import 'package:flutter/material.dart';
import 'package:teste/views/home_view.dart';
import 'package:teste/views/user_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TESTE",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const Home(),
        '/user': (context) => const UserView(),
      },
    );
  }
}

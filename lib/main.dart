// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'main_page.dart';
// import 'trail.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: ChatsPage());
  }
}

//WhatsAppCloneScreen
import 'package:flutter/material.dart';
import 'package:paddock_club/pages/calendar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Paddock.',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: const CalendarPage(),
    );
  }
}

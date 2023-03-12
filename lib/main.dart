import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:paddock_club/pages/calendar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Paddock',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: FlutterSplashScreen.gif(
          backgroundColor: const Color.fromARGB(255, 219, 239, 251),
          gifHeight: 300, 
          gifWidth: 400, 
          gifPath: 'assets/splash.gif',
          defaultNextScreen: const CalendarPage(),
          duration: const Duration(seconds: 5),
        ),
    );
  }
}

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
      title: 'F1 Paddock.',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: const FlutterSplashScreen.gif(
          backgroundColor: Color(0xdbeffb), 
          gifPath: 'assets/splash.gif',
          defaultNextScreen: CalendarPage(),
          duration: const Duration(seconds: 3),
          },
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:teng_go/page-login/splash-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teng-Go App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: fromCssColor('#77CA91'),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}

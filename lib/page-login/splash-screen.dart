import 'dart:async';
import 'package:teng_go/page-login/login.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fromCssColor('#77CA91'),
      body: Center(
        child: Container(
          child: Image.asset('assets/images/teng-go-icon.png', height: 80, width: 300,),
        ),
      ),
    );
  }
}

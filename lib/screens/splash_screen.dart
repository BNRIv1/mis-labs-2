import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: Center(
        child: Text("Clothing Store 201177", style: TextStyle(
            color: Colors.greenAccent[700],
            fontSize: 36.0,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
            fontFamily: "Helvetica"
        ),),
      ),
    );
  }
}
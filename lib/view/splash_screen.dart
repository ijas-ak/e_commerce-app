import 'dart:async';

import 'package:e_commerce_app/view/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    welcome();
  }

  void welcome() async {
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/shopify.png', height: 300)),
          SizedBox(height: 50),
          Center(
            child: SizedBox(
              width: 300,
              child: LinearPercentIndicator(
                percent: 1.0,
                animation: true,
                animationDuration: 3000,
                progressColor: Colors.deepPurple,
                barRadius: Radius.circular(20),
                lineHeight: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

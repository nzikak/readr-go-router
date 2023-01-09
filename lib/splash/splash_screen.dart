import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            "images/readr.png",
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

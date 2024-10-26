import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallet/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/onboarding', (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Container(
          width: 155,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/dark_mode_logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:mannai_user_app/routing/app_router.dart';


class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  void _goNext() {
    Timer(const Duration(seconds: 2), () {
      // Navigate using GoRouter
      context.push(RouteNames.language);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D5F48), // green background
      body: Center(
        child: Image.asset(
          'assets/icons/logo.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

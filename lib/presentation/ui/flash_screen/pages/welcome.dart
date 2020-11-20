import 'package:flutter/material.dart';
import 'package:mob_prog_project/presentation/ui/flash_screen/components/body.dart';

class WelcomeFlashScreen extends StatefulWidget {
  _WelcomeFlashScreen createState() => _WelcomeFlashScreen();
}

class _WelcomeFlashScreen extends State<WelcomeFlashScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Body(),
      );
}

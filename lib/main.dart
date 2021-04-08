import 'package:flutter/material.dart';
import 'Screens/Main Screen.dart';

void main() {
  runApp(AppBody());
}
class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}



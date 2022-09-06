import 'package:flutter/material.dart';
import 'package:debate/screens/guest/Auth.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      home: RegisterScreen(),
    );
  }
}
import 'screens/home/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alexstore24',
      theme: ThemeData(
          primaryColor: const Color(0xffF4F4F4),
          scaffoldBackgroundColor: const Color(0xffF4F4F4)

      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

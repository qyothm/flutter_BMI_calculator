import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/bmi/views/bmi_calculator_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const BmiCalculator(),
    );
  }
}

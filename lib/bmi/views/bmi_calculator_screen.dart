import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentIndex = 0;
  String? result = "";
  String? status = "";
  double? height;
  double? weight;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: const Color(0xfffafafa),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton("Man", Colors.blue, 0),
                  radioButton("Woman", Colors.pink, 1),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Your Height in Cm :",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                keyboardType: TextInputType.number,
                controller: heightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your height in Cm",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Your Weight in Kg :",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your Weight in Kg",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      height = double.parse(heightController.value.text);
                      weight = double.parse(weightController.value.text);
                    });
                    calculateBmi(height, weight);
                  },
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Your BMI is :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "$result",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "$status",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBmi(double? height, double? weight) {
    double finalResult = weight! / (height! * height / 10000);
    String bmi = finalResult.toStringAsFixed(2);
    String? bmiStatus;
    if (currentIndex == 0) {
      if (finalResult < 18.5) bmiStatus = "UNDERWEIGHT";
      if (finalResult >= 18.5 && finalResult <= 24.9) bmiStatus = "NORMAL";
      if (finalResult >= 25 && finalResult <= 29.9) bmiStatus = "OVERWEIGHT";
      if (finalResult >= 30 && finalResult <= 34.9) bmiStatus = "OBESE";
      if (finalResult >= 35) bmiStatus = "EXTREMELY OBESE";
    }

    if (currentIndex == 1) {
      if (finalResult < 18.5) bmiStatus = "UNDERWEIGHT";
      if (finalResult >= 18.5 && finalResult <= 24.9) bmiStatus = "NORMAL";
      if (finalResult >= 25 && finalResult <= 29.9) bmiStatus = "OVERWEIGHT";
      if (finalResult >= 30 && finalResult <= 34.9) bmiStatus = "OBESE";
      if (finalResult >= 35) bmiStatus = "EXTREMELY OBESE";
    }

    setState(() {
      result = bmi;
      status = bmiStatus;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
      heightController.clear();
      weightController.clear();
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: currentIndex == index ? color : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentIndex == index ? Colors.white : color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

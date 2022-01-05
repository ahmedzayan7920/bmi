import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final double result;
  final bool isMale;
  final int age;

  const Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  @override
  _ResultState createState() =>
      _ResultState(result: result, isMale: isMale, age: age);
}

class _ResultState extends State<Result> {
  final double result;
  final bool isMale;
  final int age;

  _ResultState({required this.result, required this.isMale, required this.age});

  String get resultText {
    String text = "";
    if (result < 18.5) {
      text = "Thin";
    } else if (result >= 18.5 && result < 24.9) {
      text = "Normal";
    } else if (result >= 24.9 && result < 30) {
      text = "OverWeight";
    } else {
      text = "Obese";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Gender: ${isMale ? 'Male' : 'Female'}",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                "Result: ${result.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                "Result State: ${resultText}",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                "Age: ${age}",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

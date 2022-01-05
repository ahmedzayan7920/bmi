import 'dart:math';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  Color gestureColor = Colors.blueGrey;
  int age = 20;
  double weight = 60;
  double height = 170;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  expanded1(context, "male"),
                  expanded1(context, "female"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height",
                        style: Theme.of(context).textTheme.headline2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${height}",
                            style: Theme.of(context).textTheme.headline1),
                        Text("  cm",
                            style: Theme.of(context).textTheme.headline2),
                      ],
                    ),
                    Slider(
                        min: 50,
                        max: 250,
                        divisions: 200,
                        value: height,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                expanded2(context, "weight"),
                expanded2(context, "age"),
              ],
            )),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.teal),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 19,
              margin: EdgeInsets.all(12),
              child: ElevatedButton(
                  onPressed: () {
                    result = weight / pow((height / 100), 2);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Result(
                        result: result,
                        age: age,
                        isMale: isMale,
                      );
                    }));
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Expanded expanded1(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == "male") ? true : false;
          });
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(12, 12, 6, 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && type == "male") || (!isMale && type == "female")
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 90,
                color: Colors.white,
              ),
              SizedBox(height: 50),
              Text(
                type == "male" ? "Male" : "Female",
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded expanded2(BuildContext context, String type) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.fromLTRB(12, 12, 6, 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.blueGrey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(type == "weight" ? "Weight" : "Age",
              style: Theme.of(context).textTheme.headline2),
          Text(type == "weight" ? "${weight}" : "${age}",
              style: Theme.of(context).textTheme.headline1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                child: Icon(Icons.remove),
                heroTag: type == "weight" ? "decrease weight" : "decrease age",
                mini: true,
                onPressed: () {
                  setState(() {
                    if (type == "weight") {
                      weight--;
                    } else {
                      age--;
                    }
                  });
                },
              ),
              FloatingActionButton(
                child: Icon(Icons.add),
                heroTag: type == "weight" ? "increase weight" : "increase age",
                mini: true,
                onPressed: () {
                  setState(() {
                    if (type == "weight") {
                      weight++;
                    } else {
                      age++;
                    }
                  });
                },
              ),
            ],
          )
        ],
      ),
    ));
  }
}
